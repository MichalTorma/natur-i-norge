// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('NiN guide', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final ninStructureBtnFinder = find.byValueKey('nin_structure_btn');
    final lkmBtnFinder = find.byValueKey('lkm_btn');
    final speciesBtn = find.byValueKey('species_btn');
    final majorTypeGroupFinder = find.byType('MajorTypeGroupButton');
    final majorTypeFinder = find.byType('MajorTypeButton');
    final backBtnFinder = find.byTooltip('Tilbake');
    final LoadingFinder = find.byType('LoadingWidget');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Check all major types', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      await driver.waitForAbsent(LoadingFinder);
      await driver.tap(ninStructureBtnFinder);
      await driver.waitFor(majorTypeGroupFinder);
      await driver.tap(majorTypeGroupFinder);

      // expect(await driver.(counterTextFinder), "0");
    });
  });
}
