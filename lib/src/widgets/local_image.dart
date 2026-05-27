import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../services/app_storage.dart';

class LocalTypeImage extends StatefulWidget {
  final String? imageUrl;
  final BoxFit fit;
  final String? semanticLabel;
  final Widget? placeholder;
  final EdgeInsetsGeometry? padding;
  final Color? accentColor;

  const LocalTypeImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.semanticLabel,
    this.placeholder,
    this.padding,
    this.accentColor,
  });

  static final Map<String, Uint8List> _cache = {};

  static Future<Uint8List?> loadBytes(String imageUrl) async {
    final cached = _cache[imageUrl];
    if (cached != null) return cached;

    final bytes = await AppStorage.instance.readTypeImage(imageUrl);
    if (bytes == null) return null;

    final data = Uint8List.fromList(bytes);
    _cache[imageUrl] = data;
    return data;
  }

  @override
  State<LocalTypeImage> createState() => _LocalTypeImageState();
}

class _LocalTypeImageState extends State<LocalTypeImage>
    with SingleTickerProviderStateMixin {
  late Future<_TypeImageResult> _loadFuture;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    _loadFuture = _loadImage();
  }

  @override
  void didUpdateWidget(covariant LocalTypeImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      _fadeController.reset();
      _revealed = false;
      _loadFuture = _loadImage();
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  Future<_TypeImageResult> _loadImage() async {
    final imageUrl = widget.imageUrl;
    if (imageUrl == null) {
      return const _TypeImageResult.missing();
    }

    final cached = LocalTypeImage._cache[imageUrl];
    if (cached != null) {
      return _TypeImageResult(data: cached, fromCache: true);
    }

    final bytes = await AppStorage.instance.readTypeImage(imageUrl);
    if (bytes == null) {
      return const _TypeImageResult.missing();
    }

    final data = Uint8List.fromList(bytes);
    LocalTypeImage._cache[imageUrl] = data;
    return _TypeImageResult(data: data, fromCache: false);
  }

  void _revealImage(_TypeImageResult result) {
    if (_revealed || !result.hasData) return;
    _revealed = true;
    if (result.fromCache) {
      _fadeController.value = 1;
    } else {
      _fadeController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrl == null) {
      return widget.placeholder ?? _TypeImagePlaceholder.missing(context);
    }

    return FutureBuilder<_TypeImageResult>(
      future: _loadFuture,
      builder: (context, snapshot) {
        final result = snapshot.data;
        final isLoading = snapshot.connectionState != ConnectionState.done;
        final hasImage = result?.hasData ?? false;

        if (hasImage && result != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) _revealImage(result);
          });
        }

        Widget content = Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.center,
          children: [
            if (!hasImage)
              isLoading
                  ? _TypeImagePlaceholder.loading(
                      context,
                      accentColor: widget.accentColor,
                      fallback: widget.placeholder,
                    )
                  : (widget.placeholder ??
                      _TypeImagePlaceholder.missing(context)),
            if (hasImage)
              FadeTransition(
                opacity: _fadeAnimation,
                child: Image.memory(
                  result!.data!,
                  fit: widget.fit,
                  semanticLabel: widget.semanticLabel,
                  gaplessPlayback: true,
                ),
              ),
          ],
        );

        if (widget.padding != null) {
          content = Padding(padding: widget.padding!, child: content);
        }

        return content;
      },
    );
  }
}

class _TypeImageResult {
  final Uint8List? data;
  final bool fromCache;

  const _TypeImageResult({this.data, this.fromCache = false});

  const _TypeImageResult.missing() : data = null, fromCache = false;

  bool get hasData => data != null;
}

class _TypeImagePlaceholder extends StatelessWidget {
  final Color? accentColor;
  final Widget? fallback;
  final bool showShimmer;
  final bool showMissingIcon;

  const _TypeImagePlaceholder({
    this.accentColor,
    this.fallback,
    this.showShimmer = false,
    this.showMissingIcon = false,
  });

  factory _TypeImagePlaceholder.loading(
    BuildContext context, {
    Color? accentColor,
    Widget? fallback,
  }) {
    return _TypeImagePlaceholder(
      accentColor: accentColor,
      fallback: fallback,
      showShimmer: true,
    );
  }

  factory _TypeImagePlaceholder.missing(BuildContext context) {
    return const _TypeImagePlaceholder(showMissingIcon: true);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final tint = accentColor ?? colorScheme.primary;

    Widget base = fallback ??
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.alphaBlend(tint.withOpacity(0.18), colorScheme.surfaceContainerHighest),
                Color.alphaBlend(tint.withOpacity(0.06), colorScheme.surfaceContainer),
              ],
            ),
          ),
        );

    if (showShimmer) {
      base = _ShimmerOverlay(accentColor: tint, child: base);
    }

    if (showMissingIcon) {
      base = Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.center,
        children: [
          base,
          Icon(
            Icons.image_not_supported_outlined,
            color: colorScheme.onSurface.withOpacity(0.28),
            size: 28,
          ),
        ],
      );
    }

    return base;
  }
}

class _ShimmerOverlay extends StatefulWidget {
  final Widget child;
  final Color accentColor;

  const _ShimmerOverlay({
    required this.child,
    required this.accentColor,
  });

  @override
  State<_ShimmerOverlay> createState() => _ShimmerOverlayState();
}

class _ShimmerOverlayState extends State<_ShimmerOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      fit: StackFit.passthrough,
      children: [
        widget.child,
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              if (!width.isFinite || width <= 0) {
                return const SizedBox.shrink();
              }

              return AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  final shimmerWidth = width * 0.55;
                  final travel = width + shimmerWidth;
                  final offset = travel * _controller.value - shimmerWidth;

                  return ClipRect(
                    child: Transform.translate(
                      offset: Offset(offset, 0),
                      child: Container(
                        width: shimmerWidth,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Color.alphaBlend(
                                widget.accentColor.withOpacity(0.12),
                                colorScheme.onSurface.withOpacity(0.06),
                              ),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class LocalObservationImage extends StatelessWidget {
  final String imagePath;
  final String? cloudUrl;
  final BoxFit fit;
  final String? semanticLabel;

  const LocalObservationImage({
    super.key,
    required this.imagePath,
    this.cloudUrl,
    this.fit = BoxFit.cover,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>?>(
      future: AppStorage.instance.readBytes(_storageKey(imagePath)),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Image.memory(
            Uint8List.fromList(snapshot.data!),
            fit: fit,
            semanticLabel: semanticLabel,
          );
        }
        if (cloudUrl != null && cloudUrl!.isNotEmpty) {
          return Image.network(
            cloudUrl!,
            fit: fit,
            semanticLabel: semanticLabel,
            errorBuilder: (_, __, ___) => _placeholder(context),
          );
        }
        return _placeholder(context);
      },
    );
  }

  String _storageKey(String path) {
    final marker = 'observations/';
    final index = path.indexOf(marker);
    if (index >= 0) {
      return path.substring(index);
    }
    return path;
  }

  Widget _placeholder(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Icon(Icons.image_not_supported),
    );
  }
}
