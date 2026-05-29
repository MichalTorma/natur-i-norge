import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:naturinorge_guide/main.dart' as app;
import 'package:naturinorge_guide/src/models/nin_database.dart';
import 'package:naturinorge_guide/src/widgets/ecological_matrix.dart';

const _offstage = false;

void _dumpScreen(WidgetTester tester, String label) {
  print('\n=== $label ===');
  print('CustomScrollViews: ${find.byType(CustomScrollView, skipOffstage: _offstage).evaluate().length}');
  print('GridViews: ${find.byType(GridView, skipOffstage: _offstage).evaluate().length}');
  print('InkWells: ${find.byType(InkWell, skipOffstage: _offstage).evaluate().length}');

  final labels = <String>{};
  for (final element in find.byType(Text, skipOffstage: _offstage).evaluate()) {
    final data = (element.widget as Text).data;
    if (data != null && data.trim().isNotEmpty) {
      labels.add(data.trim());
    }
  }
  final sorted = labels.toList()..sort();
  print('Text labels (${sorted.length}):');
  for (final text in sorted) {
    print('  - $text');
  }
}

Future<void> openSearchAndQuery(WidgetTester tester, String query) async {
  await tester.tap(find.byWidgetPredicate(
    (widget) => widget is TextField && widget.readOnly,
  ));
  await tester.pumpAndSettle();

  await tester.enterText(
    find.byWidgetPredicate((widget) => widget is TextField && !widget.readOnly),
    query,
  );
  await tester.pump(const Duration(milliseconds: 300));
  await tester.pumpAndSettle(const Duration(seconds: 2));
}

Future<void> tapSearchResult(WidgetTester tester, String navn) async {
  final result = find.descendant(
    of: find.byType(ListTile, skipOffstage: _offstage),
    matching: find.text(navn, skipOffstage: _offstage),
  );
  print('Search result matches for "$navn": ${result.evaluate().length}');
  expect(result, findsOneWidget);
  await tester.tap(result);
  await tester.pumpAndSettle(const Duration(seconds: 10));
}

void _dumpScrollMetrics(WidgetTester tester, String label) {
  final scrollView = naTb01DetailScrollView();
  double maxExtent = 0;
  double pixels = 0;
  for (final element in find.descendant(
    of: scrollView,
    matching: find.byType(Scrollable, skipOffstage: _offstage),
  ).evaluate()) {
    final state = (element as StatefulElement).state as ScrollableState;
    if (state.position.maxScrollExtent > maxExtent) {
      maxExtent = state.position.maxScrollExtent;
      pixels = state.position.pixels;
    }
  }
  print('Scroll metrics ($label): pixels=$pixels max=$maxExtent');
}

Future<void> dumpNaTb01Children() async {
  final db = NinDatabase();
  final children = await (db.select(db.ninTypes)
        ..where((t) => t.parentId.equals('NA-TB01')))
      .get();
  final grunntyper =
      children.where((t) => t.kategori == 'Grunntype').length;
  print(
    'DB NA-TB01 children: ${children.length} (${grunntyper} grunntyper)',
  );
  await db.close();
}

void _dumpMatrixState(WidgetTester tester, String label) {
  print('\n--- Matrix state: $label ---');
  print('VISNINGSMODUS: ${find.text('VISNINGSMODUS', skipOffstage: _offstage).evaluate().length}');
  print('GRUNNTYPER: ${find.text('GRUNNTYPER', skipOffstage: _offstage).evaluate().length}');
  print('ECOLOGICAL MATRIX: ${find.textContaining('ECOLOGICAL MATRIX', skipOffstage: _offstage).evaluate().length}');
  print('EcologicalMatrix: ${find.byType(EcologicalMatrix, skipOffstage: _offstage).evaluate().length}');
  print('CustomScrollViews: ${find.byType(CustomScrollView, skipOffstage: _offstage).evaluate().length}');
  print('Beskrivelse: ${find.text('Beskrivelse', skipOffstage: _offstage).evaluate().length}');
}

Finder naTb01DetailScrollView() {
  final title = find.descendant(
    of: find.byType(SliverAppBar, skipOffstage: _offstage),
    matching: find.text('Fastmarksskogsmark', skipOffstage: _offstage),
  );
  return find.ancestor(
    of: title.last,
    matching: find.byType(CustomScrollView, skipOffstage: _offstage),
  );
}

Future<void> scrollDetailPage(WidgetTester tester, {required int times}) async {
  final scrollView = naTb01DetailScrollView();
  for (var i = 0; i < times; i++) {
    await tester.dragFrom(tester.getCenter(scrollView), const Offset(0, -900));
    await tester.pump(const Duration(milliseconds: 250));
    if (i % 5 == 4) {
      _dumpMatrixState(tester, 'after ${i + 1} scrolls');
    }
  }
  await tester.pumpAndSettle(const Duration(seconds: 2));
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('navigation probe', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    for (var attempt = 0; attempt < 120; attempt++) {
      await tester.pump(const Duration(milliseconds: 500));
      final searchEntry = find.byWidgetPredicate(
        (widget) => widget is TextField && widget.readOnly,
      );
      if (searchEntry.evaluate().isNotEmpty) break;
    }

    _dumpScreen(tester, 'Home / Types root');

    await openSearchAndQuery(tester, 'NA-TB01');
    _dumpScreen(tester, 'Search results for NA-TB01');

    await tapSearchResult(tester, 'Fastmarksskogsmark');
    await dumpNaTb01Children();
    _dumpScrollMetrics(tester, 'before scroll');

    for (var i = 1; i <= 25; i++) {
      await tester.dragFrom(
        tester.getCenter(naTb01DetailScrollView()),
        const Offset(0, -900),
      );
      await tester.pump(const Duration(milliseconds: 250));
      final matrixCount =
          find.byType(EcologicalMatrix, skipOffstage: _offstage).evaluate().length;
      if (matrixCount > 0 || i % 5 == 0) {
        print('\n--- step $i ---');
        _dumpMatrixState(tester, 'step $i');
        _dumpScrollMetrics(tester, 'step $i');
      }
      if (matrixCount > 0) break;
    }
  });
}
