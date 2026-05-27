import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'local_image.dart';

Future<void> showTypeImageViewer(
  BuildContext context, {
  required String imageUrl,
  String? title,
}) {
  return Navigator.of(context, rootNavigator: true).push<void>(
    MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (context) => _TypeImageViewerPage(
        imageUrl: imageUrl,
        title: title,
      ),
    ),
  );
}

class _TypeImageViewerPage extends StatefulWidget {
  final String imageUrl;
  final String? title;

  const _TypeImageViewerPage({
    required this.imageUrl,
    this.title,
  });

  @override
  State<_TypeImageViewerPage> createState() => _TypeImageViewerPageState();
}

class _TypeImageViewerPageState extends State<_TypeImageViewerPage> {
  late Future<Uint8List?> _bytesFuture;
  final TransformationController _transformController = TransformationController();

  @override
  void initState() {
    super.initState();
    _bytesFuture = LocalTypeImage.loadBytes(widget.imageUrl);
  }

  @override
  void dispose() {
    _transformController.dispose();
    super.dispose();
  }

  void _resetZoom() {
    _transformController.value = Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'Close',
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: widget.title == null
              ? null
              : Text(
                  widget.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
          actions: [
            IconButton(
              icon: const Icon(Icons.zoom_out_map),
              tooltip: 'Reset zoom',
              onPressed: _resetZoom,
            ),
          ],
        ),
        body: FutureBuilder<Uint8List?>(
          future: _bytesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white70),
              );
            }

            final bytes = snapshot.data;
            if (bytes == null) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.broken_image_outlined, color: Colors.white54, size: 48),
                    const SizedBox(height: 12),
                    Text(
                      'Could not load image',
                      style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    ),
                  ],
                ),
              );
            }

            return LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final height = constraints.maxHeight;

                return InteractiveViewer(
                  transformationController: _transformController,
                  minScale: 0.5,
                  maxScale: 5,
                  panEnabled: true,
                  scaleEnabled: true,
                  clipBehavior: Clip.none,
                  boundaryMargin: const EdgeInsets.all(80),
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: Center(
                      child: Image.memory(
                        bytes,
                        width: width,
                        height: height,
                        fit: BoxFit.contain,
                        semanticLabel: widget.title,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
