import 'package:drift/drift.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../services/app_storage.dart';
import 'web_shared.dart';

QueryExecutor openConnection() {
  return DatabaseConnection.delayed(Future(() async {
    await AppStorage.instance.ensureInitialized();

    final result = await openSharedWasmDatabase(
      databaseName: 'nin_database',
      initializeDatabase: () async {
        final data = await rootBundle.load('assets/nin_database.sqlite');
        return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      },
    );

    if (result.missingFeatures.isNotEmpty) {
      print(
        'NiN database using ${result.chosenImplementation} due to missing '
        'browser features: ${result.missingFeatures}',
      );
    }

    return result.resolvedExecutor;
  }));
}
