import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Ensures GAD species data is present after a schema v4 → v5 migration.
///
/// Native clients receive a pre-populated [assets/nin_database.sqlite] on each
/// launch, so this is typically a no-op there. Devices that upgraded in-place
/// (empty [nin_species_gad] after migration) copy from [assets/gad_na_tb01.sqlite].
Future<void> ensureGadPopulated(QueryExecutor executor) async {
  if (!await _tableExists(executor, 'nin_species_gad')) return;

  final countRow = await executor.runSelect(
    "SELECT COUNT(*) AS c FROM nin_species_gad WHERE hovedtype_id = 'NA-TB01'",
    [],
  );
  final existing = countRow.first['c'] as int? ?? 0;
  if (existing > 0) return;

  if (kIsWeb) {
    debugPrint(
      'GAD migration: web clients need a full database refresh for GAD data.',
    );
    return;
  }

  debugPrint('GAD migration: populating NA-TB01 species matrix from sidecar asset');

  final sidecarBytes = await rootBundle.load('assets/gad_na_tb01.sqlite');
  final tempDir = await getTemporaryDirectory();
  final sidecarPath = p.join(tempDir.path, 'gad_na_tb01_migration.sqlite');

  await File(sidecarPath).writeAsBytes(
    sidecarBytes.buffer.asUint8List(
      sidecarBytes.offsetInBytes,
      sidecarBytes.lengthInBytes,
    ),
    flush: true,
  );

  await executor.runCustom('DELETE FROM nin_species_gad WHERE hovedtype_id = ?', ['NA-TB01']);
  await executor.runCustom('DELETE FROM nin_species');
  await executor.runCustom('ATTACH DATABASE ? AS gad_src', [sidecarPath]);
  await executor.runCustom(
    'INSERT INTO nin_species (id, gbif_id, name_latin, name_nb) '
    'SELECT id, gbif_id, name_latin, name_nb FROM gad_src.nin_species',
  );
  await executor.runCustom(
    'INSERT INTO nin_species_gad '
    '(hovedtype_id, species_id, lm_ka_trinn, lm_uf_trinn, lm_vm_trinn, constancy_m7) '
    'SELECT hovedtype_id, species_id, lm_ka_trinn, lm_uf_trinn, lm_vm_trinn, constancy_m7 '
    'FROM gad_src.nin_species_gad',
  );
  await executor.runCustom('DETACH DATABASE gad_src');
  await File(sidecarPath).delete();
}

Future<bool> _tableExists(QueryExecutor executor, String table) async {
  final rows = await executor.runSelect(
    "SELECT name FROM sqlite_master WHERE type = 'table' AND name = ?",
    [table],
  );
  return rows.isNotEmpty;
}
