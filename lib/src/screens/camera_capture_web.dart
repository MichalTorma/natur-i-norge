import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/nin_database.dart';
import '../services/app_storage.dart';
import 'camera_capture_stub.dart';

CameraCapture createCameraCapture() => WebCameraCapture();

class WebCameraCapture implements CameraCapture {
  final ImagePicker _picker = ImagePicker();
  bool _isCapturing = false;
  String? _error;

  @override
  bool get isInitialized => true;

  @override
  String? get error => _error;

  @override
  bool get isCapturing => _isCapturing;

  @override
  Future<void> initialize() async {}

  @override
  void dispose() {}

  @override
  Widget? buildPreview() => null;

  @override
  Future<CaptureResult?> capture(NinType? initialType) async {
    if (_isCapturing) return null;

    _isCapturing = true;
    try {
      final image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 90,
      );
      if (image == null) return null;

      final bytes = await image.readAsBytes();
      final String savedPath = await AppStorage.instance.saveObservationImage(bytes.toList());
      return (imagePath: savedPath, bytes: bytes.toList());
    } catch (e) {
      _error = 'Could not pick image: $e';
      return null;
    } finally {
      _isCapturing = false;
    }
  }
}
