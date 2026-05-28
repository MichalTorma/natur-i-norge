import 'package:flutter_test/flutter_test.dart';
import 'package:naturinorge_guide/src/matrix/ecological_matrix_analyzer.dart';
import 'package:naturinorge_guide/src/models/nin_database.dart';

NinType _type({
  required String id,
  String? lkmData,
  String kategori = 'Grunntype',
}) {
  return NinType(
    id: id,
    navn: 'Type $id',
    kategori: kategori,
    parentId: 'HT-01',
    ecosystnivaaNavn: null,
    typekategoriNavn: null,
    langkode: null,
    definisjon: null,
    imageUrl: null,
    description: null,
    lkmData: lkmData,
    scale: null,
    containsTypes: null,
  );
}

void main() {
  test('detects cell collision when two types share a cell', () {
    final types = [
      _type(
        id: 'GT-A',
        lkmData:
            '[{"v_kode":"LM-KA","v_navn":"Kalk","v_trinn":"1","v_trinn_navn":"Low"},{"v_kode":"LM-UF","v_navn":"Fukt","v_trinn":"2","v_trinn_navn":"Wet"}]',
      ),
      _type(
        id: 'GT-B',
        lkmData:
            '[{"v_kode":"LM-KA","v_navn":"Kalk","v_trinn":"1","v_trinn_navn":"Low"},{"v_kode":"LM-UF","v_navn":"Fukt","v_trinn":"2","v_trinn_navn":"Wet"}]',
      ),
    ];

    final report = EcologicalMatrixAnalyzer.analyze(subTypes: types);
    expect(
      report.issues.any((i) => i.kind == MatrixHealthKind.cellCollision),
      isTrue,
    );
  });

  test('detects missing lkm', () {
    final report = EcologicalMatrixAnalyzer.analyze(
      subTypes: [_type(id: 'GT-A'), _type(id: 'GT-B', lkmData: '[]')],
    );

    expect(
      report.issues.any((i) => i.kind == MatrixHealthKind.missingLkm),
      isTrue,
    );
  });

  test('report text includes parent and issue summary', () {
    final types = [
      _type(
        id: 'GT-A',
        lkmData:
            '[{"v_kode":"LM-KA","v_navn":"Kalk","v_trinn":"1","v_trinn_navn":"Low"},{"v_kode":"LM-UF","v_navn":"Fukt","v_trinn":"2","v_trinn_navn":"Wet"}]',
      ),
      _type(
        id: 'GT-B',
        lkmData:
            '[{"v_kode":"LM-KA","v_navn":"Kalk","v_trinn":"1","v_trinn_navn":"Low"},{"v_kode":"LM-UF","v_navn":"Fukt","v_trinn":"2","v_trinn_navn":"Wet"}]',
      ),
    ];

    final report = EcologicalMatrixAnalyzer.analyze(
      subTypes: types,
      parentTypeId: 'HT-01',
      parentTypeName: 'Test hovedtype',
    );
    final text = EcologicalMatrixAnalyzer.formatReport(report, types);

    expect(text, contains('HT-01'));
    expect(text, contains('Cell collision'));
    expect(text, contains('GT-A'));
    expect(text, contains('kodeforGrunntype'));
  });
}
