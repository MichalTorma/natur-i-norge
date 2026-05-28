String normalizeForSearch(String input) {
  return input
      .toLowerCase()
      .replaceAll('æ', 'ae')
      .replaceAll('ø', 'o')
      .replaceAll('å', 'aa');
}

String stripMarkdown(String text) {
  var result = text;
  result = result.replaceAll(RegExp(r'\[([^\]]*)\]\([^\)]*\)'), r'$1');
  result = result.replaceAll(RegExp(r'[#*_`>|]+'), ' ');
  result = result.replaceAll(RegExp(r'\s+'), ' ');
  return result.trim();
}

String? extractSnippet(String text, String query, {int radius = 90}) {
  final stripped = stripMarkdown(text);
  if (stripped.isEmpty || query.trim().isEmpty) return null;

  final lower = normalizeForSearch(stripped);
  final tokens = normalizeForSearch(query.trim()).split(RegExp(r'\s+')).where((t) => t.isNotEmpty);
  final token = tokens.firstWhere(
    (t) => lower.contains(t),
    orElse: () => '',
  );
  if (token.isEmpty) return null;

  final index = lower.indexOf(token);
  final start = (index - radius).clamp(0, stripped.length);
  final end = (index + token.length + radius).clamp(0, stripped.length);
  var snippet = stripped.substring(start, end).trim();
  if (start > 0) snippet = '…$snippet';
  if (end < stripped.length) snippet = '$snippet…';
  return snippet;
}
