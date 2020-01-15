library observations;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:naturinorge_guide/serializers/observations/property_url.dart';
import 'package:naturinorge_guide/serializers/observations/serializers.dart';

part 'observations.g.dart';

abstract class Observations
    implements Built<Observations, ObservationsBuilder> {
  Observations._();

  factory Observations([updates(ObservationsBuilder b)]) = _$Observations;

  @BuiltValueField(wireName: 'species')
  String get species;
  @BuiltValueField(wireName: 'Id')
  String get id;
  @BuiltValueField(wireName: 'Institution')
  String get institution;
  @BuiltValueField(wireName: 'InstitutionCode')
  String get institutionCode;
  @BuiltValueField(wireName: 'InstitutionUrl')
  String get institutionUrl;
  @BuiltValueField(wireName: 'InstitutionLogoUrl')
  String get institutionLogoUrl;
  @BuiltValueField(wireName: 'Collection')
  String get collection;
  @BuiltValueField(wireName: 'CollectionCode')
  String get collectionCode;
  @BuiltValueField(wireName: 'CatalogNumber')
  String get catalogNumber;
  @BuiltValueField(wireName: 'DetailUrl')
  String get detailUrl;
  @BuiltValueField(wireName: 'Collector')
  String get collector;
  @BuiltValueField(wireName: 'CollectedDate')
  String get collectedDate;
  @BuiltValueField(wireName: 'IdentifiedBy')
  String get identifiedBy;
  @BuiltValueField(wireName: 'DatetimeIdentified')
  String get datetimeIdentified;
  @BuiltValueField(wireName: 'BasisOfRecord')
  String get basisOfRecord;
  @BuiltValueField(wireName: 'TaxonId')
  int get taxonId;
  @BuiltValueField(wireName: 'Habitat')
  String get habitat;
  @BuiltValueField(wireName: 'DatasetId')
  String get datasetId;
  @BuiltValueField(wireName: 'DatasetName')
  String get datasetName;
  @BuiltValueField(wireName: 'ObsUrl')
  String get obsUrl;
  @BuiltValueField(wireName: 'Name')
  String get name;
  @BuiltValueField(wireName: 'ScientificName')
  String get scientificName;
  @BuiltValueField(wireName: 'Author')
  String get author;
  @BuiltValueField(wireName: 'kingdom')
  String get kingdom;
  @BuiltValueField(wireName: 'phylum')
  String get phylum;
  @BuiltValueField(wireName: 'klass')
  String get klass;
  @BuiltValueField(wireName: 'order')
  String get order;
  @BuiltValueField(wireName: 'family')
  String get family;
  @BuiltValueField(wireName: 'genus')
  String get genus;
  @BuiltValueField(wireName: 'subspecies')
  String get subspecies;
  @BuiltValueField(wireName: 'specificEpithet')
  String get specificEpithet;
  @BuiltValueField(wireName: 'infraspecificEpithet')
  String get infraspecificEpithet;
  @BuiltValueField(wireName: 'Status')
  String get status;
  @BuiltValueField(wireName: 'TypeObj')
  String get typeObj;
  @BuiltValueField(wireName: 'Sex')
  String get sex;
  @BuiltValueField(wireName: 'Count')
  String get count;
  @BuiltValueField(wireName: 'Notes')
  String get notes;
  @BuiltValueField(wireName: 'Country')
  String get country;
  @BuiltValueField(wireName: 'County')
  String get county;
  @BuiltValueField(wireName: 'CountyId')
  int get countyId;
  @BuiltValueField(wireName: 'Municipality')
  String get municipality;
  @BuiltValueField(wireName: 'MunicipalityId')
  int get municipalityId;
  @BuiltValueField(wireName: 'Locality')
  String get locality;
  @BuiltValueField(wireName: 'Longitude')
  String get longitude;
  @BuiltValueField(wireName: 'Latitude')
  String get latitude;
  @BuiltValueField(wireName: 'Precision')
  String get precision;
  @BuiltValueField(wireName: 'FootprintWKT')
  String get footprintWKT;
  @BuiltValueField(wireName: 'East')
  double get east;
  @BuiltValueField(wireName: 'North')
  double get north;
  @BuiltValueField(wireName: 'Projection')
  int get projection;
  @BuiltValueField(wireName: 'Info')
  String get info;
  @BuiltValueField(wireName: 'PropertyUrls')
  BuiltList<PropertyUrl> get propertyUrls;
  @BuiltValueField(wireName: 'ThumbImgUrls')
  BuiltList<String> get thumbImgUrls;
  @BuiltValueField(wireName: 'Behavior')
  String get behavior;
  @BuiltValueField(wireName: 'OtherCatalogNumbers')
  String get otherCatalogNumbers;
  @BuiltValueField(wireName: 'TrackDateTime')
  String get trackDateTime;
  @BuiltValueField(wireName: 'ScientificNameId')
  int get scientificNameId;
  String toJson() {
    return json
        .encode(serializers.serializeWith(Observations.serializer, this));
  }

  static Observations fromJson(String jsonString) {
    return serializers.deserializeWith(
        Observations.serializer, json.decode(jsonString));
  }

  static Serializer<Observations> get serializer => _$observationsSerializer;
}
