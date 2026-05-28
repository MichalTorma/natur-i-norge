import 'dart:convert';

import '../models/nin_database.dart';
import '../services/nin_api_source.dart';
import 'effective_lkm.dart';

enum MatrixHealthSeverity { error, warning, info }

enum MatrixHealthKind {
  cellCollision,
  identicalFootprint,
  partialOverlap,
  missingLkm,
  unplacedType,
  multiStepSpan,
}

class MatrixHealthIssue {
  final MatrixHealthSeverity severity;
  final MatrixHealthKind kind;
  final String title;
  final String description;
  final List<String> typeIds;
  final String? detail;

  const MatrixHealthIssue({
    required this.severity,
    required this.kind,
    required this.title,
    required this.description,
    required this.typeIds,
    this.detail,
  });
}

class MatrixHealthReport {
  final String? parentTypeId;
  final String? parentTypeName;
  final String scale;
  final String? xAxisVar;
  final String? yAxisVar;
  final Map<String, String> activeFilters;
  final int typeCount;
  final List<MatrixHealthIssue> issues;

  const MatrixHealthReport({
    required this.parentTypeId,
    required this.parentTypeName,
    required this.scale,
    required this.xAxisVar,
    required this.yAxisVar,
    required this.activeFilters,
    required this.typeCount,
    required this.issues,
  });

  bool get isHealthy =>
      issues.where((i) => i.severity != MatrixHealthSeverity.info).isEmpty;

  int get errorCount => issues.where((i) => i.severity == MatrixHealthSeverity.error).length;

  int get warningCount => issues.where((i) => i.severity == MatrixHealthSeverity.warning).length;
}

class EcologicalMatrixAnalyzer {
  static Map<String, Set<String>> parseTypeVariables(
    NinType type, {
    Map<String, NinType> grunntypeById = const {},
    Map<String, String> activeFilters = const {},
  }) {
    return EffectiveLkm.variablesForType(
      type,
      grunntypeById: grunntypeById,
      activeFilters: activeFilters,
    );
  }

  static ({String? xAxis, String? yAxis, Map<String, String> filters}) identifyAxes(
    List<NinType> subTypes, {
    Map<String, NinType> grunntypeById = const {},
  }) {
    final varSteps = <String, Set<String>>{};
    for (final type in subTypes) {
      for (final entry in parseTypeVariables(type, grunntypeById: grunntypeById).entries) {
        varSteps.putIfAbsent(entry.key, () => {}).addAll(entry.value);
      }
    }

    if (varSteps.isEmpty) {
      return (xAxis: null, yAxis: null, filters: {});
    }

    final sorted = varSteps.entries.toList()
      ..sort((a, b) => b.value.length.compareTo(a.value.length));
    final xAxis = sorted.first.key;
    final yAxis = sorted.length > 1 ? sorted[1].key : null;

    final filters = <String, String>{};
    for (final entry in varSteps.entries) {
      if (entry.key != xAxis && entry.key != yAxis) {
        final steps = entry.value.toList()..sort();
        filters[entry.key] = steps.first;
      }
    }

    return (xAxis: xAxis, yAxis: yAxis, filters: filters);
  }

  static String _cellKey(String xStep, String yStep) => '$xStep|$yStep';

  static String _formatCell(String xVar, String xStep, String? yVar, String yStep) {
    if (yVar == null || yStep.isEmpty) {
      return '$xVar=$xStep';
    }
    return '$xVar=$xStep, $yVar=$yStep';
  }

  static MatrixHealthReport analyze({
    required List<NinType> subTypes,
    Map<String, NinType> grunntypeById = const {},
    String? parentTypeId,
    String? parentTypeName,
    String scale = 'Biologisk',
  }) {
    final axes = identifyAxes(subTypes, grunntypeById: grunntypeById);
    final issues = <MatrixHealthIssue>[];

    for (final type in subTypes) {
      final vars = parseTypeVariables(
        type,
        grunntypeById: grunntypeById,
        activeFilters: axes.filters,
      );
      if (vars.isNotEmpty) continue;
      if (type.kategori == 'Kartleggingsenhet' && type.containsTypes != null) {
        issues.add(
          MatrixHealthIssue(
            severity: MatrixHealthSeverity.warning,
            kind: MatrixHealthKind.missingLkm,
            title: 'No matching grunntyper for filter',
            description:
                '${type.id} (${type.navn}) has no constituent grunntyper that match the current matrix filters.',
            typeIds: [type.id],
          ),
        );
        continue;
      }
      if (type.lkmData == null || type.lkmData!.isEmpty) {
        issues.add(
          MatrixHealthIssue(
            severity: MatrixHealthSeverity.warning,
            kind: MatrixHealthKind.missingLkm,
            title: 'Missing LKM data',
            description:
                '${type.id} (${type.navn}) has no LKM matrix data and cannot be placed on the ecological matrix.',
            typeIds: [type.id],
          ),
        );
      } else {
        issues.add(
          MatrixHealthIssue(
            severity: MatrixHealthSeverity.warning,
            kind: MatrixHealthKind.missingLkm,
            title: 'Invalid LKM data',
            description:
                '${type.id} (${type.navn}) has LKM data that could not be parsed.',
            typeIds: [type.id],
          ),
        );
      }
    }

    if (axes.xAxis == null) {
      return MatrixHealthReport(
        parentTypeId: parentTypeId,
        parentTypeName: parentTypeName,
        scale: scale,
        xAxisVar: null,
        yAxisVar: null,
        activeFilters: axes.filters,
        typeCount: subTypes.length,
        issues: issues,
      );
    }

    final xVar = axes.xAxis!;
    final yVar = axes.yAxis;
    final cellClaims = <String, Set<String>>{};
    final footprints = <String, Set<String>>{};
    final typeById = {for (final t in subTypes) t.id: t};

    for (final type in subTypes) {
      final vars = parseTypeVariables(
        type,
        grunntypeById: grunntypeById,
        activeFilters: axes.filters,
      );
      if (vars.isEmpty) continue;

      var matchesFilters = true;
      for (final filter in axes.filters.entries) {
        if (vars.containsKey(filter.key) && !vars[filter.key]!.contains(filter.value)) {
          matchesFilters = false;
          break;
        }
      }
      if (!matchesFilters) continue;

      final xSteps = vars[xVar]?.toList() ?? [];
      final ySteps = yVar != null ? (vars[yVar]?.toList() ?? []) : <String>[];

      if (xSteps.isEmpty) {
        issues.add(
          MatrixHealthIssue(
            severity: MatrixHealthSeverity.warning,
            kind: MatrixHealthKind.unplacedType,
            title: 'Type not placed on matrix',
            description:
                '${type.id} (${type.navn}) has LKM data but no registered step on X-axis variable $xVar.',
            typeIds: [type.id],
          ),
        );
        continue;
      }

      if (xSteps.length > 1 || ySteps.length > 1) {
        issues.add(
          MatrixHealthIssue(
            severity: MatrixHealthSeverity.info,
            kind: MatrixHealthKind.multiStepSpan,
            title: 'Type spans multiple matrix cells',
            description:
                '${type.id} covers ${xSteps.length}×${ySteps.isEmpty ? 1 : ySteps.length} cells '
                '(${xVar}: ${xSteps.join(', ')}'
                '${yVar != null ? '; $yVar: ${ySteps.join(', ')}' : ''}). '
                'This is valid but increases overlap risk.',
            typeIds: [type.id],
          ),
        );
      }

      final yFill = ySteps.isNotEmpty ? ySteps : [''];
      final footprint = <String>{};
      for (final x in xSteps) {
        for (final y in yFill) {
          final key = _cellKey(x, y);
          footprint.add(key);
          cellClaims.putIfAbsent(key, () => {}).add(type.id);
        }
      }
      footprints[type.id] = footprint;
    }

    for (final entry in cellClaims.entries) {
      final ids = entry.value.toList()..sort();
      if (ids.length <= 1) continue;

      final parts = entry.key.split('|');
      final xStep = parts.first;
      final yStep = parts.length > 1 ? parts[1] : '';
      final cellLabel = _formatCell(xVar, xStep, yVar, yStep);
      final winner = ids.last;
      final hidden = ids.where((id) => id != winner).toList();

      issues.add(
        MatrixHealthIssue(
          severity: MatrixHealthSeverity.error,
          kind: MatrixHealthKind.cellCollision,
          title: 'Cell collision',
          description:
              'Multiple types map to the same matrix cell ($cellLabel). '
              'The app only displays ${winner} — others are hidden.',
          typeIds: ids,
          detail: 'Displayed: $winner\nHidden: ${hidden.join(', ')}',
        ),
      );
    }

    final ids = footprints.keys.toList()..sort();
    for (var i = 0; i < ids.length; i++) {
      for (var j = i + 1; j < ids.length; j++) {
        final a = ids[i];
        final b = ids[j];
        final fa = footprints[a]!;
        final fb = footprints[b]!;
        final overlap = fa.intersection(fb);
        if (overlap.isEmpty) continue;

        if (fa.length == fb.length && fa.containsAll(fb)) {
          issues.add(
            MatrixHealthIssue(
              severity: MatrixHealthSeverity.error,
              kind: MatrixHealthKind.identicalFootprint,
              title: 'Identical matrix footprint',
              description:
                  '$a and $b occupy the exact same ${fa.length} cell(s). '
                  'Only one can be visible where they collide.',
              typeIds: [a, b],
              detail: 'Cells: ${_summarizeCells(overlap, xVar, yVar)}',
            ),
          );
        } else {
          issues.add(
            MatrixHealthIssue(
              severity: MatrixHealthSeverity.warning,
              kind: MatrixHealthKind.partialOverlap,
              title: 'Partial matrix overlap',
              description:
                  '$a and $b share ${overlap.length} cell(s) but differ elsewhere. '
                  'Colliding cells show only one type.',
              typeIds: [a, b],
              detail: 'Shared cells: ${_summarizeCells(overlap, xVar, yVar)}',
            ),
          );
        }
      }
    }

    issues.sort((a, b) {
      const severityOrder = {
        MatrixHealthSeverity.error: 0,
        MatrixHealthSeverity.warning: 1,
        MatrixHealthSeverity.info: 2,
      };
      final s = severityOrder[a.severity]!.compareTo(severityOrder[b.severity]!);
      if (s != 0) return s;
      return a.title.compareTo(b.title);
    });

    return MatrixHealthReport(
      parentTypeId: parentTypeId,
      parentTypeName: parentTypeName,
      scale: scale,
      xAxisVar: xVar,
      yAxisVar: yVar,
      activeFilters: axes.filters,
      typeCount: subTypes.length,
      issues: issues,
    );
  }

  static String _summarizeCells(Set<String> cells, String xVar, String? yVar) {
    final labels = cells.map((key) {
      final parts = key.split('|');
      return _formatCell(xVar, parts.first, yVar, parts.length > 1 ? parts[1] : '');
    }).toList()
      ..sort();
    if (labels.length <= 4) return labels.join('; ');
    return '${labels.take(4).join('; ')} … (+${labels.length - 4} more)';
  }

  static String formatReport(MatrixHealthReport report, List<NinType> subTypes) {
    final typeById = {for (final t in subTypes) t.id: t};
    final buffer = StringBuffer()
      ..writeln('NiN Guide — ecological matrix health report')
      ..writeln('Generated: ${DateTime.now().toIso8601String()}')
      ..writeln();

    if (report.parentTypeId != null) {
      buffer.writeln(
        'Parent: ${report.parentTypeId}'
        '${report.parentTypeName != null ? ' (${report.parentTypeName})' : ''}',
      );
    }
    buffer
      ..writeln('Scale: ${report.scale}')
      ..writeln('Matrix types: ${report.typeCount}')
      ..writeln('X-axis: ${report.xAxisVar ?? '—'}')
      ..writeln('Y-axis: ${report.yAxisVar ?? '—'}');
    if (report.activeFilters.isNotEmpty) {
      buffer.writeln(
        'Fixed filters: ${report.activeFilters.entries.map((e) => '${e.key}=${e.value}').join(', ')}',
      );
    }
    buffer.writeln();

    if (report.issues.isEmpty) {
      buffer.writeln('No issues detected.');
      return buffer.toString().trimRight();
    }

    buffer
      ..writeln(
        'Summary: ${report.issues.length} issue(s) '
        '(${report.errorCount} error, ${report.warningCount} warning, '
        '${report.issues.length - report.errorCount - report.warningCount} info)',
      )
      ..writeln();

    for (var i = 0; i < report.issues.length; i++) {
      final issue = report.issues[i];
      buffer
        ..writeln('--- Issue ${i + 1}: ${issue.title} (${issue.severity.name.toUpperCase()}) ---')
        ..writeln(issue.description);
      if (issue.detail != null) {
        buffer.writeln(issue.detail);
      }
      buffer.writeln('Types:');
      for (final id in issue.typeIds) {
        final type = typeById[id];
        final name = type?.navn ?? 'unknown';
        final api = type != null ? NinApiSourceService.typeApiUrl(type) : null;
        buffer.writeln('  • $id — $name');
        if (api != null) buffer.writeln('    API: $api');
      }
      buffer.writeln();
    }

    return buffer.toString().trimRight();
  }
}
