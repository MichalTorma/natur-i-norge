abstract class AppStorage {
  static AppStorageFactory? _factory;
  static AppStorage? _instance;

  static AppStorage get instance {
    final factory = _factory;
    if (factory == null) {
      throw StateError('AppStorage factory not registered');
    }
    return _instance ??= factory();
  }

  static void registerFactory(AppStorageFactory factory) {
    _factory = factory;
  }

  Future<void> ensureInitialized();

  Future<bool> exists(String path);

  Future<List<int>?> readBytes(String path);

  Future<void> writeBytes(String path, List<int> bytes);

  Future<void> delete(String path);

  Future<String> saveObservationImage(List<int> bytes);

  Future<List<int>?> readTypeImage(String imageUrl);
}

typedef AppStorageFactory = AppStorage Function();
