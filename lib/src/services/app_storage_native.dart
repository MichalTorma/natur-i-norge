import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'app_storage_stub.dart';

AppStorage createAppStorage() => NativeAppStorage();

class NativeAppStorage implements AppStorage {
  bool _initialized = false;

  @override
  Future<void> ensureInitialized() async {
    if (_initialized) return;

    final docsDir = await getApplicationDocumentsDirectory();
    final imagesDir = Directory(p.join(docsDir.path, 'images'));
    if (!await imagesDir.exists() || (await imagesDir.list().length) < 10) {
      await imagesDir.create(recursive: true);
      final data = await rootBundle.load('assets/images.zip');
      final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      final archive = ZipDecoder().decodeBytes(bytes);
      for (final file in archive) {
        if (file.isFile) {
          File(p.join(imagesDir.path, file.name))
            ..createSync(recursive: true)
            ..writeAsBytesSync(file.content as List<int>);
        }
      }
    }

    final observationsDir = Directory(p.join(docsDir.path, 'observations'));
    if (!await observationsDir.exists()) {
      await observationsDir.create(recursive: true);
    }

    _initialized = true;
  }

  Future<File> _resolveFile(String path) async {
    final docsDir = await getApplicationDocumentsDirectory();
    return File(p.join(docsDir.path, path));
  }

  @override
  Future<bool> exists(String path) async {
    return _resolveFile(path).then((file) => file.exists());
  }

  @override
  Future<List<int>?> readBytes(String path) async {
    final file = await _resolveFile(path);
    if (!await file.exists()) return null;
    return file.readAsBytes();
  }

  @override
  Future<void> writeBytes(String path, List<int> bytes) async {
    final file = await _resolveFile(path);
    await file.parent.create(recursive: true);
    await file.writeAsBytes(bytes, flush: true);
  }

  @override
  Future<void> delete(String path) async {
    final file = await _resolveFile(path);
    if (await file.exists()) {
      await file.delete();
    }
  }

  @override
  Future<String> saveObservationImage(List<int> bytes) async {
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final path = p.join('observations', fileName);
    await writeBytes(path, bytes);
    final docsDir = await getApplicationDocumentsDirectory();
    return p.join(docsDir.path, path);
  }

  @override
  Future<List<int>?> readTypeImage(String imageUrl) async {
    return readBytes(p.join('images', imageUrl));
  }
}
