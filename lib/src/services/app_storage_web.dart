import 'package:archive/archive.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;

import 'app_storage_stub.dart';

AppStorage createAppStorage() => WebAppStorage();

class WebAppStorage implements AppStorage {
  bool _initialized = false;
  final Map<String, List<int>> _files = {};

  @override
  Future<void> ensureInitialized() async {
    if (_initialized) return;

    final data = await rootBundle.load('assets/images.zip');
    final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    final archive = ZipDecoder().decodeBytes(bytes);
    for (final file in archive) {
      if (file.isFile) {
        _files[p.join('images', file.name)] = file.content as List<int>;
      }
    }

    _initialized = true;
  }

  @override
  Future<bool> exists(String path) async => _files.containsKey(path);

  @override
  Future<List<int>?> readBytes(String path) async => _files[path];

  @override
  Future<void> writeBytes(String path, List<int> bytes) async {
    _files[path] = List<int>.from(bytes);
  }

  @override
  Future<void> delete(String path) async {
    _files.remove(path);
  }

  @override
  Future<String> saveObservationImage(List<int> bytes) async {
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final path = p.join('observations', fileName);
    await writeBytes(path, bytes);
    return path;
  }

  @override
  Future<List<int>?> readTypeImage(String imageUrl) async {
    return readBytes(p.join('images', imageUrl));
  }
}
