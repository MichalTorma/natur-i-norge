import 'app_storage_stub.dart';
import 'app_storage_platform.dart'
    if (dart.library.js_interop) 'app_storage_web.dart'
    if (dart.library.ffi) 'app_storage_native.dart'
    as platform;

export 'app_storage_stub.dart';

bool _appStorageInitialized = false;

/// Must be called before accessing [AppStorage.instance].
void initAppStorage() {
  if (_appStorageInitialized) return;
  AppStorage.registerFactory(platform.createAppStorage);
  _appStorageInitialized = true;
}
