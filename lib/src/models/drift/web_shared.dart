import 'dart:async';
import 'dart:typed_data';

import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

const _sqlite3Uri = 'sqlite3.wasm';
const _driftWorkerUri = 'drift_worker.js';

Future<WasmProbeResult>? _sharedProbeFuture;
var _openChain = Future<void>.value();

/// Probes browser capabilities once and reuses the result for every web DB.
///
/// Drift's worker must not be probed concurrently: parallel [WasmDatabase.open]
/// calls (e.g. NinDatabase + UserDatabase) race on the same SharedWorker and
/// can fail on reload with [MissingBrowserFeature.workerError].
Future<WasmProbeResult> ensureDriftWebProbe() {
  return _sharedProbeFuture ??= WasmDatabase.probe(
    sqlite3Uri: Uri.parse(_sqlite3Uri),
    driftWorkerUri: Uri.parse(_driftWorkerUri),
    databaseName: 'nin_database',
  );
}

Future<T> _serializeDriftOpen<T>(Future<T> Function() action) {
  final result = _openChain.then((_) => action());
  _openChain = result.then((_) {}, onError: (_) {});
  return result;
}

Future<WasmDatabaseResult> openSharedWasmDatabase({
  required String databaseName,
  FutureOr<Uint8List?> Function()? initializeDatabase,
}) {
  return _serializeDriftOpen(() async {
    final probed = await ensureDriftWebProbe();

    final availableImplementations = probed.availableStorages.toList()
      ..sort((a, b) => a.index.compareTo(b.index));

    var selectedImplementation = availableImplementations.isEmpty
        ? WasmStorageImplementation.inMemory
        : availableImplementations.first;

    final currentDb = _selectExistingDatabase(
      databaseName,
      availableImplementations,
      probed.existingDatabases,
    );

    if (currentDb != null &&
        currentDb != selectedImplementation.storageApi &&
        availableImplementations.any((e) => e.storageApi == currentDb)) {
      selectedImplementation = availableImplementations.firstWhere(
        (e) => e.storageApi == currentDb,
      );
    }

    final connection = await probed.open(
      selectedImplementation,
      databaseName,
      initializeDatabase: initializeDatabase,
    );

    return WasmDatabaseResult(
      connection,
      selectedImplementation,
      probed.missingFeatures,
    );
  });
}

WebStorageApi? _selectExistingDatabase(
  String databaseName,
  List<WasmStorageImplementation> available,
  List<ExistingDatabase> existingDatabases,
) {
  for (final (location, name) in existingDatabases) {
    if (name != databaseName) continue;

    final implementationsForStorage = switch (location) {
      WebStorageApi.indexedDb => const [
        WasmStorageImplementation.sharedIndexedDb,
        WasmStorageImplementation.unsafeIndexedDb,
      ],
      WebStorageApi.opfs => const [
        WasmStorageImplementation.opfsShared,
        WasmStorageImplementation.opfsLocks,
      ],
    };

    if (implementationsForStorage.any(available.contains)) {
      return location;
    }
  }

  return null;
}
