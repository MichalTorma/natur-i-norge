import 'dart:convert';

import '../models/nin_database.dart';

/// Resolves LKM variable steps for matrix placement, including Kartleggingsenheter
/// built from their constituent grunntyper.
class EffectiveLkm {
  static Map<String, Set<String>> parseEntries(List<dynamic> entries) {
    final vars = <String, Set<String>>{};
    for (final entry in entries) {
      if (entry is! Map<String, dynamic>) continue;
      final code = entry['v_kode'] as String?;
      final trinn = entry['v_trinn']?.toString();
      if (code == null || trinn == null) continue;
      vars.putIfAbsent(code, () => {}).add(trinn);
    }
    return vars;
  }

  static Map<String, Set<String>> fromType(
    NinType type, {
    Map<String, NinType>? grunntypeById,
    Map<String, String> activeFilters = const {},
  }) {
    if (type.kategori == 'Kartleggingsenhet' && type.containsTypes != null) {
      return fromKartleggingsenhet(
        type,
        grunntypeById: grunntypeById ?? const {},
        activeFilters: activeFilters,
      );
    }

    final raw = type.lkmData;
    if (raw == null || raw.isEmpty) return {};
    try {
      return parseEntries(jsonDecode(raw) as List<dynamic>);
    } catch (_) {
      return {};
    }
  }

  /// Union of constituent grunntype footprints — only grunntyper that satisfy
  /// the active slice filters (e.g. LM-VM=0) contribute steps.
  static Map<String, Set<String>> fromKartleggingsenhet(
    NinType ke, {
    required Map<String, NinType> grunntypeById,
    required Map<String, String> activeFilters,
  }) {
    if (ke.containsTypes == null) return {};

    try {
      final ids = (jsonDecode(ke.containsTypes!) as List<dynamic>).map((e) => e.toString());
      final merged = <String, Set<String>>{};

      for (final id in ids) {
        final gt = grunntypeById[id];
        if (gt?.lkmData == null || gt!.lkmData!.isEmpty) continue;

        Map<String, Set<String>> gtVars;
        try {
          gtVars = parseEntries(jsonDecode(gt.lkmData!) as List<dynamic>);
        } catch (_) {
          continue;
        }

        if (activeFilters.isNotEmpty) {
          var matchesFilters = true;
          for (final filter in activeFilters.entries) {
            if (gtVars.containsKey(filter.key) && !gtVars[filter.key]!.contains(filter.value)) {
              matchesFilters = false;
              break;
            }
          }
          if (!matchesFilters) continue;
        }

        for (final entry in gtVars.entries) {
          merged.putIfAbsent(entry.key, () => {}).addAll(entry.value);
        }
      }

      return merged;
    } catch (_) {
      return {};
    }
  }

  static Map<String, Set<String>> variablesForType(
    NinType type, {
    Map<String, NinType> grunntypeById = const {},
    Map<String, String> activeFilters = const {},
  }) {
    return fromType(type, grunntypeById: grunntypeById, activeFilters: activeFilters);
  }

  /// Raw LKM entries for labels (step names, variable names) in the matrix UI.
  static Iterable<Map<String, dynamic>> metadataEntries(
    NinType type, {
    Map<String, NinType> grunntypeById = const {},
  }) sync* {
    if (type.kategori == 'Kartleggingsenhet' && type.containsTypes != null) {
      try {
        final ids = (jsonDecode(type.containsTypes!) as List<dynamic>).map((e) => e.toString());
        for (final id in ids) {
          final gt = grunntypeById[id];
          if (gt?.lkmData == null || gt!.lkmData!.isEmpty) continue;
          final list = jsonDecode(gt.lkmData!) as List<dynamic>;
          for (final entry in list) {
            if (entry is Map<String, dynamic>) yield entry;
          }
        }
      } catch (_) {}
      return;
    }

    final raw = type.lkmData;
    if (raw == null || raw.isEmpty) return;
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      for (final entry in list) {
        if (entry is Map<String, dynamic>) yield entry;
      }
    } catch (_) {}
  }

  static void collectVariableMetadata({
    required Iterable<NinType> types,
    Map<String, NinType> grunntypeById = const {},
    required Map<String, Map<String, String>> stepNamesByVar,
    required Map<String, String> varNames,
  }) {
    for (final type in types) {
      for (final entry in metadataEntries(type, grunntypeById: grunntypeById)) {
        final code = entry['v_kode'] as String?;
        final name = entry['v_navn']?.toString();
        final trinn = entry['v_trinn']?.toString();
        final trinnNavn = entry['v_trinn_navn'] as String?;
        if (code == null || trinn == null) continue;

        stepNamesByVar.putIfAbsent(code, () => {});
        if (trinnNavn != null) stepNamesByVar[code]![trinn] = trinnNavn;
        if (name != null) varNames[code] = name;
      }
    }

    for (final gt in grunntypeById.values) {
      for (final entry in metadataEntries(gt)) {
        final code = entry['v_kode'] as String?;
        final name = entry['v_navn']?.toString();
        final trinn = entry['v_trinn']?.toString();
        final trinnNavn = entry['v_trinn_navn'] as String?;
        if (code == null || trinn == null) continue;

        stepNamesByVar.putIfAbsent(code, () => {});
        if (trinnNavn != null) stepNamesByVar[code]!.putIfAbsent(trinn, () => trinnNavn);
        if (name != null) varNames.putIfAbsent(code, () => name);
      }
    }
  }
}
