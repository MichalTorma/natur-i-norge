import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/nin_database.dart';
import 'database_provider.dart';

const gadHovedtypeId = 'NA-TB01';

class GadSelectedSpeciesNotifier extends Notifier<List<String>> {
  @override
  List<String> build() => [];

  void add(String speciesId) {
    if (state.contains(speciesId)) return;
    state = [...state, speciesId];
  }

  void remove(String speciesId) {
    state = state.where((id) => id != speciesId).toList();
  }

  void clear() {
    state = [];
  }
}

final gadSelectedSpeciesProvider =
    NotifierProvider<GadSelectedSpeciesNotifier, List<String>>(
  GadSelectedSpeciesNotifier.new,
);

final gadSpeciesSearchProvider =
    FutureProvider.family<List<NinSpecy>, String>((ref, query) async {
  final db = ref.watch(databaseProvider);
  final trimmed = query.trim();
  final select = db.select(db.ninSpecies)
    ..orderBy([(s) => OrderingTerm(expression: s.nameLatin)]);
  if (trimmed.isEmpty) {
    select.limit(40);
  } else {
    select
      ..where(
        (s) =>
            s.nameLatin.like('%$trimmed%') |
            s.nameNb.like('%$trimmed%'),
      )
      ..limit(40);
  }
  return select.get();
});

/// Median constancy (0–6) keyed by "ka|uf|vm" for the current species selection.
final gadConstancyMapProvider = FutureProvider<Map<String, double>>((ref) async {
  final speciesIds = ref.watch(gadSelectedSpeciesProvider);
  if (speciesIds.isEmpty) return {};

  final db = ref.watch(databaseProvider);
  final rows = await (db.select(db.ninSpeciesGad)
        ..where(
          (g) =>
              g.hovedtypeId.equals(gadHovedtypeId) &
              g.speciesId.isIn(speciesIds),
        ))
      .get();

  final buckets = <String, List<double>>{};
  for (final row in rows) {
    final key =
        '${row.lmKaTrinn}|${row.lmUfTrinn}|${row.lmVmTrinn}';
    buckets.putIfAbsent(key, () => []).add(row.constancyM7.toDouble());
  }

  return {
    for (final entry in buckets.entries)
      entry.key: _median(entry.value),
  };
});

double _median(List<double> values) {
  if (values.isEmpty) return 0;
  final sorted = [...values]..sort();
  final mid = sorted.length ~/ 2;
  if (sorted.length.isOdd) return sorted[mid];
  return (sorted[mid - 1] + sorted[mid]) / 2;
}

final gadSelectedSpeciesDetailsProvider = FutureProvider<List<NinSpecy>>((ref) async {
  final ids = ref.watch(gadSelectedSpeciesProvider);
  if (ids.isEmpty) return [];
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninSpecies)..where((s) => s.id.isIn(ids))).get();
});
