import 'package:drift/drift.dart';
import 'web_shared.dart';

QueryExecutor openUserConnection() {
  return DatabaseConnection.delayed(Future(() async {
    final result = await openSharedWasmDatabase(
      databaseName: 'user_data',
    );

    if (result.missingFeatures.isNotEmpty) {
      print(
        'User database using ${result.chosenImplementation} due to missing '
        'browser features: ${result.missingFeatures}',
      );
    }

    return result.resolvedExecutor;
  }));
}
