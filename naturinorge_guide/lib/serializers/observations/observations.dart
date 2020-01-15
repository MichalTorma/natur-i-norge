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

  @nullable
  @BuiltValueField(wireName: 'species')
  String get species;
  @nullable
  @BuiltValueField(wireName: 'Id')
  String get id;
  @nullable
  @BuiltValueField(wireName: 'Institution')
  String get institution;
  @nullable
  @BuiltValueField(wireName: 'InstitutionCode')
  String get institutionCode;
  @nullable
  @BuiltValueField(wireName: 'InstitutionUrl')
  String get institutionUrl;
  @nullable
  @BuiltValueField(wireName: 'InstitutionLogoUrl')
  String get institutionLogoUrl;
  @nullable
  @BuiltValueField(wireName: 'Collection')
  String get collection;
  @nullable
  @BuiltValueField(wireName: 'CollectionCode')
  String get collectionCode;
  @nullable
  @BuiltValueField(wireName: 'CatalogNumber')
  String get catalogNumber;
  @nullable
  @BuiltValueField(wireName: 'DetailUrl')
  String get detailUrl;
  @nullable
  @BuiltValueField(wireName: 'Collector')
  String get collector;
  @nullable
  @BuiltValueField(wireName: 'CollectedDate')
  String get collectedDate;
  @nullable
  @BuiltValueField(wireName: 'IdentifiedBy')
  String get identifiedBy;
  @nullable
  @BuiltValueField(wireName: 'DatetimeIdentified')
  String get datetimeIdentified;
  @nullable
  @BuiltValueField(wireName: 'BasisOfRecord')
  String get basisOfRecord;
  @nullable
  @BuiltValueField(wireName: 'TaxonId')
  int get taxonId;
  @nullable
  @BuiltValueField(wireName: 'Habitat')
  String get habitat;
  @nullable
  @BuiltValueField(wireName: 'DatasetId')
  String get datasetId;
  @nullable
  @BuiltValueField(wireName: 'DatasetName')
  String get datasetName;
  @nullable
  @BuiltValueField(wireName: 'ObsUrl')
  String get obsUrl;
  @nullable
  @BuiltValueField(wireName: 'Name')
  String get name;
  @nullable
  @BuiltValueField(wireName: 'ScientificName')
  String get scientificName;
  @nullable
  @BuiltValueField(wireName: 'Author')
  String get author;
  @nullable
  @BuiltValueField(wireName: 'kingdom')
  String get kingdom;
  @nullable
  @BuiltValueField(wireName: 'phylum')
  String get phylum;
  @nullable
  @BuiltValueField(wireName: 'klass')
  String get klass;
  @nullable
  @BuiltValueField(wireName: 'order')
  String get order;
  @nullable
  @BuiltValueField(wireName: 'family')
  String get family;
  @nullable
  @BuiltValueField(wireName: 'genus')
  String get genus;
  @nullable
  @BuiltValueField(wireName: 'subspecies')
  String get subspecies;
  @nullable
  @BuiltValueField(wireName: 'specificEpithet')
  String get specificEpithet;
  @nullable
  @BuiltValueField(wireName: 'infraspecificEpithet')
  String get infraspecificEpithet;
  @nullable
  @BuiltValueField(wireName: 'Status')
  String get status;
  @nullable
  @BuiltValueField(wireName: 'TypeObj')
  String get typeObj;
  @nullable
  @BuiltValueField(wireName: 'Sex')
  String get sex;
  @nullable
  @BuiltValueField(wireName: 'Count')
  String get count;
  @nullable
  @BuiltValueField(wireName: 'Notes')
  String get notes;
  @nullable
  @BuiltValueField(wireName: 'Country')
  String get country;
  @nullable
  @BuiltValueField(wireName: 'County')
  String get county;
  @nullable
  @BuiltValueField(wireName: 'CountyId')
  int get countyId;
  @nullable
  @BuiltValueField(wireName: 'Municipality')
  String get municipality;
  @nullable
  @BuiltValueField(wireName: 'MunicipalityId')
  int get municipalityId;
  @nullable
  @BuiltValueField(wireName: 'Locality')
  String get locality;
  @nullable
  @BuiltValueField(wireName: 'Longitude')
  String get longitude;
  @nullable
  @BuiltValueField(wireName: 'Latitude')
  String get latitude;
  @nullable
  @BuiltValueField(wireName: 'Precision')
  String get precision;
  @nullable
  @BuiltValueField(wireName: 'FootprintWKT')
  String get footprintWKT;
  @nullable
  @BuiltValueField(wireName: 'East')
  double get east;
  @nullable
  @BuiltValueField(wireName: 'North')
  double get north;
  @nullable
  @BuiltValueField(wireName: 'Projection')
  int get projection;
  @nullable
  @BuiltValueField(wireName: 'Info')
  String get info;
  @nullable
  @BuiltValueField(wireName: 'PropertyUrls')
  BuiltList<PropertyUrl> get propertyUrls;
  @nullable
  @BuiltValueField(wireName: 'ThumbImgUrls')
  BuiltList<String> get thumbImgUrls;
  @nullable
  @BuiltValueField(wireName: 'Behavior')
  String get behavior;
  @nullable
  @BuiltValueField(wireName: 'OtherCatalogNumbers')
  String get otherCatalogNumbers;
  @nullable
  @BuiltValueField(wireName: 'TrackDateTime')
  String get trackDateTime;
  @nullable
  @BuiltValueField(wireName: 'ScientificNameId')
  int get scientificNameId;
  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Observations.serializer, this));
  }

  static Observations fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Observations.serializer, json.decode(jsonString));
  }

  static Serializer<Observations> get serializer => _$observationsSerializer;
}
