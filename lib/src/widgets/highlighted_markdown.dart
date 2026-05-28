import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:markdown/markdown.dart' as md;

import '../search/search_highlight.dart';

class HighlightedMarkdown extends StatelessWidget {
  final String data;
  final String highlightQuery;

  const HighlightedMarkdown({
    super.key,
    required this.data,
    required this.highlightQuery,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final sheet = MarkdownStyleSheet(
      p: theme.textTheme.bodyMedium?.copyWith(fontSize: 16, height: 1.6, letterSpacing: 0.2),
      h1: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary),
      h2: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary),
      h3: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary),
      listBullet: TextStyle(color: colorScheme.primary),
      blockquote: theme.textTheme.bodyMedium?.copyWith(
        fontSize: 16,
        height: 1.6,
        color: colorScheme.onSurface.withValues(alpha: 0.85),
      ),
      code: TextStyle(
        fontFamily: 'monospace',
        backgroundColor: colorScheme.surfaceContainerHighest,
      ),
      a: TextStyle(color: colorScheme.primary, decoration: TextDecoration.underline),
    );

    final doc = md.Document(extensionSet: md.ExtensionSet.gitHubFlavored, encodeHtml: false);
    final nodes = doc.parseLines(data.split('\n'));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final node in nodes)
          if (node is md.Element)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _HighlightedMarkdownBlock(
                element: node,
                query: highlightQuery,
                sheet: sheet,
              ),
            ),
      ],
    );
  }
}

class _HighlightedMarkdownBlock extends StatelessWidget {
  final md.Element element;
  final String query;
  final MarkdownStyleSheet sheet;

  const _HighlightedMarkdownBlock({
    required this.element,
    required this.query,
    required this.sheet,
  });

  @override
  Widget build(BuildContext context) {
    return switch (element.tag) {
      'p' => _richText(sheet.p, element.children),
      'h1' => _richText(sheet.h1, element.children),
      'h2' => _richText(sheet.h2, element.children),
      'h3' => _richText(sheet.h3, element.children),
      'h4' => _richText(sheet.h4, element.children),
      'h5' => _richText(sheet.h5, element.children),
      'h6' => _richText(sheet.h6, element.children),
      'ul' || 'ol' => _buildList(context),
      'blockquote' => DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Theme.of(context).colorScheme.primary, width: 4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final child in element.children ?? const <md.Node>[])
                  if (child is md.Element)
                    _HighlightedMarkdownBlock(element: child, query: query, sheet: sheet),
              ],
            ),
          ),
        ),
      'hr' => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Divider(),
        ),
      _ => _richText(sheet.p, element.children),
    };
  }

  Widget _buildList(BuildContext context) {
    final items = element.children?.whereType<md.Element>().where((node) => node.tag == 'li') ?? const [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final li in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• ', style: sheet.listBullet),
                Expanded(child: _richText(sheet.p, li.children)),
              ],
            ),
          ),
      ],
    );
  }

  Widget _richText(TextStyle? style, List<md.Node>? nodes) {
    final baseStyle = style ?? const TextStyle(fontSize: 16, height: 1.6);
    return SelectableText.rich(
      TextSpan(
        style: baseStyle,
        children: _inlineSpans(nodes, baseStyle, query),
      ),
    );
  }
}

List<InlineSpan> _inlineSpans(List<md.Node>? nodes, TextStyle style, String query) {
  final spans = <InlineSpan>[];
  for (final node in nodes ?? const <md.Node>[]) {
    if (node is md.Text) {
      spans.addAll(highlightTextSpans(node.text, query, style));
    } else if (node is md.Element) {
      spans.addAll(_elementSpans(node, style, query));
    }
  }
  return spans;
}

List<InlineSpan> _elementSpans(md.Element element, TextStyle style, String query) {
  return switch (element.tag) {
    'strong' || 'b' => _inlineSpans(
        element.children,
        style.copyWith(fontWeight: FontWeight.bold),
        query,
      ),
    'em' || 'i' => _inlineSpans(
        element.children,
        style.copyWith(fontStyle: FontStyle.italic),
        query,
      ),
    'code' => [
        TextSpan(
          text: element.textContent,
          style: (style.fontFamily == 'monospace' ? style : style.copyWith(fontFamily: 'monospace')).copyWith(
            backgroundColor: style.backgroundColor ?? Colors.black12,
          ),
        ),
      ],
    'a' => _inlineSpans(
        element.children,
        style.copyWith(
          color: style.color,
          decoration: TextDecoration.underline,
        ),
        query,
      ),
    'br' => [const TextSpan(text: '\n')],
    _ => _inlineSpans(element.children, style, query),
  };
}
