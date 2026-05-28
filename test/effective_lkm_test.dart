import 'package:flutter_test/flutter_test.dart';
import 'package:naturinorge_guide/src/matrix/ecological_matrix_analyzer.dart';
import 'package:naturinorge_guide/src/matrix/effective_lkm.dart';
import 'package:naturinorge_guide/src/models/nin_database.dart';

NinType _gt(String id, String lkm) => NinType(
      id: id,
      navn: id,
      kategori: 'Grunntype',
      parentId: 'NA-TB01',
      ecosystnivaaNavn: null,
      typekategoriNavn: null,
      langkode: null,
      definisjon: null,
      imageUrl: null,
      description: null,
      lkmData: lkm,
      scale: null,
      containsTypes: null,
    );

NinType _ke(String id, List<String> contains) => NinType(
      id: id,
      navn: id,
      kategori: 'Kartleggingsenhet',
      parentId: 'NA-TB01',
      ecosystnivaaNavn: null,
      typekategoriNavn: null,
      langkode: null,
      definisjon: null,
      imageUrl: null,
      description: null,
      lkmData: null,
      scale: 'M020',
      containsTypes: '["${contains.join('","')}"]',
    );

void main() {
  test('kartleggingsenhet uses filtered constituent grunntyper only', () {
    final gtMap = {
      'TB01-01': _gt(
        'TB01-01',
        '[{"v_kode":"LM-KA","v_trinn":"b"},{"v_kode":"LM-KA","v_trinn":"c"},{"v_kode":"LM-UF","v_trinn":"a"},{"v_kode":"LM-UF","v_trinn":"b"},{"v_kode":"LM-VM","v_trinn":"0"}]',
      ),
      'TB01-16': _gt(
        'TB01-16',
        '[{"v_kode":"LM-KA","v_trinn":"b"},{"v_kode":"LM-KA","v_trinn":"c"},{"v_kode":"LM-UF","v_trinn":"e"},{"v_kode":"LM-UF","v_trinn":"f"},{"v_kode":"LM-VM","v_trinn":"b"}]',
      ),
      'TB01-07': _gt(
        'TB01-07',
        '[{"v_kode":"LM-KA","v_trinn":"b"},{"v_kode":"LM-KA","v_trinn":"c"},{"v_kode":"LM-UF","v_trinn":"e"},{"v_kode":"LM-UF","v_trinn":"f"},{"v_kode":"LM-VM","v_trinn":"0"}]',
      ),
      'TB01-10': _gt(
        'TB01-10',
        '[{"v_kode":"LM-KA","v_trinn":"b"},{"v_kode":"LM-KA","v_trinn":"c"},{"v_kode":"LM-UF","v_trinn":"g"},{"v_kode":"LM-UF","v_trinn":"h"},{"v_kode":"LM-VM","v_trinn":"0"}]',
      ),
    };

    final ke01 = _ke('TB01-M020-01', ['TB01-01', 'TB01-16']);
    final ke04 = _ke('TB01-M020-04', ['TB01-10', 'TB01-07']);

    final vars01 = EffectiveLkm.variablesForType(
      ke01,
      grunntypeById: gtMap,
      activeFilters: const {'LM-VM': '0'},
    );
    final vars04 = EffectiveLkm.variablesForType(
      ke04,
      grunntypeById: gtMap,
      activeFilters: const {'LM-VM': '0'},
    );

    expect(vars01['LM-UF'], isNot(contains('e')));
    expect(vars01['LM-UF'], isNot(contains('f')));
    expect(vars04['LM-UF'], contains('e'));

    final report = EcologicalMatrixAnalyzer.analyze(
      subTypes: [ke01, ke04],
      grunntypeById: gtMap,
      scale: 'M020',
    );

    expect(
      report.issues.where((i) => i.kind == MatrixHealthKind.cellCollision),
      isEmpty,
    );
  });
}
