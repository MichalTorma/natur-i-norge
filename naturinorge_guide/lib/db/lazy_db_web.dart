import 'package:flutter/services.dart';
import 'package:moor/backends.dart';
import 'package:moor/moor_web.dart';

dynamic getLazyDb() {
  return WebDatabase(
    'nin.sqlite',
    initializer: () async {
      final dbFile = await rootBundle.load('assets/nin_database.db');
      return dbFile.buffer.asUint8List();
    },
  );
}
