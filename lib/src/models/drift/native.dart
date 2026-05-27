import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/services.dart' show rootBundle;
import '../../services/app_storage.dart';

QueryExecutor openConnection() {
  return LazyDatabase(() async {
    await AppStorage.instance.ensureInitialized();

    final docsDir = await getApplicationDocumentsDirectory();
    final dbFile = File(p.join(docsDir.path, 'nin_database.sqlite'));

    print('DEBUG: Syncing database from assets...');
    try {
      final data = await rootBundle.load('assets/nin_database.sqlite');
      print('DEBUG: Loaded asset size: ${data.lengthInBytes} bytes');
      await dbFile.writeAsBytes(data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
      print('DEBUG: Written to: ${dbFile.path}');
    } catch (e) {
      print('DEBUG ERROR: Database sync failed: $e');
    }

    return NativeDatabase.createInBackground(dbFile);
  });
}
