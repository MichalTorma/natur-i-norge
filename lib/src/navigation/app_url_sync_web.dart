import 'dart:html' as html;

String? readUrlHashPath() {
  final hash = html.window.location.hash;
  if (hash.isEmpty || hash == '#') return null;
  return hash.startsWith('#') ? hash.substring(1) : hash;
}

void writeUrlHashPath(String path) {
  final normalized = path.startsWith('/') ? path : '/$path';
  final newHash = '#$normalized';
  if (html.window.location.hash != newHash) {
    html.window.history.replaceState(null, '', newHash);
  }
}

String currentWebAppBaseUrl() {
  final href = html.window.location.href;
  final hashIndex = href.indexOf('#');
  return hashIndex == -1 ? href : href.substring(0, hashIndex);
}

String buildWebDeepLink(String hashPath) {
  final normalized = hashPath.startsWith('/') ? hashPath : '/$hashPath';
  return '${currentWebAppBaseUrl()}#$normalized';
}

Stream<String?> watchUrlHashPathChanges() {
  return html.window.onHashChange.map((_) => readUrlHashPath());
}
