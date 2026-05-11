import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ExpandableMarkdown extends StatefulWidget {
  final String data;
  final int maxCollapsedHeight;

  const ExpandableMarkdown({
    super.key,
    required this.data,
    this.maxCollapsedHeight = 200,
  });

  @override
  State<ExpandableMarkdown> createState() => _ExpandableMarkdownState();
}

class _ExpandableMarkdownState extends State<ExpandableMarkdown> {
  bool _isExpanded = false;
  bool _canExpand = false;
  final GlobalKey _contentKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkHeight());
  }

  void _checkHeight() {
    final RenderBox? renderBox = _contentKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      setState(() {
        _canExpand = renderBox.size.height > widget.maxCollapsedHeight;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final markdownContent = MarkdownBody(
      data: widget.data,
      selectable: true,
      styleSheet: MarkdownStyleSheet(
        p: theme.textTheme.bodyMedium?.copyWith(fontSize: 16, height: 1.6, letterSpacing: 0.2),
        h1: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary),
        h2: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary),
        h3: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary),
        listBullet: TextStyle(color: colorScheme.primary),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Measurement widget (hidden)
        Offstage(
          child: Container(
            key: _contentKey,
            child: markdownContent,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          constraints: BoxConstraints(
            maxHeight: _isExpanded ? 10000 : widget.maxCollapsedHeight.toDouble(),
          ),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: markdownContent,
              ),
              if (!_isExpanded && _canExpand)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          colorScheme.surface.withOpacity(0),
                          colorScheme.surface,
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (_canExpand) ...[
          const SizedBox(height: 4),
          TextButton.icon(
            onPressed: () => setState(() => _isExpanded = !_isExpanded),
            icon: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: colorScheme.primary,
            ),
            label: Text(
              _isExpanded ? 'VIS MINDRE' : 'LES MER',
              style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 12),
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ],
    );
  }
}
