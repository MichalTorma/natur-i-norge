import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const observationFlowMappingUnitId = 'TO04-M005-03';
const observationFlowMappingUnitNavn =
    'Svært intensivt høstet jordbruksmark med utjevnet overflate';

const _offstage = false;

Future<void> waitForAppReady(WidgetTester tester) async {
  for (var attempt = 0; attempt < 120; attempt++) {
    await tester.pump(const Duration(milliseconds: 500));
    final searchEntry = find.byWidgetPredicate(
      (widget) => widget is TextField && widget.readOnly,
    );
    if (searchEntry.evaluate().isNotEmpty) return;
  }
  fail('App did not reach the types home screen in time');
}

Future<void> selectGalleryTab(WidgetTester tester) async {
  final galleryTab = find.text('Gallery', skipOffstage: _offstage);
  expect(galleryTab, findsOneWidget);
  await tester.tap(galleryTab);
  await tester.pumpAndSettle();
}

Future<void> dismissBackupConsentIfShown(WidgetTester tester) async {
  final maybeLater = find.text('Maybe Later', skipOffstage: _offstage);
  if (maybeLater.evaluate().isEmpty) return;
  await tester.tap(maybeLater);
  await tester.pumpAndSettle();
}

Future<void> startCaptureFromGallery(WidgetTester tester) async {
  final captureFab = find.widgetWithText(FloatingActionButton, 'Capture');
  if (captureFab.evaluate().isEmpty) {
    await tester.tap(find.text('Take your first photo'));
  } else {
    await tester.tap(captureFab);
  }
  await tester.pumpAndSettle();
}

Future<void> takeFakePhoto(WidgetTester tester) async {
  final choosePhoto = find.text('Choose Photo', skipOffstage: _offstage);
  if (choosePhoto.evaluate().isNotEmpty) {
    await tester.tap(choosePhoto);
  } else {
    await tester.tap(find.byType(FloatingActionButton).last);
  }
  await tester.pumpAndSettle(const Duration(seconds: 2));
  expect(find.text('New Observation'), findsOneWidget);
}

Future<void> openTypePickerFromReview(WidgetTester tester) async {
  await tester.tap(find.text('Select NiN Type...'));
  await tester.pumpAndSettle(const Duration(seconds: 2));
}

Future<void> searchAndSelectMappingUnit(WidgetTester tester) async {
  final searchEntry = find.byWidgetPredicate(
    (widget) => widget is TextField && widget.readOnly,
  );
  expect(searchEntry, findsWidgets);
  await tester.tap(searchEntry.last);
  await tester.pumpAndSettle();

  await tester.enterText(
    find.byWidgetPredicate((widget) => widget is TextField && !widget.readOnly),
    observationFlowMappingUnitId,
  );
  await tester.pump(const Duration(milliseconds: 400));
  await tester.pumpAndSettle(const Duration(seconds: 3));

  final result = find.descendant(
    of: find.byType(ListTile, skipOffstage: _offstage),
    matching: find.textContaining(
      observationFlowMappingUnitNavn,
      skipOffstage: _offstage,
    ),
  );
  expect(result, findsOneWidget);
  await tester.tap(result);
  await tester.pumpAndSettle(const Duration(seconds: 5));

  await tester.tap(find.text('Select this Mapping Unit'));
  await tester.pumpAndSettle(const Duration(seconds: 2));
  expect(find.text('New Observation'), findsOneWidget);
}

Future<void> waitForSaveEnabled(WidgetTester tester) async {
  for (var attempt = 0; attempt < 60; attempt++) {
    await tester.pump(const Duration(seconds: 1));
    final saveButton = find.widgetWithText(ElevatedButton, 'SAVE OBSERVATION');
    if (saveButton.evaluate().isEmpty) continue;

    final button = tester.widget<ElevatedButton>(saveButton);
    if (button.onPressed != null) return;
  }
  fail('Save button did not become enabled in time');
}

Future<void> saveObservation(WidgetTester tester) async {
  await tester.tap(find.text('SAVE OBSERVATION'));
  await tester.pumpAndSettle();

  final saveAnyway = find.text('Save Anyway');
  if (saveAnyway.evaluate().isNotEmpty) {
    await tester.tap(saveAnyway);
    await tester.pumpAndSettle(const Duration(seconds: 5));
  }
}

Future<void> verifyObservationInGallery(
  WidgetTester tester, {
  required String typeId,
}) async {
  await selectGalleryTab(tester);
  expect(find.text(typeId, skipOffstage: _offstage), findsWidgets);
}
