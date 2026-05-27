import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/nin_database.dart';
import '../services/app_storage.dart';
import 'camera_capture_stub.dart';

CameraCapture createCameraCapture() => NativeCameraCapture();

class NativeCameraCapture implements CameraCapture {
  CameraController? _controller;
  bool _isInitialized = false;
  bool _isCapturing = false;
  String? _error;

  @override
  bool get isInitialized => _isInitialized;

  @override
  String? get error => _error;

  @override
  bool get isCapturing => _isCapturing;

  @override
  Future<void> initialize() async {
    final status = await Permission.camera.request();
    if (!status.isGranted) {
      _error = 'Camera permission denied.';
      return;
    }

    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        _error = 'No cameras found.';
        return;
      }

      _controller = CameraController(cameras[0], ResolutionPreset.high);
      await _controller!.initialize();
      _isInitialized = true;
    } catch (e) {
      _error = 'Camera error: $e';
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
  }

  @override
  Widget? buildPreview() {
    if (_controller == null || !_controller!.value.isInitialized) {
      return null;
    }
    return CameraPreview(_controller!);
  }

  @override
  Future<CaptureResult?> capture(NinType? initialType) async {
    if (_controller == null || !_controller!.value.isInitialized || _isCapturing) {
      return null;
    }

    _isCapturing = true;
    try {
      final image = await _controller!.takePicture();
      final bytes = await File(image.path).readAsBytes();
      final savedPath = await AppStorage.instance.saveObservationImage(bytes);
      return (imagePath: savedPath, bytes: bytes);
    } finally {
      _isCapturing = false;
    }
  }
}
