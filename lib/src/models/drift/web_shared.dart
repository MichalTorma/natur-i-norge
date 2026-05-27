import 'dart:async';
import 'dart:js_interop';
import 'dart:typed_data';

import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:sqlite3/common.dart';
import 'package:sqlite3/wasm.dart';

const _sqlite3Uri = 'sqlite3.wasm';
const _driftWorkerUri = 'drift_worker.js';

@JS('crossOriginIsolated')
external bool get _crossOriginIsolated;

Future<WasmProbeResult>? _sharedProbeFuture;
var _openChain = Future<void>.value();

/// True when the app is served with COOP/COEP headers (e.g. local dev).
bool get driftUsesWorkerStorage => _crossOriginIsolated;

/// Probes browser capabilities once and reuses the result for every web DB.
///
/// Only used when [driftUsesWorkerStorage] is true. On hosts like GitHub Pages
/// that cannot set COOP/COEP headers, we open IndexedDB directly in the main
/// isolate instead to avoid Firefox hanging on SharedWorker reload.
Future<WasmProbeResult> ensureDriftWebProbe() {
  if (!driftUsesWorkerStorage) {
    throw StateError('Worker-based drift probe is disabled without COOP/COEP');
  }

  return _sharedProbeFuture ??= WasmDatabase.probe(
    sqlite3Uri: Uri.parse(_sqlite3Uri),
    driftWorkerUri: Uri.parse(_driftWorkerUri),
    databaseName: 'nin_database',
  );
}

Future<void> warmUpDriftWeb() async {
  if (driftUsesWorkerStorage) {
    await ensureDriftWebProbe();
  } else {
    await WasmSqlite3.loadFromUrl(Uri.parse(_sqlite3Uri));
  }
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
    if (!driftUsesWorkerStorage) {
      return _openLocalIndexedDb(
        databaseName: databaseName,
        initializeDatabase: initializeDatabase,
      );
    }

    final probed = await ensureDriftWebProbe();

    final availableImplementations = _allowedWorkerStorages(
      probed.availableStorages,
    )..sort((a, b) => a.index.compareTo(b.index));

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

    final connection = await probed
        .open(
          selectedImplementation,
          databaseName,
          initializeDatabase: initializeDatabase,
        )
        .timeout(const Duration(seconds: 20));

    return WasmDatabaseResult(
      connection,
      selectedImplementation,
      probed.missingFeatures,
    );
  });
}

/// Worker-backed OPFS / SharedWorker modes hang on Firefox reload when COOP/COEP
/// headers are missing. Prefer main-thread IndexedDB there instead.
List<WasmStorageImplementation> _allowedWorkerStorages(
  List<WasmStorageImplementation> available,
) {
  const workerFree = {
    WasmStorageImplementation.unsafeIndexedDb,
    WasmStorageImplementation.inMemory,
  };

  final filtered = available.where(workerFree.contains).toList();
  return filtered.isEmpty ? available : filtered;
}

Future<WasmDatabaseResult> _openLocalIndexedDb({
  required String databaseName,
  FutureOr<Uint8List?> Function()? initializeDatabase,
}) async {
  final sqlite3 = await WasmSqlite3.loadFromUrl(Uri.parse(_sqlite3Uri));
  final vfs = await IndexedDbFileSystem.open(dbName: databaseName);

  if (initializeDatabase != null && vfs.xAccess('/database', 0) == 0) {
    final response = await initializeDatabase();
    if (response != null) {
      final (:file, :outFlags) = vfs.xOpen(
        Sqlite3Filename('/database'),
        SqlFlag.SQLITE_OPEN_CREATE,
      );
      file.xWrite(response, 0);
      file.xClose();
    }
  }

  sqlite3.registerVirtualFileSystem(vfs, makeDefault: true);
  final executor = WasmDatabase(
    sqlite3: sqlite3,
    path: '/database',
    fileSystem: vfs,
  );

  return WasmDatabaseResult(
    DatabaseConnection(executor),
    WasmStorageImplementation.unsafeIndexedDb,
    {MissingBrowserFeature.sharedArrayBuffers},
  );
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
