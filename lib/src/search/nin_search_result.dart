import '../models/nin_database.dart';

enum NinSearchMatchField { id, navn, definisjon, description }

class NinSearchResult {
  final NinType type;
  final List<NinType> ancestors;
  final int score;
  final NinSearchMatchField matchField;
  final String? snippet;

  const NinSearchResult({
    required this.type,
    required this.ancestors,
    required this.score,
    required this.matchField,
    this.snippet,
  });

  List<NinType> get path => [...ancestors, type];
}
