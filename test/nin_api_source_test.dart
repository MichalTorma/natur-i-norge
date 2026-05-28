import 'package:flutter_test/flutter_test.dart';
import 'package:naturinorge_guide/src/models/nin_database.dart';
import 'package:naturinorge_guide/src/services/nin_api_source.dart';

NinType _type({required String id, required String kategori}) {
  return NinType(
    id: id,
    navn: 'Test',
    kategori: kategori,
    parentId: null,
    ecosystnivaaNavn: null,
    typekategoriNavn: null,
    langkode: 'test',
    definisjon: null,
    imageUrl: null,
    description: null,
    lkmData: null,
    scale: null,
    containsTypes: null,
  );
}

void main() {
  test('grunntype has type-specific url', () {
    expect(
      NinApiSourceService.typeApiUrl(_type(id: 'NA-T01', kategori: 'Grunntype')),
      '${NinApiSourceService.baseUrl}/typer/kodeforGrunntype/NA-T01',
    );
  });

  test('kartleggingsenhet has type-specific url', () {
    expect(
      NinApiSourceService.typeApiUrl(_type(id: 'KE-01', kategori: 'Kartleggingsenhet')),
      '${NinApiSourceService.baseUrl}/typer/kodeforKartleggingsenhet/KE-01',
    );
  });

  test('natursystem has no type-specific url', () {
    expect(
      NinApiSourceService.typeApiUrl(_type(id: 'NA-T', kategori: 'Natursystem')),
      isNull,
    );
  });
}
