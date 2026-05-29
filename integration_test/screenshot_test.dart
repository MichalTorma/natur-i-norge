import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:naturinorge_guide/main.dart' as app;
import 'package:naturinorge_guide/src/widgets/ecological_matrix.dart';
import 'package:naturinorge_guide/src/widgets/nin_search_sheet.dart';

/// Headroom after [LocalTypeImage] fade-in (420 ms) on slow simulators/emulators.
const _imageRevealDuration = Duration(milliseconds: 700);

/// Extra pump after Flutter reports settled — CI simulators lag behind frames.
const _simulatorSettleBuffer = Duration(milliseconds: 1800);

const _allScreenshots = {
  '1_home_screen',
  '2_search_results',
  '3_natb01_detail',
  '4_natb01_matrix',
};

const _screenshotAliases = {
  '1': '1_home_screen',
  '2': '2_search_results',
  '3': '3_natb01_detail',
  '4': '4_natb01_matrix',
  'home': '1_home_screen',
  'search': '2_search_results',
  'detail': '3_natb01_detail',
  'matrix': '4_natb01_matrix',
};

const _offstage = false;

Set<String> screenshotsToCapture() {
  const raw = String.fromEnvironment('SCREENSHOTS', defaultValue: 'all');
  if (raw == 'all') return _allScreenshots;

  return raw.split(',').map((part) {
    final key = part.trim();
    return _screenshotAliases[key] ?? key;
  }).toSet();
}

bool needsNaTb01Detail(Set<String> selected) {
  return selected.contains('3_natb01_detail') ||
      selected.contains('4_natb01_matrix');
}

Finder _loadedTypeImages() {
  return find.byWidgetPredicate(
    (widget) => widget is Image && widget.image is MemoryImage,
  );
}

(int minLoadedImages, Duration extra) _screenshotWaitParams(String name) {
  return switch (name) {
    '1_home_screen' => (4, Duration.zero),
    '2_search_results' => (0, Duration.zero),
    '3_natb01_detail' => (1, Duration.zero),
    '4_natb01_matrix' => (0, const Duration(seconds: 1)),
    _ => (0, Duration.zero),
  };
}

Future<void> waitBeforeScreenshot(
  WidgetTester tester, {
  int minLoadedImages = 0,
  Duration extra = Duration.zero,
}) async {
  await tester.pumpAndSettle(const Duration(seconds: 3));

  for (var attempt = 0; attempt < 90; attempt++) {
    await tester.pump(const Duration(milliseconds: 500));
    if (find.byType(CircularProgressIndicator).evaluate().isEmpty) break;
  }

  if (minLoadedImages > 0) {
    for (var attempt = 0; attempt < 80; attempt++) {
      await tester.pump(const Duration(milliseconds: 500));
      if (_loadedTypeImages().evaluate().length >= minLoadedImages) break;
    }
    await tester.pump(_imageRevealDuration);
  }

  await tester.pump(_simulatorSettleBuffer + extra);
}

Future<void> maybeCaptureScreenshot(
  WidgetTester tester,
  IntegrationTestWidgetsFlutterBinding binding,
  Set<String> selected,
  String name,
) async {
  if (!selected.contains(name)) return;
  final (minLoadedImages, extra) = _screenshotWaitParams(name);
  await waitBeforeScreenshot(
    tester,
    minLoadedImages: minLoadedImages,
    extra: extra,
  );
  await binding.takeScreenshot(name);
  print('Captured $name');
}

Future<void> waitForTypesHome(WidgetTester tester) async {
  final searchEntry = find.byWidgetPredicate(
    (widget) => widget is TextField && widget.readOnly,
  );

  for (var attempt = 0; attempt < 120; attempt++) {
    await tester.pump(const Duration(milliseconds: 500));
    if (searchEntry.evaluate().isNotEmpty) return;
  }

  expect(searchEntry, findsOneWidget);
}

Future<void> openSearchSheet(WidgetTester tester) async {
  await waitForTypesHome(tester);

  final searchEntry = find.byWidgetPredicate(
    (widget) => widget is TextField && widget.readOnly,
  );
  expect(searchEntry, findsOneWidget);
  await tester.tap(searchEntry);
  await tester.pumpAndSettle();
}

Future<void> closeSearchSheet(WidgetTester tester) async {
  FocusManager.instance.primaryFocus?.unfocus();
  await tester.pump(const Duration(milliseconds: 300));

  final sheet = find.byType(NinSearchSheet);
  if (sheet.evaluate().isEmpty) return;

  // Search is a modal bottom sheet, not a pushed route with a back button.
  Navigator.of(tester.element(sheet)).pop();
  await tester.pumpAndSettle(const Duration(seconds: 1));
}

Future<void> captureSearchResults(
  WidgetTester tester,
  IntegrationTestWidgetsFlutterBinding binding,
  Set<String> selected,
) async {
  await openSearchSheet(tester);

  final searchField = find.byWidgetPredicate(
    (widget) => widget is TextField && !widget.readOnly,
  );
  expect(searchField, findsOneWidget);
  await tester.enterText(searchField, 'NA-TB01');
  await tester.pump(const Duration(milliseconds: 300));
  await tester.pumpAndSettle(const Duration(seconds: 3));

  final searchResult = find.descendant(
    of: find.byType(ListTile, skipOffstage: _offstage),
    matching: find.text('Fastmarksskogsmark', skipOffstage: _offstage),
  );
  for (var attempt = 0; attempt < 30; attempt++) {
    await tester.pump(const Duration(milliseconds: 500));
    if (searchResult.evaluate().isNotEmpty) break;
  }
  expect(searchResult, findsOneWidget);

  FocusManager.instance.primaryFocus?.unfocus();
  await tester.pumpAndSettle(const Duration(seconds: 1));

  await maybeCaptureScreenshot(tester, binding, selected, '2_search_results');
  await closeSearchSheet(tester);
}

Future<void> openNaTb01FromSearch(WidgetTester tester) async {
  await openSearchSheet(tester);

  final searchField = find.byWidgetPredicate(
    (widget) => widget is TextField && !widget.readOnly,
  );
  expect(searchField, findsOneWidget);
  await tester.enterText(searchField, 'NA-TB01');
  await tester.pump(const Duration(milliseconds: 300));
  await tester.pumpAndSettle(const Duration(seconds: 2));

  final searchResult = find.descendant(
    of: find.byType(ListTile, skipOffstage: _offstage),
    matching: find.text('Fastmarksskogsmark', skipOffstage: _offstage),
  );
  expect(searchResult, findsOneWidget);
  await tester.tap(searchResult);
  await tester.pumpAndSettle(const Duration(seconds: 10));

  FocusManager.instance.primaryFocus?.unfocus();
  await tester.pumpAndSettle(const Duration(seconds: 1));

  expect(find.text('Beskrivelse', skipOffstage: _offstage), findsWidgets);
}

Finder naTb01DetailScrollView() {
  final title = find.descendant(
    of: find.byType(SliverAppBar, skipOffstage: _offstage),
    matching: find.text('Fastmarksskogsmark', skipOffstage: _offstage),
  );
  expect(title, findsWidgets);

  final scrollView = find.ancestor(
    of: title.last,
    matching: find.byType(CustomScrollView, skipOffstage: _offstage),
  );
  expect(scrollView, findsOneWidget);
  return scrollView;
}

Future<void> scrollPageDown(
  WidgetTester tester,
  Finder scrollView, {
  double delta = 900,
}) async {
  // Drag from the page viewport center. Nested markdown/matrix scrollables
  // must not be used here — they have tiny ranges and absorb the gesture.
  await tester.dragFrom(tester.getCenter(scrollView), Offset(0, -delta));
  await tester.pump(const Duration(milliseconds: 250));
}

Future<void> scrollToEcologicalMatrix(WidgetTester tester) async {
  final scrollView = naTb01DetailScrollView();
  final matrixHeader = find.textContaining(
    'ECOLOGICAL MATRIX',
    skipOffstage: _offstage,
  );
  final matrixWidget = find.byType(EcologicalMatrix, skipOffstage: _offstage);
  final matrixCell = find.textContaining('TB01-', skipOffstage: _offstage);

  FocusManager.instance.primaryFocus?.unfocus();
  await tester.pumpAndSettle(const Duration(seconds: 1));
  expect(find.byType(NinSearchSheet), findsNothing);

  final viewSize = tester.view.physicalSize / tester.view.devicePixelRatio;
  final pageScrollDelta = viewSize.height * 0.45;
  final fineScrollDelta = viewSize.height * 0.12;
  final targetTopMin = viewSize.height * 0.05;
  final targetTopMax = viewSize.height * 0.2;

  // Search navigation leaves the full highlighted description expanded, so the
  // matrix sliver is far below the fold and builds lazily while scrolling.
  for (var i = 0; i < 100; i++) {
    if (matrixWidget.evaluate().isNotEmpty &&
        matrixHeader.evaluate().isNotEmpty &&
        matrixCell.evaluate().isNotEmpty) {
      break;
    }
    await scrollPageDown(tester, scrollView, delta: pageScrollDelta);
  }

  expect(matrixWidget, findsWidgets);
  expect(matrixHeader, findsWidgets);
  expect(matrixCell, findsWidgets);

  // Do not use ensureVisible here — EcologicalMatrix is taller than the viewport
  // and contains nested scrollables, so ensureVisible loops on drag gestures.
  for (var i = 0; i < 24; i++) {
    final headerTop = tester.getRect(matrixHeader.first).top;
    if (headerTop >= targetTopMin && headerTop <= targetTopMax) break;
    final delta = headerTop < targetTopMin ? fineScrollDelta : -fineScrollDelta;
    await tester.dragFrom(tester.getCenter(scrollView), Offset(0, delta));
    await tester.pump(const Duration(milliseconds: 250));
  }

  await tester.pumpAndSettle(const Duration(seconds: 2));
  await tester.pump(_simulatorSettleBuffer);
}

void main() {
  final IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final selected = screenshotsToCapture();

  testWidgets('take screenshots', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    if (Platform.isAndroid) {
      await binding.convertFlutterSurfaceToImage();
      await tester.pumpAndSettle();
    }

    await waitForTypesHome(tester);
    await maybeCaptureScreenshot(tester, binding, selected, '1_home_screen');

    if (selected.contains('2_search_results')) {
      await captureSearchResults(tester, binding, selected);
    }

    if (needsNaTb01Detail(selected)) {
      await openNaTb01FromSearch(tester);
      await maybeCaptureScreenshot(tester, binding, selected, '3_natb01_detail');

      if (selected.contains('4_natb01_matrix')) {
        await scrollToEcologicalMatrix(tester);
        await maybeCaptureScreenshot(tester, binding, selected, '4_natb01_matrix');
      }
    }

    print('Screenshot automation complete (${selected.join(', ')})');
  });
}
