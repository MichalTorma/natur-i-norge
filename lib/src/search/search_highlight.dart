import 'package:flutter/material.dart';

import 'nin_search_snippets.dart';

List<String> searchHighlightTokens(String query) {
  final tokens = normalizeForSearch(query)
      .split(RegExp(r'\s+'))
      .where((token) => token.length >= 2)
      .toSet()
      .toList();
  tokens.sort((a, b) => b.length.compareTo(a.length));
  return tokens;
}

String _tokenPattern(String token) {
  return RegExp.escape(token)
      .replaceAll('ae', '(?:ae|æ)')
      .replaceAll('oe', '(?:oe|ø)')
      .replaceAll('aa', '(?:aa|å)');
}

List<InlineSpan> highlightTextSpans(String text, String query, TextStyle style) {
  final tokens = searchHighlightTokens(query);
  if (tokens.isEmpty) {
    return [TextSpan(text: text, style: style)];
  }

  final pattern = tokens.map(_tokenPattern).join('|');
  final regex = RegExp(pattern, caseSensitive: false);
  final spans = <InlineSpan>[];
  var start = 0;

  for (final match in regex.allMatches(text)) {
    if (match.start > start) {
      spans.add(TextSpan(text: text.substring(start, match.start), style: style));
    }
    spans.add(
      TextSpan(
        text: text.substring(match.start, match.end),
        style: style.copyWith(
          backgroundColor: Colors.amber.withValues(alpha: 0.45),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
    start = match.end;
  }

  if (start < text.length) {
    spans.add(TextSpan(text: text.substring(start), style: style));
  }

  return spans.isEmpty ? [TextSpan(text: text, style: style)] : spans;
}
