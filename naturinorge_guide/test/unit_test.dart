import 'package:flutter_test/flutter_test.dart';
import 'package:naturinorge_guide/api/arts_api.dart';
import 'package:naturinorge_guide/serializers/search_location/search_location.dart';
import 'package:naturinorge_guide/serializers/taxons/arts_taxon.dart';
import 'package:naturinorge_guide/tools/crs_converter.dart';

main() {
  test("Arts get Taxon", () async {
    var res = await ArtsApi.getTaxon("Picea abies");
    print(res);
  });

  test("offline serialization test", () {
    var tstJson = """{
    "_": null,
    "Id": "ScientificNames/103807",
    "scientificNameID": 103807,
    "taxonID": 144820,
    "scientificName": "Picea abies",
    "scientificNameAuthorship": "(L.) H.Karst.",
    "taxonRank": "species",
    "taxonomicStatus": "accepted",
    "acceptedNameUsage": null,
    "higherClassification": [
        {
            "Id": "ScientificNames/1131",
            "scientificNameID": 1131,
            "taxonID": 1131,
            "scientificName": "Plantae",
            "scientificNameAuthorship": "Haeckel",
            "taxonRank": "kingdom",
            "taxonomicStatus": "accepted",
            "acceptedNameUsage": null,
            "higherClassification": null,
            "nameAccordingTo": null,
            "dynamicProperties": null
        },
        {
            "Id": "ScientificNames/1372",
            "scientificNameID": 1372,
            "taxonID": 1372,
            "scientificName": "Pinophyta",
            "scientificNameAuthorship": "",
            "taxonRank": "phylum",
            "taxonomicStatus": "accepted",
            "acceptedNameUsage": null,
            "higherClassification": null,
            "nameAccordingTo": null,
            "dynamicProperties": null
        },
        {
            "Id": "ScientificNames/1373",
            "scientificNameID": 1373,
            "taxonID": 1373,
            "scientificName": "Pinopsida",
            "scientificNameAuthorship": "",
            "taxonRank": "class",
            "taxonomicStatus": "accepted",
            "acceptedNameUsage": null,
            "higherClassification": null,
            "nameAccordingTo": null,
            "dynamicProperties": null
        },
        {
            "Id": "ScientificNames/1374",
            "scientificNameID": 1374,
            "taxonID": 1374,
            "scientificName": "Pinales",
            "scientificNameAuthorship": "",
            "taxonRank": "order",
            "taxonomicStatus": "accepted",
            "acceptedNameUsage": null,
            "higherClassification": null,
            "nameAccordingTo": null,
            "dynamicProperties": null
        },
        {
            "Id": "ScientificNames/103791",
            "scientificNameID": 103791,
            "taxonID": 63751,
            "scientificName": "Pinaceae",
            "scientificNameAuthorship": "",
            "taxonRank": "family",
            "taxonomicStatus": "accepted",
            "acceptedNameUsage": null,
            "higherClassification": null,
            "nameAccordingTo": null,
            "dynamicProperties": null
        },
        {
            "Id": "ScientificNames/103806",
            "scientificNameID": 103806,
            "taxonID": 63766,
            "scientificName": "Picea",
            "scientificNameAuthorship": "A.Dietr.",
            "taxonRank": "genus",
            "taxonomicStatus": "accepted",
            "acceptedNameUsage": null,
            "higherClassification": null,
            "nameAccordingTo": null,
            "dynamicProperties": null
        }
    ],
    "nameAccordingTo": null,
    "dynamicProperties": [
        {
            "Name": "GruppeNavn",
            "Value": "Karplanter (Norge)",
            "Properties": [
                {
                    "Name": "GruppeInndelingsNavn",
                    "Value": "Rødlistebase 2010",
                    "Properties": null
                },
                {
                    "Name": "scientificNameID",
                    "Value": "103807",
                    "Properties": null
                }
            ]
        },
        {
            "Name": "GruppeNavn",
            "Value": "Karplanter",
            "Properties": [
                {
                    "Name": "GruppeInndelingsNavn",
                    "Value": "Artsobservasjoner",
                    "Properties": null
                },
                {
                    "Name": "scientificNameID",
                    "Value": "103807",
                    "Properties": null
                }
            ]
        },
        {
            "Name": "Kategori",
            "Value": "LC",
            "Properties": [
                {
                    "Name": "Kontekst",
                    "Value": "Rødliste 2010",
                    "Properties": null
                },
                {
                    "Name": "scientificNameID",
                    "Value": "103807",
                    "Properties": null
                },
                {
                    "Name": "RodlistevurderingID",
                    "Value": "47547",
                    "Properties": null
                },
                {
                    "Name": "EkspertGruppe",
                    "Value": "Karplanter (Norge)",
                    "Properties": null
                },
                {
                    "Name": "Område",
                    "Value": "Norge",
                    "Properties": null
                },
                {
                    "Name": "Aar",
                    "Value": "2010",
                    "Properties": null
                },
                {
                    "Name": "Url",
                    "Value": "http://www.artsportalen.artsdatabanken.no/#/Rodliste2010/Vurdering/dummy/47547",
                    "Properties": null
                }
            ]
        },
        {
            "Name": "Kategori",
            "Value": "LC",
            "Properties": [
                {
                    "Name": "Kontekst",
                    "Value": "Rødliste 2015",
                    "Properties": null
                },
                {
                    "Name": "scientificNameID",
                    "Value": "103807",
                    "Properties": null
                },
                {
                    "Name": "EkspertGruppe",
                    "Value": "Karplanter (Norge)",
                    "Properties": null
                },
                {
                    "Name": "Område",
                    "Value": "Norge",
                    "Properties": null
                },
                {
                    "Name": "Aar",
                    "Value": "2015",
                    "Properties": null
                },
                {
                    "Name": "Url",
                    "Value": "https://artsdatabanken.no/Rodliste2015/rodliste2015/Norge/103807",
                    "Properties": null
                }
            ]
        }
    ]
}""";
    ArtsTaxon.fromJson(tstJson);
  });

  test("get observations page for taxa", () async {
    var taxa = await ArtsApi.getTaxon("picea abies");
    var observations = await ArtsApi.getObservationPage(
      taxon: taxa[0],
    );
  });

  test("get all locations from buffer", () async {
    var taxa = await ArtsApi.getTaxon("Cryothecomonas scybalophora");
    var searchLocation = await ArtsApi.getAllObservations(taxa[0]);
  });

  test("offline locationSearch deserialization", () {
    String tst =
        """{"features":[{"geometry":{"coordinates":[251147.0,7040525.0],"type":"Point"},"id":"804593","properties":{"ObservationCount":1,"MaxCategory":0},"type":"Feature"},{"geometry":{"coordinates":[260056.0,6635355.0],"type":"Point"},"id":"804596","properties":{"ObservationCount":1,"MaxCategory":0},"type":"Feature"}],"crs":{"properties":{"name":"EPSG:32633"},"type":"Name"},"type":"FeatureCollection"}""";
    SearchLocation.fromJson(tst);
  });

  test("CRS conversion test", () {
    // This will log "[41.33544, 19.789071]" to the console.
    var res =
        CrsConverter.utmToLatLon(398676.179117283, 4576702.45725602, 34, true);
    print(res);
  });
}
