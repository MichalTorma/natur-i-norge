import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../services/app_storage.dart';

class LocalTypeImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit fit;
  final String? semanticLabel;
  final Widget? placeholder;
  final EdgeInsetsGeometry? padding;

  const LocalTypeImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.semanticLabel,
    this.placeholder,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return placeholder ?? const SizedBox.shrink();
    }

    return FutureBuilder<List<int>?>(
      future: AppStorage.instance.readTypeImage(imageUrl!),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final image = Image.memory(
            Uint8List.fromList(snapshot.data!),
            fit: fit,
            semanticLabel: semanticLabel,
          );
          if (padding != null) {
            return Padding(padding: padding!, child: image);
          }
          return image;
        }
        return placeholder ?? const SizedBox.shrink();
      },
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
