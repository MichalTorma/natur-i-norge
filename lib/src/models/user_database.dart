import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'user_database.g.dart';

class Favorites extends Table {
  TextColumn get typeId => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {typeId};
}

class Observations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get typeId => text()(); // The NiN type code
  TextColumn get imagePath => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  RealColumn get altitude => real().nullable()();
  RealColumn get accuracy => real()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get observerName => text().nullable()();
  TextColumn get notes => text().nullable()();
}

@DriftDatabase(tables: [Favorites, Observations])
class UserDatabase extends _$UserDatabase {
  UserDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'user_data.sqlite'));
    return NativeDatabase(file);
  });
}
