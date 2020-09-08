import 'dart:io';
import 'dart:ui';

import 'package:flutter/services.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:moor/moor.dart';
// These imports are only needed to open the database
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'nin_db.g.dart';

@UseMoor(
  // relative import for the moor file. Moor also supports `package:`
  // imports
  daos: [],
  include: {'schema.moor'},
)
class NiNDatabase extends _$NiNDatabase {
  NiNDatabase() : super(_openConnection());
  // query's definitions
  Future<List<NinMajorTypeGroupData>> get allMajorTypeGroups =>
      select(ninMajorTypeGroup).get();

  Future<NinMajorTypeGroupInfoData> getMajorTypeGroupInfoData(
      NinMajorTypeGroupData mtg, Locale locale) async {
    var res = (select(ninMajorTypeGroupInfo)
      ..where((tbl) => tbl.majorTypeGroupId.equals(mtg.id))
      ..where((tbl) => tbl._languageId.equals(locale.languageCode)));
    return res.getSingle();
  }

  @override
  int get schemaVersion => 2;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFile = await rootBundle.load('assets/nin_database.db');
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'nin_database.sqlite'));
    await file.writeAsBytes(dbFile.buffer.asUint8List());
    return VmDatabase(file);
  });
}
