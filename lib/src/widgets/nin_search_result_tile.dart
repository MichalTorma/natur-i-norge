import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../nin_type_colors.dart';
import '../providers/database_provider.dart';
import '../search/nin_search_result.dart';
import '../search/search_highlight.dart';

class NinSearchResultTile extends ConsumerWidget {
  final NinSearchResult result;
  final String highlightQuery;
  final VoidCallback onTap;

  const NinSearchResultTile({
    super.key,
    required this.result,
    required this.highlightQuery,
    required this.onTap,
  });

  String _scaleLabel(String? scale) {
    return switch (scale) {
      'M005' => '1:5 000',
      'M020' => '1:20 000',
      'M050' => '1:50 000',
      _ => scale ?? '',
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = result.type;
    final accent = ninTypeAccentColor(type);
    final favorites = ref.watch(favoritesProvider).value ?? const <String>[];
    final isFavorite = favorites.contains(type.id);
    final muted = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.55);
    final breadcrumb = result.ancestors.map((a) => a.navn).join('  ›  ');

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        width: 4,
        height: 48,
        decoration: BoxDecoration(
          color: accent,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: accent.withValues(alpha: 0.35)),
            ),
            child: Text(
              type.id,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                color: accent,
                letterSpacing: 0.4,
              ),
            ),
          ),
          if (isFavorite) ...[
            const SizedBox(width: 6),
            Icon(Icons.star, size: 14, color: Colors.amber[700]),
          ],
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              type.navn,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _CategoryChip(label: type.kategori, color: accent),
              if (type.kategori == 'Kartleggingsenhet' && type.scale != null)
                _CategoryChip(label: _scaleLabel(type.scale), color: muted),
            ],
          ),
          if (breadcrumb.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              breadcrumb,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: muted),
            ),
          ],
          if (result.snippet != null) ...[
            const SizedBox(height: 6),
            Builder(
              builder: (context) {
                final snippetStyle = TextStyle(
                  fontSize: 12,
                  color: muted.withValues(alpha: 0.9),
                  fontStyle: FontStyle.italic,
                );
                return Text.rich(
                  TextSpan(
                    style: snippetStyle,
                    children: highlightTextSpans(result.snippet!, highlightQuery, snippetStyle),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                );
              },
            ),
          ],
        ],
      ),
      onTap: onTap,
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final Color color;

  const _CategoryChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.4,
          color: color,
        ),
      ),
    );
  }
}
