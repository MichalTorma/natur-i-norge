String? readUrlHashPath() => null;

void writeUrlHashPath(String path) {}

String currentWebAppBaseUrl() => 'https://geco-nhm.github.io/natur-i-norge/app/';

String buildWebDeepLink(String hashPath) {
  final normalized = hashPath.startsWith('/') ? hashPath : '/$hashPath';
  return '${currentWebAppBaseUrl()}#$normalized';
}

Stream<String?> watchUrlHashPathChanges() => const Stream.empty();
