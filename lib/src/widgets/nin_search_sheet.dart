import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/nin_database.dart';
import '../providers/nin_search_provider.dart';
import '../search/nin_search_result.dart';
import 'nin_search_result_tile.dart';

typedef NinSearchSelectHandler = Future<void> Function(NinType type, String query);

Future<void> showNinSearchSheet(
  BuildContext context, {
  required WidgetRef ref,
  required NinSearchSelectHandler onSelectType,
}) {
  ref.read(ninSearchQueryProvider.notifier).clear();

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (sheetContext) {
      return NinSearchSheet(
        onSelectType: (type, query) async {
          Navigator.of(sheetContext).pop();
          await onSelectType(type, query);
        },
      );
    },
  );
}

class NinSearchSheet extends ConsumerStatefulWidget {
  final NinSearchSelectHandler onSelectType;

  const NinSearchSheet({super.key, required this.onSelectType});

  @override
  ConsumerState<NinSearchSheet> createState() => _NinSearchSheetState();
}

class _NinSearchSheetState extends ConsumerState<NinSearchSheet> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onQueryChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () {
      if (!mounted) return;
      ref.read(ninSearchQueryProvider.notifier).setQuery(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final indexAsync = ref.watch(ninSearchIndexProvider);
    final resultsAsync = ref.watch(ninSearchResultsProvider);
    final query = _controller.text.trim();
    final height = MediaQuery.sizeOf(context).height * 0.88;

    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              autofocus: true,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search codes, names, descriptions…',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: query.isEmpty
                    ? null
                    : IconButton(
                        tooltip: 'Clear',
                        onPressed: () {
                          _controller.clear();
                          ref.read(ninSearchQueryProvider.notifier).clear();
                          setState(() {});
                        },
                        icon: const Icon(Icons.clear),
                      ),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {});
                _onQueryChanged(value);
              },
            ),
          ),
          Expanded(
            child: indexAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text('Could not load search index: $error')),
              data: (_) => _buildResults(context, resultsAsync, query),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResults(
    BuildContext context,
    AsyncValue<List<NinSearchResult>> resultsAsync,
    String query,
  ) {
    if (query.length < 2) {
      return _EmptyState(
        icon: Icons.travel_explore,
        title: 'Search all nature types',
        subtitle: 'Try a code like T01, a name like "myr", or words from a description.',
      );
    }

    return resultsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Search failed: $error')),
      data: (results) {
        if (results.isEmpty) {
          return _EmptyState(
            icon: Icons.search_off,
            title: 'No matches',
            subtitle: 'Try fewer words or a NiN code.',
          );
        }

        final grouped = _groupResults(results);
        return ListView(
          padding: const EdgeInsets.only(bottom: 24),
          children: [
            for (final entry in grouped.entries) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: Text(
                  entry.key.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.45),
                  ),
                ),
              ),
              for (final result in entry.value)
                NinSearchResultTile(
                  result: result,
                  highlightQuery: query,
                  onTap: () => widget.onSelectType(result.type, _controller.text.trim()),
                ),
            ],
          ],
        );
      },
    );
  }

  Map<String, List<NinSearchResult>> _groupResults(List<NinSearchResult> results) {
    const order = [
      'Type',
      'Hovedtypegruppe',
      'Hovedtype',
      'Grunntype',
      'Kartleggingsenhet',
    ];

    final grouped = <String, List<NinSearchResult>>{};
    for (final result in results) {
      grouped.putIfAbsent(result.type.kategori, () => []).add(result);
    }

    final sorted = <String, List<NinSearchResult>>{};
    for (final key in order) {
      final items = grouped.remove(key);
      if (items != null) sorted[key] = items;
    }
    sorted.addAll(grouped);
    return sorted;
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _EmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.55);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: muted.withValues(alpha: 0.45)),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: muted, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
