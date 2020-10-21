import 'dart:io';
import 'dart:ui';

import 'package:flutter/services.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:moor/moor.dart';
// These imports are only needed to open the database
import 'package:moor/ffi.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
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

  Future<List<Detailed<NinMajorTypeData>>> filteredMajorTypes(
      String majorTypeGroupId, Locale locale) async {
    var majorTypes = await (select(ninMajorType)
          ..where((tbl) => tbl._majorTypeGroupId.equals(majorTypeGroupId)))
        .get();
    var res = majorTypes
        .map((e) =>
            Detailed(data: e, db: this, detailId: e.detailId, locale: locale))
        .toList();
    return res;
  }

  Future<List<NinDetailData>> getDetails(String detailId, Locale locale) async {
    var res = (select(ninDetail)
      ..where((tbl) => tbl._id.equals(detailId))
      ..where((tbl) => tbl._languageId.equals(locale.languageCode)));
    return res.get();
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
    final file = File(p.join(dbFolder.path, 'nin.sqlite'));
    await file.writeAsBytes(dbFile.buffer.asUint8List());
    return VmDatabase(file);
  });
}
