import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/bug_report_service.dart';

class BugReportSheet extends StatefulWidget {
  final BugReportDraft draft;
  final ScrollController scrollController;
  final int minCommentLength;
  final Future<BugReportLaunchResult> Function(ReportKind kind, String comment) onSubmit;
  final bool popOnSuccess;
  final bool showIntro;
  final VoidCallback? onIntroDismiss;

  const BugReportSheet({
    super.key,
    required this.draft,
    required this.scrollController,
    required this.minCommentLength,
    required this.onSubmit,
    this.popOnSuccess = true,
    this.showIntro = false,
    this.onIntroDismiss,
  });

  @override
  State<BugReportSheet> createState() => _BugReportSheetState();
}

class _BugReportSheetState extends State<BugReportSheet> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _submitting = false;
  bool _introVisible = false;
  bool _introMarkedSeen = false;
  ReportKind _kind = ReportKind.comment;

  @override
  void initState() {
    super.initState();
    _introVisible = widget.showIntro;
    _controller.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_introVisible) {
        _focusNode.requestFocus();
      }
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

  String get _hintText => switch (_kind) {
        ReportKind.bug => 'What went wrong? Steps to reproduce help.',
        ReportKind.comment => 'Share feedback, an idea, or something confusing…',
      };

  String get _stepOneLabel => switch (_kind) {
        ReportKind.bug => 'Describe the bug',
        ReportKind.comment => 'Write your comment',
      };

  void _dismissIntro() {
    if (!_introMarkedSeen) {
      _introMarkedSeen = true;
      widget.onIntroDismiss?.call();
    }
    setState(() => _introVisible = false);
    _focusNode.requestFocus();
  }

  void _showIntroAgain() {
    setState(() => _introVisible = true);
  }

  Future<void> _submit() async {
    if (!_canSubmit) return;
    setState(() => _submitting = true);
    try {
      final result = await widget.onSubmit(_kind, _controller.text);
      if (!mounted) return;
      if (widget.popOnSuccess) {
        Navigator.pop(context);
      }
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
    final commentLength = _controller.text.trim().length;
    final isNarrow = MediaQuery.sizeOf(context).width < 400;

    return ListView(
      controller: widget.scrollController,
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        Text(
          'Send to GitHub',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Write your message, then finish on GitHub. A link to this screen is included automatically — not GPS or device location.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                _introVisible ? Icons.info : Icons.info_outline,
                color: theme.colorScheme.primary,
              ),
              tooltip: 'How feedback works',
              onPressed: _showIntroAgain,
            ),
          ],
        ),
        if (_introVisible) ...[
          const SizedBox(height: 16),
          _FeedbackIntroCard(
            theme: theme,
            onDismiss: _dismissIntro,
          ),
        ],
        const SizedBox(height: 16),
        SegmentedButton<ReportKind>(
          segments: const [
            ButtonSegment(
              value: ReportKind.comment,
              icon: Icon(Icons.chat_bubble_outline, size: 18),
              label: Text('Comment'),
            ),
            ButtonSegment(
              value: ReportKind.bug,
              icon: Icon(Icons.bug_report_outlined, size: 18),
              label: Text('Bug'),
            ),
          ],
          selected: {_kind},
          onSelectionChanged: (selection) {
            setState(() => _kind = selection.first);
          },
        ),
        const SizedBox(height: 16),
        _StepRow(
          step: 1,
          label: _stepOneLabel,
          isActive: true,
          theme: theme,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            Chip(
              avatar: Icon(Icons.layers_outlined, size: 18, color: theme.colorScheme.primary),
              label: Text('Screen: ${widget.draft.locationLabel}'),
            ),
            InputChip(
              avatar: const Icon(Icons.link, size: 18),
              label: Text(isNarrow ? 'Copy screen link' : 'Copy link to this screen'),
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: widget.draft.deepLink));
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Link to this screen copied')),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          minLines: isNarrow ? 3 : 4,
          maxLines: isNarrow ? 5 : 8,
          maxLength: 4000,
          textCapitalization: TextCapitalization.sentences,
          scrollPadding: const EdgeInsets.only(bottom: 120),
          decoration: InputDecoration(
            hintText: _hintText,
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
              : 'Ready to send as ${_kind == ReportKind.bug ? 'bug report' : 'comment'}',
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
    );
  }
}

class _FeedbackIntroCard extends StatelessWidget {
  final ThemeData theme;
  final VoidCallback onDismiss;

  const _FeedbackIntroCard({
    required this.theme,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: theme.colorScheme.primaryContainer.withValues(alpha: 0.45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.chat_bubble_outline, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Comments work from any screen',
                    style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _IntroBullet(
              theme: theme,
              text: 'Tap the chat icon while viewing whatever you want to talk about.',
            ),
            _IntroBullet(
              theme: theme,
              text: 'We attach a link to that screen in the report — not your GPS location.',
            ),
            _IntroBullet(
              theme: theme,
              text: 'Write here, then finish submitting on GitHub in one more step.',
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onDismiss,
                child: const Text('Got it'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroBullet extends StatelessWidget {
  final ThemeData theme;
  final String text;

  const _IntroBullet({
    required this.theme,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: theme.textTheme.bodyMedium),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.85),
              ),
            ),
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
