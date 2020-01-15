library arts_taxon;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:naturinorge_guide/serializers/observations/serializers.dart';

import 'accepted_name_usage.dart';
import 'dynamic_properties.dart';

part 'arts_taxon.g.dart';

abstract class ArtsTaxon implements Built<ArtsTaxon, ArtsTaxonBuilder> {
  ArtsTaxon._();

  factory ArtsTaxon([updates(ArtsTaxonBuilder b)]) = _$ArtsTaxon;

  @BuiltValueField(wireName: 'Id')
  String get id;
  @BuiltValueField(wireName: 'scientificNameID')
  int get scientificNameID;
  @BuiltValueField(wireName: 'taxonID')
  int get taxonID;
  @BuiltValueField(wireName: 'scientificName')
  String get scientificName;
  @BuiltValueField(wireName: 'scientificNameAuthorship')
  String get scientificNameAuthorship;
  @BuiltValueField(wireName: 'taxonRank')
  String get taxonRank;
  @BuiltValueField(wireName: 'taxonomicStatus')
  String get taxonomicStatus;
  @BuiltValueField(wireName: 'acceptedNameUsage')
  @nullable
  AcceptedNameUsage get acceptedNameUsage;
  @BuiltValueField(wireName: 'higherClassification')
  BuiltList<AcceptedNameUsage> get higherClassification;
  @BuiltValueField(wireName: 'nameAccordingTo')
  String get nameAccordingTo;
  @BuiltValueField(wireName: 'dynamicProperties')
  BuiltList<DynamicProperties> get dynamicProperties;
  String toJson() {
    return json.encode(serializers.serializeWith(ArtsTaxon.serializer, this));
  }

  static ArtsTaxon fromJson(String jsonString) {
    return serializers.deserializeWith(
        ArtsTaxon.serializer, json.decode(jsonString));
  }

  static Serializer<ArtsTaxon> get serializer => _$artsTaxonSerializer;
}


