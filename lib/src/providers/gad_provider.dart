import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/nin_database.dart';
import 'database_provider.dart';

/// GAD matrix data in the database is only collected for this hovedtype (v2.3 T-4).
const gadDataSourceHovedtypeId = 'NA-TB01';

/// Hovedtyper that share LM-KA × LM-UF × LM-VM with [gadDataSourceHovedtypeId].
const gadCompatibleHovedtypeIds = {
  'NA-TB01', // Fastmarksskogsmark — native GAD source
  'NA-TA02', // Åpen grunnlendt mark
  'NA-TA03', // Arktisk-alpin hei og leside
  'NA-TH01', // Avskoget hei og eng
  'NA-TK03', // Kystlynghei
};

bool isGadCompatibleHovedtype(String? id) =>
    id != null && gadCompatibleHovedtypeIds.contains(id);

bool isGadNativeHovedtype(String? id) => id == gadDataSourceHovedtypeId;

/// @deprecated Use [gadDataSourceHovedtypeId].
const gadHovedtypeId = gadDataSourceHovedtypeId;

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

class GadOverlayVisibleNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  void setVisible(bool visible) => state = visible;
}

final gadOverlayVisibleProvider =
    NotifierProvider<GadOverlayVisibleNotifier, bool>(
  GadOverlayVisibleNotifier.new,
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
              g.hovedtypeId.equals(gadDataSourceHovedtypeId) &
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
