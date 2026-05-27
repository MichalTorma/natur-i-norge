import 'package:flutter/material.dart';

import '../models/nin_database.dart';
import 'camera_capture.dart';
import 'observation_review_screen.dart';

class CameraScreen extends StatefulWidget {
  final NinType? initialType;
  const CameraScreen({super.key, this.initialType});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late final CameraCapture _capture;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    initCameraCapture();
    _capture = CameraCapture.create();
    _initialize();
  }

  Future<void> _initialize() async {
    await _capture.initialize();
    if (mounted) {
      setState(() => _initialized = true);
    }
  }

  @override
  void dispose() {
    _capture.dispose();
    super.dispose();
  }

  Future<void> _captureImage() async {
    final result = await _capture.capture(widget.initialType);
    if (!mounted || result == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ObservationReviewScreen(
          imagePath: result.imagePath,
          initialType: widget.initialType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final preview = _capture.buildPreview();

    if (_capture.error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Capture Observation')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
                const SizedBox(height: 16),
                Text(_capture.error!, textAlign: TextAlign.center),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: _captureImage,
                  icon: const Icon(Icons.photo_library_outlined),
                  label: const Text('Choose Photo'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (!_initialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (preview == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Capture Observation')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.photo_camera_outlined, size: 64),
              const SizedBox(height: 16),
              const Text('Choose a photo for your observation'),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _capture.isCapturing ? null : _captureImage,
                icon: const Icon(Icons.photo_library_outlined),
                label: Text(_capture.isCapturing ? 'Loading...' : 'Choose Photo'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          preview,
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: FloatingActionButton.large(
                  onPressed: _capture.isCapturing ? null : _captureImage,
                  child: _capture.isCapturing
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Icon(Icons.camera_alt),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
