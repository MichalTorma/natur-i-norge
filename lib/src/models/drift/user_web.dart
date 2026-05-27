import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

QueryExecutor openUserConnection() {
  return DatabaseConnection.delayed(Future(() async {
    final result = await WasmDatabase.open(
      databaseName: 'user_data',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );

    if (result.missingFeatures.isNotEmpty) {
      print(
        'User database using fallback storage due to missing browser features: '
        '${result.missingFeatures}',
      );
    }

    return result.resolvedExecutor;
  }));
}
