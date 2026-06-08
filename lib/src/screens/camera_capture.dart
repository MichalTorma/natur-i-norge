import 'camera_capture_stub.dart';
import 'camera_capture_platform.dart'
    if (dart.library.js_interop) 'camera_capture_web.dart'
    if (dart.library.ffi) 'camera_capture_native.dart'
    as platform;

export 'camera_capture_stub.dart';

bool _cameraCaptureInitialized = false;

/// Must be called before accessing [CameraCapture.create].
void initCameraCapture() {
  if (_cameraCaptureInitialized) return;
  if (!CameraCapture.hasRegisteredFactory) {
    CameraCapture.registerFactory(platform.createCameraCapture);
  }
  _cameraCaptureInitialized = true;
}
