import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import '../models/nin_database.dart';
import '../models/user_database.dart';

final databaseProvider = Provider<NinDatabase>((ref) {
  final db = NinDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final userDatabaseProvider = Provider<UserDatabase>((ref) {
  final db = UserDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final favoritesProvider = StreamProvider<List<String>>((ref) {
  final db = ref.watch(userDatabaseProvider);
  return db.select(db.favorites).watch().map((rows) => rows.map((r) => r.typeId).toList());
});

final typesListProvider = FutureProvider<List<NinType>>((ref) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninTypes)
        ..where((t) => t.parentId.isNull() | t.parentId.equals(''))
        ..orderBy([(t) => OrderingTerm(expression: t.id)]))
      .get();
});

final subTypesProvider = FutureProvider.family<List<NinType>, String>((ref, parentId) async {
  final db = ref.watch(databaseProvider);
  if (parentId.isEmpty) {
    return (db.select(db.ninTypes)
          ..where((t) => t.parentId.isNull() | t.parentId.equals(''))
          ..orderBy([(t) => OrderingTerm(expression: t.id)]))
        .get();
  }
  return (db.select(db.ninTypes)
        ..where((t) => t.parentId.equals(parentId))
        ..orderBy([(t) => OrderingTerm(expression: t.id)]))
      .get();
});

final variablesListProvider = FutureProvider<List<NinVariable>>((ref) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninVariables)..orderBy([(t) => OrderingTerm(expression: t.id)])).get();
});

final subVariablesProvider = FutureProvider.family<List<NinVariable>, String>((ref, parentId) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninVariables)
        ..where((v) => v.parentId.equals(parentId))
        ..orderBy([(t) => OrderingTerm(expression: t.id)]))
      .get();
});

final searchTypesProvider = FutureProvider.family<List<NinType>, String>((ref, query) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninTypes)
        ..where((t) => t.id.like('%$query%') | t.navn.like('%$query%'))
        ..orderBy([(t) => OrderingTerm(expression: t.id)])
        ..limit(50))
      .get();
});

final typesByIdsProvider = FutureProvider.family<List<NinType>, List<String>>((ref, ids) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninTypes)
        ..where((t) => t.id.isIn(ids))
        ..orderBy([(t) => OrderingTerm(expression: t.id)]))
      .get();
});

final variableProvider = FutureProvider.family<NinVariable?, String>((ref, id) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninVariables)..where((v) => v.id.equals(id))).getSingleOrNull();
});

enum ObservationSortMode {
  dateDesc,
  dateAsc,
  typeAlpha,
}

enum MapLayer {
  osm,
  norgeskart,
  openTopo,
}

class MapLayerNotifier extends Notifier<MapLayer> {
  @override
  MapLayer build() => MapLayer.norgeskart; // Default to Norgeskart as it's more relevant for NiN
  
  void setLayer(MapLayer layer) => state = layer;
}

final mapLayerProvider = NotifierProvider<MapLayerNotifier, MapLayer>(MapLayerNotifier.new);

class ObservationSortNotifier extends Notifier<ObservationSortMode> {
  @override
  ObservationSortMode build() => ObservationSortMode.dateDesc;
  
  void setMode(ObservationSortMode mode) => state = mode;
}

final observationSortProvider = NotifierProvider<ObservationSortNotifier, ObservationSortMode>(ObservationSortNotifier.new);

class ObservationWithType {
  final Observation observation;
  final NinType? type;

  ObservationWithType({required this.observation, this.type});
}

final observationsProvider = StreamProvider<List<ObservationWithType>>((ref) {
  final db = ref.watch(userDatabaseProvider);
  final ninDb = ref.watch(databaseProvider);
  final sortMode = ref.watch(observationSortProvider);
  
  final query = db.select(db.observations).join([
    // We can't easily join across different databases in Drift/SQLite without ATCHING
    // Since these are two different database files, we'll do a client-side join for now
    // or we can just fetch the names on demand.
  ]);
  
  // Actually, let's do a simple stream and then map it.
  return db.select(db.observations).watch().asyncMap((obsList) async {
    final result = <ObservationWithType>[];
    for (var obs in obsList) {
      final type = await ninDb.getType(obs.typeId);
      result.add(ObservationWithType(observation: obs, type: type));
    }
    
    // Sort client-side now that we have all data
    switch (sortMode) {
      case ObservationSortMode.dateDesc:
        result.sort((a, b) => b.observation.createdAt.compareTo(a.observation.createdAt));
        break;
      case ObservationSortMode.dateAsc:
        result.sort((a, b) => a.observation.createdAt.compareTo(b.observation.createdAt));
        break;
      case ObservationSortMode.typeAlpha:
        result.sort((a, b) => a.observation.typeId.compareTo(b.observation.typeId));
        break;
    }
    
    return result;
  });
});
