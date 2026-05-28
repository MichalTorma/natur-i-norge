import '../models/nin_database.dart';
import 'nin_search_ranking.dart';
import 'nin_search_result.dart';

class NinSearchEntry {
  final NinType type;
  final List<NinType> ancestors;

  const NinSearchEntry({required this.type, required this.ancestors});
}

class NinSearchIndex {
  final List<NinSearchEntry> _entries;

  const NinSearchIndex._(this._entries);

  static NinSearchIndex build(List<NinType> types) {
    final byId = {for (final type in types) type.id: type};
    final ancestorsById = <String, List<NinType>>{};

    for (final type in types) {
      final ancestors = <NinType>[];
      var parentId = type.parentId;
      final visited = <String>{type.id};

      while (parentId != null && parentId.isNotEmpty) {
        if (visited.contains(parentId)) break;
        visited.add(parentId);
        final parent = byId[parentId];
        if (parent == null) break;
        ancestors.insert(0, parent);
        parentId = parent.parentId;
      }

      ancestorsById[type.id] = ancestors;
    }

    final entries = types
        .map(
          (type) => NinSearchEntry(
            type: type,
            ancestors: ancestorsById[type.id] ?? const [],
          ),
        )
        .toList();

    return NinSearchIndex._(entries);
  }

  List<NinSearchResult> search(
    String query, {
    Set<String> favoriteIds = const {},
    int limit = 40,
    int minQueryLength = 2,
  }) {
    final trimmed = query.trim();
    if (trimmed.length < minQueryLength) return const [];

    final results = <NinSearchResult>[];
    for (final entry in _entries) {
      final result = scoreType(
        type: entry.type,
        ancestors: entry.ancestors,
        rawQuery: trimmed,
        favoriteIds: favoriteIds,
      );
      if (result != null) {
        results.add(result);
      }
    }

    results.sort(compareSearchResults);
    if (results.length <= limit) return results;
    return results.sublist(0, limit);
  }
}
