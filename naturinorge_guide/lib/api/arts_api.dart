import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:naturinorge_guide/serializers/observations/arts_observation.dart';
import 'package:naturinorge_guide/serializers/search_location/search_location.dart';
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

  static Future<SearchLocation> getAllObservations(ArtsTaxon taxon) async {
    var dio = Dio();
    print('TaxonID = ${taxon.taxonID}');
    var resp = await dio.get(
      "https://artskart.artsdatabanken.no/appapi/api/data/SearchLocations?&TaxonIds%5B%5D=${taxon.taxonID}&TaxonGroupIds%5B%5D=&IncludeSubTaxonIds=true&Months%5B%5D=&Categories%5B%5D=&BasisOfRecords%5B%5D=&Behaviors%5B%5D=&InstitutionIds%5B%5D=&CollectionIds%5B%5D=&Img%5B%5D=&Found%5B%5D=2&NotRecovered%5B%5D=&Valid%5B%5D=&UnsureId%5B%5D=&Spontan%5B%5D=&CenterPoints=false&Geometry=&EpsgCode=32633&LocationId=0&GroupBy=0&Style=1&YearFrom=0&YearTo=0&CoordinatePrecisionFrom=0&CoordinatePrecisionTo=0&BoundingBox=",
      //https://artskart.artsdatabanken.no/appapi/api/data/SearchLocations?&TaxonIds%5B%5D=139979&TaxonGroupIds%5B%5D=&IncludeSubTaxonIds=true&Months%5B%5D=&Categories%5B%5D=&BasisOfRecords%5B%5D=&Behaviors%5B%5D=&InstitutionIds%5B%5D=&CollectionIds%5B%5D=&Img%5B%5D=&Found%5B%5D=2&NotRecovered%5B%5D=&Valid%5B%5D=&UnsureId%5B%5D=&Spontan%5B%5D=&CenterPoints=false&Geometry=&EpsgCode=32633&LocationId=0&GroupBy=0&Style=1&YearFrom=0&YearTo=0&CoordinatePrecisionFrom=0&CoordinatePrecisionTo=0&BoundingBox=
      // queryParameters: {
      //   "TaxonIds%5B%5D": taxon.taxonID,
      //   // "TaxonGroupIds%5B%5D": null,
      //   "IncludeSubTaxonIds": true,
      //   // "Months%5B%5D": null,
      //   // "Categories%5B%5D": null,
      //   // "BasisOfRecords%5B%5D": null,
      //   // "Behaviors%5B%5D": null,
      //   // "InstitutionIds%5B%5D": null,
      //   // "CollectionIds%5B%5D": null,
      //   // "Img%5B%5D": null,
      //   "Found%5B%5D": 2,
      //   // "NotRecovered%5B%5D": null,
      //   // "Valid%5B%5D": null,
      //   // "UnsureId%5B%5D": null,
      //   // "Spontan%5B%5D": null,
      //   "CenterPoints": false,
      //   // "Geometry": null,
      //   "EpsgCode": 32633,
      //   "LocationId": 0,
      //   "GroupBy": 0,
      //   "Style": 1,
      //   "YearFrom" : 0,
      //   "YearTo" : 0,
      //   "CoordinatePrecisionFrom": 0,
      //   "CoordinatePrecisionTo": 0,
      //   // "BoundingBox": null,
      // },
      // options: Options(
      //   headers: {
      //     // "User-Agent": "PostmanRuntime/7.20.1",
      //     "Accept": "*/*",
      //     "Accept-Encoding": "gzip, deflate, br",
      //     "Request-Context": "appId=cid-v1:3f87ce1a-8201-4159-bcea-4a7cdf0c2d83",
      //     "Cache-Control": "no-cache",
      //     "Host": "artskart.artsdatabanken.no",
      //     "Connection": "keep-alive"
      //   },
      //   contentType: "application/json;charset=utf-8"
      // ),
    );
    String stringResp = resp.data.replaceAll('\\', '');
    // print(stringResp);
    return SearchLocation.fromJson(resp.data);
  }
}
