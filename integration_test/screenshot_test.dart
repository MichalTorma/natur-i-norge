import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:naturinorge_guide/main.dart' as app;

void main() {
  final IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('take screenshots', (WidgetTester tester) async {
    // 1. Start the app (Now robust and offline-ready!)
    app.main();
    await tester.pumpAndSettle();

    // Required for Android screenshots
    if (Platform.isAndroid) {
        await binding.convertFlutterSurfaceToImage();
        await tester.pumpAndSettle();
    }

    // 2. Take a screenshot of the Home Screen
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await binding.takeScreenshot('1_home_screen');
    print('Captured 1_home_screen');

    // 3. Search for NA-TB01
    final searchFinder = find.byType(TextField);
    await tester.enterText(searchFinder, 'NA-TB01');
    
    // Hide the keyboard to restore full-screen layout
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    
    await binding.takeScreenshot('2_search_results');
    print('Captured 2_search_results');

    // 4. Click on the NA-TB01 card
    final cardFinder = find.descendant(
        of: find.byType(GridView), 
        matching: find.text('NA-TB01')
    );
    
    if (cardFinder.evaluate().isNotEmpty) {
        await tester.tap(cardFinder.first);
        await tester.pumpAndSettle(const Duration(seconds: 3)); // Extra time for detail page
        await binding.takeScreenshot('3_natb01_detail');
        print('Captured 3_natb01_detail');

        // 5. Scroll down to show the matrix
        await tester.drag(find.byType(CustomScrollView), const Offset(0, -400));
        await tester.pumpAndSettle(const Duration(seconds: 2));
        await binding.takeScreenshot('4_natb01_matrix');
        print('Captured 4_natb01_matrix');
    }

    print('Screenshot automation complete!');
  });
}
