import '../models/nin_database.dart';
import 'nin_search_result.dart';
import 'nin_search_snippets.dart';

const _categoryOrder = {
  'Type': 0,
  'Hovedtypegruppe': 1,
  'Hovedtype': 2,
  'Grunntype': 3,
  'Kartleggingsenhet': 4,
};

NinSearchResult? scoreType({
  required NinType type,
  required List<NinType> ancestors,
  required String rawQuery,
  required Set<String> favoriteIds,
}) {
  final query = rawQuery.trim();
  if (query.isEmpty) return null;

  final normalizedQuery = normalizeForSearch(query);
  final tokens = normalizedQuery.split(RegExp(r'\s+')).where((t) => t.isNotEmpty).toList();
  if (tokens.isEmpty) return null;

  final id = normalizeForSearch(type.id);
  final navn = normalizeForSearch(type.navn);
  final definisjon =
      type.definisjon != null ? normalizeForSearch(type.definisjon!) : '';
  final description = type.description != null
      ? normalizeForSearch(stripMarkdown(type.description!))
      : '';

  var score = 0;
  NinSearchMatchField? matchField;
  String? snippet;

  if (id == normalizedQuery) {
    score = 1000;
    matchField = NinSearchMatchField.id;
  } else if (id.startsWith(normalizedQuery)) {
    score = 800;
    matchField = NinSearchMatchField.id;
  }

  if (navn.startsWith(normalizedQuery)) {
    if (score < 600) {
      score = 600;
      matchField = NinSearchMatchField.navn;
    }
  } else if (navn.contains(normalizedQuery)) {
    if (score < 400) {
      score = 400;
      matchField = NinSearchMatchField.navn;
    }
  }

  if (definisjon.contains(normalizedQuery)) {
    if (score < 200) {
      score = 200;
      matchField = NinSearchMatchField.definisjon;
      snippet = extractSnippet(type.definisjon!, query);
    }
  }

  if (description.contains(normalizedQuery)) {
    if (score < 100) {
      score = 100;
      matchField = NinSearchMatchField.description;
      snippet = extractSnippet(type.description!, query);
    }
  }

  final searchableText = '$id $navn $definisjon $description';
  if (tokens.length > 1 && tokens.every(searchableText.contains)) {
    score += 50;
    if (matchField == null || score <= 50) {
      matchField = description.contains(tokens.first)
          ? NinSearchMatchField.description
          : NinSearchMatchField.navn;
      snippet ??= type.description != null
          ? extractSnippet(type.description!, query)
          : null;
    }
  }

  for (final token in tokens) {
    if (!searchableText.contains(token)) {
      return null;
    }
  }

  if (score == 0) {
    for (final token in tokens) {
      if (id.contains(token)) {
        score = 300;
        matchField = NinSearchMatchField.id;
      } else if (navn.contains(token)) {
        score = score < 250 ? 250 : score;
        matchField ??= NinSearchMatchField.navn;
      } else if (definisjon.contains(token)) {
        score = score < 150 ? 150 : score;
        matchField ??= NinSearchMatchField.definisjon;
        snippet ??= type.definisjon != null ? extractSnippet(type.definisjon!, token) : null;
      } else if (description.contains(token)) {
        score = score < 80 ? 80 : score;
        matchField ??= NinSearchMatchField.description;
        snippet ??=
            type.description != null ? extractSnippet(type.description!, token) : null;
      }
    }
  }

  if (score == 0 || matchField == null) return null;

  if (favoriteIds.contains(type.id)) {
    score += 20;
  }

  return NinSearchResult(
    type: type,
    ancestors: ancestors,
    score: score,
    matchField: matchField,
    snippet: snippet,
  );
}

int compareSearchResults(NinSearchResult a, NinSearchResult b) {
  final byScore = b.score.compareTo(a.score);
  if (byScore != 0) return byScore;

  final byCategory = (_categoryOrder[a.type.kategori] ?? 99)
      .compareTo(_categoryOrder[b.type.kategori] ?? 99);
  if (byCategory != 0) return byCategory;

  return a.type.id.compareTo(b.type.id);
}
