import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  await integrationDriver(
    onScreenshot: (
      String screenshotName,
      List<int> screenshotBytes, [
      Map<String, dynamic>? args,
    ]) async {
      final File image = File('screenshots/$screenshotName.png');
      image.parent.createSync(recursive: true);
      await image.writeAsBytes(screenshotBytes);
      print('Saved screenshot: $screenshotName.png');
      return true;
    },
  );
}
