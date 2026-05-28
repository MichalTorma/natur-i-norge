import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../search/nin_search_index.dart';
import '../search/nin_search_result.dart';
import 'database_provider.dart';

class NinSearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void setQuery(String query) => state = query;

  void clear() => state = '';
}

final ninSearchQueryProvider = NotifierProvider<NinSearchQueryNotifier, String>(
  NinSearchQueryNotifier.new,
);

class PendingSearchHighlight {
  final String typeId;
  final String query;

  const PendingSearchHighlight({required this.typeId, required this.query});
}

class PendingSearchHighlightNotifier extends Notifier<PendingSearchHighlight?> {
  @override
  PendingSearchHighlight? build() => null;

  void setHighlight({required String typeId, required String? query}) {
    final trimmed = query?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      state = null;
      return;
    }
    state = PendingSearchHighlight(typeId: typeId, query: trimmed);
  }

  void clear() => state = null;
}

final pendingSearchHighlightProvider = NotifierProvider<PendingSearchHighlightNotifier, PendingSearchHighlight?>(
  PendingSearchHighlightNotifier.new,
);

final ninSearchIndexProvider = FutureProvider<NinSearchIndex>((ref) async {
  final db = ref.watch(databaseProvider);
  final types = await db.select(db.ninTypes).get();
  return NinSearchIndex.build(types);
});

final ninSearchResultsProvider = FutureProvider<List<NinSearchResult>>((ref) async {
  final query = ref.watch(ninSearchQueryProvider);
  if (query.trim().length < 2) return const [];

  final index = await ref.watch(ninSearchIndexProvider.future);
  final favorites = ref.watch(favoritesProvider).value ?? const <String>[];
  return index.search(query, favoriteIds: favorites.toSet());
});
