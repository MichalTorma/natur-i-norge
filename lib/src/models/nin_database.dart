import 'drift/connection.dart';
import 'package:drift/drift.dart';

part 'nin_database.g.dart';

class NinTypes extends Table {
  TextColumn get id => text()();
  TextColumn get navn => text()();
  TextColumn get kategori => text()(); // Type, Hovedtypegruppe, Hovedtype, etc.
  TextColumn get parentId => text().nullable()();
  TextColumn get ecosystnivaaNavn => text().nullable()();
  TextColumn get typekategoriNavn => text().nullable()();
  TextColumn get langkode => text().nullable()();
  TextColumn get definisjon => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get lkmData => text().nullable()();
  TextColumn get scale => text().nullable()();
  TextColumn get containsTypes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class NinVariables extends Table {
  TextColumn get id => text()();
  TextColumn get navn => text()();
  TextColumn get kategori => text()();
  TextColumn get parentId => text().nullable()();
  TextColumn get ecosystnivaaNavn => text().nullable()();
  TextColumn get variabelkategoriNavn => text().nullable()();
  TextColumn get langkode => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get stepsJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class NinConversions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get kode => text()();
  TextColumn get forrigeKode => text()();
  TextColumn get klasseNavn => text()();
  TextColumn get forrigeVersjon => text()();
  TextColumn get url => text().nullable()();
}

class NinSpecies extends Table {
  TextColumn get id => text()();
  IntColumn get gbifId => integer().nullable()();
  TextColumn get nameLatin => text()();
  TextColumn get nameNb => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class NinSpeciesGad extends Table {
  TextColumn get hovedtypeId => text()();
  TextColumn get speciesId => text().references(NinSpecies, #id)();
  TextColumn get lmKaTrinn => text()();
  TextColumn get lmUfTrinn => text()();
  TextColumn get lmVmTrinn => text()();
  IntColumn get constancyM7 => integer()();

  @override
  Set<Column> get primaryKey => {hovedtypeId, speciesId, lmKaTrinn, lmUfTrinn, lmVmTrinn};
}

@DriftDatabase(tables: [NinTypes, NinVariables, NinConversions, NinSpecies, NinSpeciesGad])
class NinDatabase extends _$NinDatabase {
  NinDatabase() : super(openConnection());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      // For pre-populated DBs, we don't necessarily want to create all
      // but Drift needs the internal metadata.
    },
    onUpgrade: (m, from, to) async {
      if (from < 5) {
        await m.createTable(ninSpecies);
        await m.createTable(ninSpeciesGad);
      }
    },
  );

  Future<NinType?> getType(String id) => (select(ninTypes)..where((t) => t.id.equals(id))).getSingleOrNull();
}
