import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _isInitialized = false;
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

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Field Camera')),
      body: _error != null
          ? Center(child: Text(_error!))
          : !_isInitialized
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    Positioned.fill(child: CameraPreview(_controller!)),
                    Positioned(
                      bottom: 40,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: FloatingActionButton.large(
                          onPressed: () {
                            // Capture image logic
                          },
                          child: const Icon(Icons.camera),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Point at nature to identify (coming soon)',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
