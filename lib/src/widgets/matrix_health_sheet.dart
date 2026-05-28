import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../matrix/ecological_matrix_analyzer.dart';
import '../models/nin_database.dart';

Future<void> showMatrixHealthSheet(
  BuildContext context, {
  required List<NinType> matrixTypes,
  Map<String, NinType> grunntypeById = const {},
  String? parentTypeId,
  String? parentTypeName,
  required String scale,
}) {
  final report = EcologicalMatrixAnalyzer.analyze(
    subTypes: matrixTypes,
    grunntypeById: grunntypeById,
    parentTypeId: parentTypeId,
    parentTypeName: parentTypeName,
    scale: scale,
  );
  final reportText = EcologicalMatrixAnalyzer.formatReport(report, matrixTypes);

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.75,
        minChildSize: 0.45,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return _MatrixHealthSheetBody(
            report: report,
            reportText: reportText,
            scrollController: scrollController,
          );
        },
      );
    },
  );
}

class _MatrixHealthSheetBody extends StatelessWidget {
  final MatrixHealthReport report;
  final String reportText;
  final ScrollController scrollController;

  const _MatrixHealthSheetBody({
    required this.report,
    required this.reportText,
    required this.scrollController,
  });

  Color _severityColor(MatrixHealthSeverity severity, ColorScheme scheme) {
    return switch (severity) {
      MatrixHealthSeverity.error => scheme.error,
      MatrixHealthSeverity.warning => Colors.amber.shade800,
      MatrixHealthSeverity.info => scheme.primary,
    };
  }

  IconData _severityIcon(MatrixHealthSeverity severity) {
    return switch (severity) {
      MatrixHealthSeverity.error => Icons.error_outline,
      MatrixHealthSeverity.warning => Icons.warning_amber_outlined,
      MatrixHealthSeverity.info => Icons.info_outline,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      children: [
        Text(
          'Matrix health check',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          report.isHealthy && report.issues.isEmpty
              ? 'No placement conflicts detected for the current axis layout.'
              : report.errorCount > 0
                  ? '${report.errorCount} error(s) and ${report.warningCount} warning(s) found. '
                      'Overlapping types may be hidden in the matrix.'
                  : '${report.warningCount} warning(s) and '
                      '${report.issues.length - report.warningCount} info note(s).',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: scheme.onSurface.withValues(alpha: 0.75),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            if (report.errorCount > 0)
              Chip(
                avatar: Icon(Icons.error_outline, size: 18, color: scheme.error),
                label: Text('${report.errorCount} errors'),
              ),
            if (report.warningCount > 0)
              Chip(
                avatar: Icon(Icons.warning_amber_outlined, size: 18, color: Colors.amber.shade800),
                label: Text('${report.warningCount} warnings'),
              ),
            Chip(
              avatar: Icon(Icons.grid_on, size: 18, color: scheme.primary),
              label: Text('${report.typeCount} types'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (report.issues.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline, color: scheme.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'All types have distinct matrix placements with the current filters.',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          ...report.issues.map((issue) {
            final color = _severityColor(issue.severity, scheme);
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(_severityIcon(issue.severity), color: color, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                issue.title,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(issue.description, style: theme.textTheme.bodyMedium),
                              if (issue.detail != null) ...[
                                const SizedBox(height: 8),
                                Text(
                                  issue.detail!,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontFamily: 'monospace',
                                    color: scheme.onSurface.withValues(alpha: 0.7),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        const SizedBox(height: 8),
        FilledButton.icon(
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: reportText));
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Matrix health report copied')),
            );
          },
          icon: const Icon(Icons.copy),
          label: const Text('Copy full report'),
        ),
      ],
    );
  }
}
