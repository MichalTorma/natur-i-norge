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
  return (db.select(db.ninTypes)..where((t) => t.parentId.isNull())).get();
});

final subTypesProvider = FutureProvider.family<List<NinType>, String>((ref, parentId) async {
  final db = ref.watch(databaseProvider);
  if (parentId.isEmpty) {
    return (db.select(db.ninTypes)..where((t) => t.parentId.isNull())).get();
  }
  return (db.select(db.ninTypes)..where((t) => t.parentId.equals(parentId))).get();
});

final variablesListProvider = FutureProvider<List<NinVariable>>((ref) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninVariables)..where((v) => v.parentId.isNull())).get();
});

final searchTypesProvider = FutureProvider.family<List<NinType>, String>((ref, query) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninTypes)
        ..where((t) => t.id.like('%$query%') | t.navn.like('%$query%'))
        ..limit(50))
      .get();
});
