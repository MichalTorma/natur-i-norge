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

    // 1. Copy/Update Database from assets
    // In development, we force overwrite to ensure LKM data is synced
    try {
      final data = await rootBundle.load('assets/nin_database.sqlite');
      await dbFile.writeAsBytes(data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
    } catch (e) {
      print('Error syncing DB asset: $e');
    }

    // 2. Extract Images (Force refresh if images dir is empty or needed)
    if (!await imagesDir.exists() || (await imagesDir.list().length) < 10) {
      try {
        await imagesDir.create(recursive: true);
        final data = await rootBundle.load('assets/images.zip');
        final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        
        final archive = ZipDecoder().decodeBytes(bytes);
        for (final file in archive) {
          final filename = file.name;
          if (file.isFile) {
            final data = file.content as List<int>;
            File(p.join(imagesDir.path, filename))
              ..createSync(recursive: true)
              ..writeAsBytesSync(data);
          }
        }
      } catch (e) {
        print('Error extracting images: $e');
      }
    }

    return NativeDatabase.createInBackground(dbFile);
  });
}
