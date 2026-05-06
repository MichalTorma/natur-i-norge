import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/nin_database.dart';
import '../services/nin_api_service.dart';

final databaseProvider = Provider<NinDatabase>((ref) {
  final db = NinDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final apiServiceProvider = Provider<NinApiService>((ref) {
  return NinApiService();
});

final typesListProvider = FutureProvider<List<NinType>>((ref) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninTypes)..where((t) => t.parentId.isNull())).get();
});

final subTypesProvider = FutureProvider.family<List<NinType>, String>((ref, parentId) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninTypes)..where((t) => t.parentId.equals(parentId))).get();
});

final variablesListProvider = FutureProvider<List<NinVariable>>((ref) async {
  final db = ref.watch(databaseProvider);
  return (db.select(db.ninVariables)..where((v) => v.parentId.isNull())).get();
});
