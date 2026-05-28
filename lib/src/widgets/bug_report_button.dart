import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/bug_report_service.dart';

class BugReportButton extends ConsumerWidget {
  const BugReportButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDesktop = MediaQuery.sizeOf(context).width > 800;
    final bottomPadding = isDesktop ? 16.0 : 88.0;

    return Positioned(
      right: 16,
      bottom: bottomPadding,
      child: FloatingActionButton.small(
        heroTag: 'bug_report_fab',
        tooltip: 'Report a problem',
        onPressed: () => BugReportService.showSheet(context, ref),
        child: const Icon(Icons.bug_report_outlined),
      ),
    );
  }
}
