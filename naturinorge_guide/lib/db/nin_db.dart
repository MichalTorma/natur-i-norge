import 'dart:io';

import 'package:flutter/services.dart';
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
  Future<List<NinMajorTypeGroupData>> get allMajorTypeGroups =>
      select(ninMajorTypeGroup).get();

  @override
  int get schemaVersion => 1;
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
