import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../services/app_storage.dart';

QueryExecutor openConnection() {
  return DatabaseConnection.delayed(Future(() async {
    await AppStorage.instance.ensureInitialized();

    final result = await WasmDatabase.open(
      databaseName: 'nin_database',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
      initializeDatabase: () async {
        final data = await rootBundle.load('assets/nin_database.sqlite');
        return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      },
    );

    if (result.missingFeatures.isNotEmpty) {
      print(
        'NiN database using fallback storage due to missing browser features: '
        '${result.missingFeatures}',
      );
    }

    return result.resolvedExecutor;
  }));
}
