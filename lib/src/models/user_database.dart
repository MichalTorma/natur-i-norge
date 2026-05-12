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
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  TextColumn get cloudUrl => text().nullable()();
  TextColumn get ownerUid => text().nullable()();
}

@DriftDatabase(tables: [Favorites, Observations])
class UserDatabase extends _$UserDatabase {
  UserDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
      onUpgrade: (m, from, to) async {
        if (from < 2) {
          await m.createTable(observations);
        }
        if (from < 3) {
          await m.addColumn(observations, observations.isSynced);
          await m.addColumn(observations, observations.cloudUrl);
        }
        if (from < 4) {
          await m.addColumn(observations, observations.ownerUid);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'user_data.sqlite'));
    return NativeDatabase(file);
  });
}
