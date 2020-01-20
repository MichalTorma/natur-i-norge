import 'package:flutter/services.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'db_description.g.dart';

class T4 extends Table {
  IntColumn get index => integer().named('index').autoIncrement()();
  TextColumn get c_NyRad => text().named('c_NyRad').withLength(min: 1, max: 256)();
  TextColumn get c_Artsgruppe => text().named('c_Artsgruppe').withLength(min: 1, max: 256)();
  TextColumn get c_Art => text().named('c_Art').withLength(min: 1, max: 256)();
  TextColumn get c_Autor => text().named('c_Autor').withLength(min: 1, max: 256)();
  TextColumn get c_NorskNavn => text().named('c_NorskNavn').withLength(min: 1, max: 256)();
  TextColumn get c_X => text().named('c_X').withLength(min: 1, max: 256)();
  TextColumn get c_Artskode => text().named('c_Artskode').withLength(min: 1, max: 256)();
  IntColumn get c_11 => integer().nullable()();
  IntColumn get c_12 => integer().nullable()();
  IntColumn get c_13 => integer().nullable()();
  IntColumn get c_14 => integer().nullable()();
  IntColumn get c_15 => integer().nullable()();
  IntColumn get c_16 => integer().nullable()();
  IntColumn get c_17 => integer().nullable()();
  IntColumn get c_18 => integer().nullable()();
  IntColumn get c_21 => integer().nullable()();
  IntColumn get c_22 => integer().nullable()();
  IntColumn get c_23 => integer().nullable()();
  IntColumn get c_24 => integer().nullable()();
  IntColumn get c_25 => integer().nullable()();
  IntColumn get c_26 => integer().nullable()();
  IntColumn get c_27 => integer().nullable()();
  IntColumn get c_28 => integer().nullable()();
  IntColumn get c_31 => integer().nullable()();
  IntColumn get c_32 => integer().nullable()();
  IntColumn get c_33 => integer().nullable()();
  IntColumn get c_34 => integer().nullable()();
  IntColumn get c_35 => integer().nullable()();
  IntColumn get c_36 => integer().nullable()();
  IntColumn get c_37 => integer().nullable()();
  IntColumn get c_38 => integer().nullable()();
  IntColumn get c_41 => integer().nullable()();
  IntColumn get c_42 => integer().nullable()();
  IntColumn get c_43 => integer().nullable()();
  IntColumn get c_44 => integer().nullable()();
  IntColumn get c_45 => integer().nullable()();
  IntColumn get c_46 => integer().nullable()();
  IntColumn get c_47 => integer().nullable()();
  IntColumn get c_48 => integer().nullable()();
  IntColumn get c_51 => integer().nullable()();
  IntColumn get c_52 => integer().nullable()();
  IntColumn get c_53 => integer().nullable()();
  IntColumn get c_54 => integer().nullable()();
  IntColumn get c_55 => integer().nullable()();
  IntColumn get c_56 => integer().nullable()();
  IntColumn get c_57 => integer().nullable()();
  IntColumn get c_58 => integer().nullable()();
  IntColumn get c_61 => integer().nullable()();
  IntColumn get c_62 => integer().nullable()();
  IntColumn get c_63 => integer().nullable()();
  IntColumn get c_64 => integer().nullable()();
  IntColumn get c_65 => integer().nullable()();
  IntColumn get c_66 => integer().nullable()();
  IntColumn get c_67 => integer().nullable()();
  IntColumn get c_68 => integer().nullable()();
  IntColumn get c_71 => integer().nullable()();
  IntColumn get c_72 => integer().nullable()();
  IntColumn get c_73 => integer().nullable()();
  IntColumn get c_74 => integer().nullable()();
  IntColumn get c_75 => integer().nullable()();
  IntColumn get c_76 => integer().nullable()();
  IntColumn get c_77 => integer().nullable()();
  IntColumn get c_78 => integer().nullable()();
  IntColumn get c_81 => integer().nullable()();
  IntColumn get c_82 => integer().nullable()();
  IntColumn get c_83 => integer().nullable()();
  IntColumn get c_84 => integer().nullable()();
  IntColumn get c_85 => integer().nullable()();
  IntColumn get c_86 => integer().nullable()();
  IntColumn get c_87 => integer().nullable()();
  IntColumn get c_88 => integer().nullable()();
  IntColumn get c_K3 => integer().named('c_K3').nullable()();
  IntColumn get c_K4 => integer().named('c_K4').nullable()();
  IntColumn get c_K5 => integer().named('c_K5').nullable()();
  IntColumn get c_K6 => integer().named('c_K6').nullable()();
  IntColumn get c_K7 => integer().named('c_K7').nullable()();
  IntColumn get c_K8 => integer().named('c_K8').nullable()();
  IntColumn get c_V37 => integer().named('c_V37').nullable()();
  IntColumn get c_V38 => integer().named('c_V38').nullable()();
  IntColumn get c_V47 => integer().named('c_V47').nullable()();
  IntColumn get c_V48 => integer().named('c_V48').nullable()();
  IntColumn get c_V57 => integer().named('c_V57').nullable()();
  IntColumn get c_V58 => integer().named('c_V58').nullable()();
  IntColumn get c_V67 => integer().named('c_V67').nullable()();
  IntColumn get c_V68 => integer().named('c_V68').nullable()();
  RealColumn get c_RU => real().named('c_RU').nullable()();
  RealColumn get c_SU => real().named('c_SU').nullable()();
  RealColumn get c_SS => real().named('c_SS').nullable()();
  RealColumn get c_HI => real().named('c_HI').nullable()();
  RealColumn get c_VMfmax => real().named('c_VMfmax').nullable()();
  RealColumn get c_VMfmin => real().named('c_VMfmin').nullable()();
  IntColumn get c_VFrmax => integer().named('c_VFrmax').nullable()();
  IntColumn get c_VFrmin => integer().named('c_VFrmin').nullable()();
  IntColumn get c_Unnamed93 => integer().named('c_Unnamed93').nullable()();
  TextColumn get c_Unnamed94 => text().named('c_Unnamed94').nullable()();
  TextColumn get c_VM => text().named('c_VM').nullable()();
  TextColumn get c_HI1 => text().named('c_HI1').nullable()();
  TextColumn get c_RU1 => text().named('c_RU1').nullable()();
  TextColumn get c_SU1 => text().named('c_SU1').nullable()();
  TextColumn get c_SS1 => text().named('c_SS1').nullable()();
  TextColumn get c_VS => text().named('c_VS').nullable()();
  TextColumn get c_UE => text().named('c_UE').nullable()();
  TextColumn get c_BK => text().named('c_BK').nullable()();
  TextColumn get c_DK => text().named('c_DK').nullable()();
}

final executor = FlutterQueryExecutor.inDatabaseFolder(
  path: 'nin_from_assets7.db',
  singleInstance: true,
  creator: (file) async {
    final content = await rootBundle.load('assets/nin.db');
    await file.writeAsBytes(content.buffer.asUint8List());
  },
);

@UseMoor(tables: [T4], daos: [T4Dao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(executor);

  @override
  int get schemaVersion => 1;

  // @override
  // MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) {
  //       return m.createAllTables();
  //     }, onUpgrade: (Migrator m, int from, int to) async {
  //       // we added the dueDate property in the change from version 1
  //       await m.deleteTable('T4');
        
  //     });
}

@UseDao(tables: [T4])
class T4Dao extends DatabaseAccessor<MyDatabase> with _$T4DaoMixin {
  T4Dao(MyDatabase db) : super(db);
  Future<List<T4Data>> get allT4 => select(t4).get();
  Future<List<T4Data>> filteredT4(String mask) {
    return (select(t4)..where((t) => t.c_Art.like('%$mask%') | t.c_NorskNavn.like('%$mask%'))).get();
  }
}
