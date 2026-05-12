import 'dart:io';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  try {
    await integrationDriver(
      onScreenshot: (String screenshotName, List<int> screenshotBytes, [Map<String, dynamic>? args]) async {
        final File image = File('screenshots/$screenshotName.png');
        image.parent.createSync(recursive: true);
        await image.writeAsBytes(screenshotBytes);
        print('Saved screenshot: $screenshotName.png');
        return true;
      },
    );
  } catch (e) {
    print('Error occurred during driving: $e');
  }
}
