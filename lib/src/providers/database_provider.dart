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
  return (db.select(db.ninTypes)..where((t) => t.parentId.isNull() | t.parentId.equals(''))).get();
});

final subTypesProvider = FutureProvider.family<List<NinType>, String>((ref, parentId) async {
  final db = ref.watch(databaseProvider);
  if (parentId.isEmpty) {
    return (db.select(db.ninTypes)..where((t) => t.parentId.isNull() | t.parentId.equals(''))).get();
  }
  return (db.select(db.ninTypes)..where((t) => t.parentId.equals(parentId))).get();
});

final variablesListProvider = FutureProvider<List<NinVariable>>((ref) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninVariables)..orderBy([(t) => OrderingTerm(expression: t.id)])).get();
});

final subVariablesProvider = FutureProvider.family<List<NinVariable>, String>((ref, parentId) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninVariables)..where((v) => v.parentId.equals(parentId))).get();
});

final searchTypesProvider = FutureProvider.family<List<NinType>, String>((ref, query) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninTypes)
        ..where((t) => t.id.like('%$query%') | t.navn.like('%$query%'))
        ..limit(50))
      .get();
});

final typesByIdsProvider = FutureProvider.family<List<NinType>, List<String>>((ref, ids) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninTypes)..where((t) => t.id.isIn(ids))).get();
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

class ObservationSortNotifier extends Notifier<ObservationSortMode> {
  @override
  ObservationSortMode build() => ObservationSortMode.dateDesc;
  
  void setMode(ObservationSortMode mode) => state = mode;
}

final observationSortProvider = NotifierProvider<ObservationSortNotifier, ObservationSortMode>(ObservationSortNotifier.new);

final observationsProvider = StreamProvider<List<Observation>>((ref) {
  final db = ref.watch(userDatabaseProvider);
  final sortMode = ref.watch(observationSortProvider);
  
  final query = db.select(db.observations);
  
  switch (sortMode) {
    case ObservationSortMode.dateDesc:
      query.orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]);
      break;
    case ObservationSortMode.dateAsc:
      query.orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc)]);
      break;
    case ObservationSortMode.typeAlpha:
      query.orderBy([(t) => OrderingTerm(expression: t.typeId, mode: OrderingMode.asc)]);
      break;
  }
  
  return query.watch();
});
