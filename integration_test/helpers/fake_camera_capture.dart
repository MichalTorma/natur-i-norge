import 'package:flutter/material.dart';
import 'package:naturinorge_guide/src/models/nin_database.dart';
import 'package:naturinorge_guide/src/screens/camera_capture_stub.dart';
import 'package:naturinorge_guide/src/services/app_storage.dart';

/// Minimal 1x1 PNG used as a stand-in photo in integration tests.
const _fakePngBytes = <int>[
  0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,
  0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x08, 0x02, 0x00, 0x00, 0x00, 0x90, 0x77, 0x53,
  0xDE, 0x00, 0x00, 0x00, 0x0C, 0x49, 0x44, 0x41, 0x54, 0x08, 0xD7, 0x63, 0xF8, 0xCF, 0xC0, 0x00,
  0x00, 0x03, 0x01, 0x01, 0x00, 0x18, 0xDD, 0x8D, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x49, 0x45, 0x4E,
  0x44, 0xAE, 0x42, 0x60, 0x82,
];

void registerFakeCameraCapture() {
  CameraCapture.registerFactory(FakeCameraCapture.new);
}

class FakeCameraCapture implements CameraCapture {
  @override
  bool get isInitialized => true;

  @override
  String? get error => null;

  @override
  bool get isCapturing => _isCapturing;

  bool _isCapturing = false;

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
      final savedPath = await AppStorage.instance.saveObservationImage(_fakePngBytes);
      return (imagePath: savedPath, bytes: _fakePngBytes);
    } finally {
      _isCapturing = false;
    }
  }
}
