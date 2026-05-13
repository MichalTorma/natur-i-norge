import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../models/nin_database.dart';
import 'observation_review_screen.dart';

class CameraScreen extends StatefulWidget {
  final NinType? initialType;
  const CameraScreen({super.key, this.initialType});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _isInitialized = false;
  bool _isCapturing = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      try {
        final cameras = await availableCameras();
        if (cameras.isEmpty) {
          setState(() => _error = 'No cameras found.');
          return;
        }

        _controller = CameraController(cameras[0], ResolutionPreset.high);
        await _controller!.initialize();
        if (mounted) {
          setState(() => _isInitialized = true);
        }
      } catch (e) {
        setState(() => _error = 'Camera error: $e');
      }
    } else {
      setState(() => _error = 'Camera permission denied.');
    }
  }

  Future<void> _captureImage() async {
    if (_controller == null || !_controller!.value.isInitialized || _isCapturing) return;

    setState(() => _isCapturing = true);

    try {
      final image = await _controller!.takePicture();
      
      // Save to app documents directory
      final docsDir = await getApplicationDocumentsDirectory();
      final observationsDir = Directory(p.join(docsDir.path, 'observations'));
      if (!await observationsDir.exists()) {
        await observationsDir.create(recursive: true);
      }
      
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final savedFile = await File(image.path).copy(p.join(observationsDir.path, fileName));

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ObservationReviewScreen(
              imagePath: savedFile.path,
              initialType: widget.initialType,
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Capture failed: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isCapturing = false);
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Field Camera'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: _error != null
          ? Center(child: Text(_error!, style: const TextStyle(color: Colors.white)))
          : !_isInitialized
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    Positioned.fill(
                      child: AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: CameraPreview(_controller!),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: _isCapturing
                            ? const CircularProgressIndicator(color: Colors.white)
                            : FloatingActionButton.large(
                                onPressed: _captureImage,
                                tooltip: 'Capture photo of nature type',
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                child: const Icon(Icons.camera, size: 40),
                              ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.gps_fixed, size: 14, color: Colors.green),
                            SizedBox(width: 8),
                            Text(
                              'GPS Active',
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
