import 'dart:convert';

import 'package:dio/dio.dart';
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
      print(jsonText);
      res.add(ArtsTaxon.fromJson(jsonText));
    });
    return res;
  }
}
