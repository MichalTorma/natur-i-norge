import 'package:flutter/material.dart';

import '../models/nin_database.dart';

typedef CaptureResult = ({String imagePath, List<int> bytes});
typedef CameraCaptureFactory = CameraCapture Function();

abstract class CameraCapture {
  static CameraCaptureFactory? _factory;

  static CameraCapture create() {
    final factory = _factory;
    if (factory == null) {
      throw StateError('CameraCapture factory not registered');
    }
    return factory();
  }

  static void registerFactory(CameraCaptureFactory factory) {
    _factory = factory;
  }

  Future<void> initialize();

  void dispose();

  bool get isInitialized;

  String? get error;

  bool get isCapturing;

  Widget? buildPreview();

  Future<CaptureResult?> capture(NinType? initialType);
}
