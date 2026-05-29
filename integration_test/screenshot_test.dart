import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:naturinorge_guide/main.dart' as app;
import 'package:naturinorge_guide/src/widgets/ecological_matrix.dart';
import 'package:naturinorge_guide/src/widgets/nin_search_sheet.dart';

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

Future<void> maybeCaptureScreenshot(
  IntegrationTestWidgetsFlutterBinding binding,
  Set<String> selected,
  String name,
) async {
  if (!selected.contains(name)) return;
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
  await tester.pumpAndSettle(const Duration(seconds: 2));

  FocusManager.instance.primaryFocus?.unfocus();
  await tester.pumpAndSettle(const Duration(seconds: 1));

  await maybeCaptureScreenshot(binding, selected, '2_search_results');
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

  FocusManager.instance.primaryFocus?.unfocus();
  await tester.pumpAndSettle(const Duration(seconds: 1));

  // Search navigation leaves the full highlighted description expanded, so the
  // matrix sliver is far below the fold and builds lazily while scrolling.
  for (var i = 0; i < 80; i++) {
    if (matrixWidget.evaluate().isNotEmpty &&
        matrixHeader.evaluate().isNotEmpty) {
      break;
    }
    await scrollPageDown(tester, scrollView);
  }

  expect(matrixWidget, findsWidgets);
  expect(matrixHeader, findsWidgets);

  // Do not use ensureVisible here — EcologicalMatrix is taller than the viewport
  // and contains nested scrollables, so ensureVisible loops on drag gestures.
  for (var i = 0; i < 12; i++) {
    final headerTop = tester.getRect(matrixHeader.first).top;
    if (headerTop >= 72 && headerTop <= 220) break;
    final delta = headerTop < 72 ? 150.0 : -150.0;
    await tester.dragFrom(tester.getCenter(scrollView), Offset(0, delta));
    await tester.pump(const Duration(milliseconds: 250));
  }

  await tester.pump(const Duration(milliseconds: 500));
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
    await maybeCaptureScreenshot(binding, selected, '1_home_screen');

    if (selected.contains('2_search_results')) {
      await captureSearchResults(tester, binding, selected);
    }

    if (needsNaTb01Detail(selected)) {
      await openNaTb01FromSearch(tester);
      await maybeCaptureScreenshot(binding, selected, '3_natb01_detail');


      if (selected.contains('4_natb01_matrix')) {
        await scrollToEcologicalMatrix(tester);
        await maybeCaptureScreenshot(binding, selected, '4_natb01_matrix');
      }
    }

    print('Screenshot automation complete (${selected.join(', ')})');
  });
}
