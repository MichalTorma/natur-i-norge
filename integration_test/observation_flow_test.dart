import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:naturinorge_guide/main.dart' as app;

import 'helpers/fake_camera_capture.dart';
import 'helpers/observation_flow_helpers.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('gallery capture flow saves observation on Android', (tester) async {
    registerFakeCameraCapture();
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    if (Platform.isAndroid) {
      await binding.convertFlutterSurfaceToImage();
      await tester.pumpAndSettle();
    }

    await waitForAppReady(tester);
    await selectGalleryTab(tester);
    await dismissBackupConsentIfShown(tester);
    await startCaptureFromGallery(tester);
    await takeFakePhoto(tester);
    await openTypePickerFromReview(tester);
    await searchAndSelectMappingUnit(tester);
    await waitForSaveEnabled(tester);
    await saveObservation(tester);
    await verifyObservationInGallery(
      tester,
      typeId: observationFlowMappingUnitId,
    );
  });
}
