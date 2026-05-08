import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:archive/archive.dart';

QueryExecutor openConnection() {
  return LazyDatabase(() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final dbFile = File(p.join(docsDir.path, 'nin_database.sqlite'));
    final imagesDir = Directory(p.join(docsDir.path, 'images'));

    print('DEBUG: Syncing database from assets...');
    try {
      final data = await rootBundle.load('assets/nin_database.sqlite');
      print('DEBUG: Loaded asset size: ${data.lengthInBytes} bytes');
      await dbFile.writeAsBytes(data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
      print('DEBUG: Written to: ${dbFile.path}');
    } catch (e) {
      print('DEBUG ERROR: Database sync failed: $e');
    }

    print('DEBUG: Syncing images...');
    if (!await imagesDir.exists() || (await imagesDir.list().length) < 10) {
      try {
        await imagesDir.create(recursive: true);
        final data = await rootBundle.load('assets/images.zip');
        final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        
        final archive = ZipDecoder().decodeBytes(bytes);
        print('DEBUG: Extracting ${archive.length} files...');
        for (final file in archive) {
          final filename = file.name;
          if (file.isFile) {
            final data = file.content as List<int>;
            File(p.join(imagesDir.path, filename))
              ..createSync(recursive: true)
              ..writeAsBytesSync(data);
          }
        }
        print('DEBUG: Images extracted.');
      } catch (e) {
        print('DEBUG ERROR: Image extraction failed: $e');
      }
    } else {
      print('DEBUG: Using cached images.');
    }

    return NativeDatabase.createInBackground(dbFile);
  });
}
