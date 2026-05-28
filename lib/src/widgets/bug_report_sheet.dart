import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/bug_report_service.dart';

class BugReportSheet extends StatefulWidget {
  final BugReportDraft draft;
  final int minCommentLength;
  final Future<BugReportLaunchResult> Function(String comment) onSubmit;

  const BugReportSheet({
    super.key,
    required this.draft,
    required this.minCommentLength,
    required this.onSubmit,
  });

  @override
  State<BugReportSheet> createState() => _BugReportSheetState();
}

class _BugReportSheetState extends State<BugReportSheet> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool get _canSubmit =>
      !_submitting && _controller.text.trim().length >= widget.minCommentLength;

  Future<void> _submit() async {
    if (!_canSubmit) return;
    setState(() => _submitting = true);
    try {
      final result = await widget.onSubmit(_controller.text);
      if (!mounted) return;
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(BugReportService.successMessage(result))),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open GitHub: $error')),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    final commentLength = _controller.text.trim().length;

    return Padding(
      padding: EdgeInsets.fromLTRB(24, 8, 24, 24 + bottomInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Report a problem',
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Write a short comment here. Your screen location and debug details are attached automatically on GitHub — no login needed in the app.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 16),
          _StepRow(
            step: 1,
            label: 'Describe the problem',
            isActive: true,
            theme: theme,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                avatar: Icon(Icons.place_outlined, size: 18, color: theme.colorScheme.primary),
                label: Text(widget.draft.locationLabel),
              ),
              InputChip(
                avatar: const Icon(Icons.link, size: 18),
                label: const Text('Copy reproduction link'),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: widget.draft.deepLink));
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Reproduction link copied')),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            minLines: 4,
            maxLines: 8,
            maxLength: 4000,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: 'What went wrong?',
              filled: true,
              fillColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            commentLength < widget.minCommentLength
                ? 'At least ${widget.minCommentLength} characters'
                : 'Ready to send',
            style: theme.textTheme.bodySmall?.copyWith(
              color: commentLength < widget.minCommentLength
                  ? theme.colorScheme.error
                  : theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          _StepRow(
            step: 2,
            label: 'Submit on GitHub (one click there)',
            isActive: _canSubmit,
            theme: theme,
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _canSubmit ? _submit : null,
            icon: _submitting
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: theme.colorScheme.onPrimary,
                    ),
                  )
                : const Icon(Icons.open_in_new),
            label: Text(_submitting ? 'Opening GitHub…' : 'Continue on GitHub'),
          ),
        ],
      ),
    );
  }
}

class _StepRow extends StatelessWidget {
  final int step;
  final String label;
  final bool isActive;
  final ThemeData theme;

  const _StepRow({
    required this.step,
    required this.label,
    required this.isActive,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? theme.colorScheme.primary : theme.colorScheme.outline;

    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: isActive
              ? theme.colorScheme.primaryContainer
              : theme.colorScheme.surfaceContainerHighest,
          child: Text(
            '$step',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isActive ? theme.colorScheme.onPrimaryContainer : theme.colorScheme.outline,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}
