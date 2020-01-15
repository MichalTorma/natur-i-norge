import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:naturinorge_guide/serializers/observations/arts_observation.dart';
import 'package:naturinorge_guide/serializers/taxons/arts_taxon.dart';

abstract class ArtsApi {
  static Future<List<ArtsTaxon>> getTaxon(String name) async {
    var dio = Dio();
    var resp = await dio.get(
        'https://www.artsdatabanken.no/Api/Taxon/ScientificName',
        queryParameters: {"ScientificName": name});

    List<ArtsTaxon> res = [];
    resp.data.forEach((record) {
      String jsonText = json.encode(record);
      // print(jsonText);
      res.add(ArtsTaxon.fromJson(jsonText));
    });
    return res;
  }

  static Future<ArtsObservation> getObservationPage({
    ArtsTaxon taxon,
    int pageIndex = 0,
    int pageSize = 200,
  }) async {
    var dio = Dio();
    var resp = await dio.get(
        'https://webtjenester.artsdatabanken.no/Artskart/api/observations/list',
        queryParameters: {
          "Taxons": taxon.taxonID,
          "pageIndex": pageIndex,
          "pageSize": pageSize
        });

    return ArtsObservation.fromJson(json.encode(resp.data));
  }
}
