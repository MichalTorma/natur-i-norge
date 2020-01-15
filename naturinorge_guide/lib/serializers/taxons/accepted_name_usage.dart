library accepted_name_usage;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:naturinorge_guide/serializers/observations/serializers.dart';

part 'accepted_name_usage.g.dart';

abstract class AcceptedNameUsage
    implements Built<AcceptedNameUsage, AcceptedNameUsageBuilder> {
  AcceptedNameUsage._();

  factory AcceptedNameUsage([updates(AcceptedNameUsageBuilder b)]) =
      _$AcceptedNameUsage;

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
  String get acceptedNameUsage;
  @BuiltValueField(wireName: 'higherClassification')
  String get higherClassification;
  @BuiltValueField(wireName: 'nameAccordingTo')
  String get nameAccordingTo;
  @BuiltValueField(wireName: 'dynamicProperties')
  String get dynamicProperties;
  String toJson() {
    return json
        .encode(serializers.serializeWith(AcceptedNameUsage.serializer, this));
  }

  static AcceptedNameUsage fromJson(String jsonString) {
    return serializers.deserializeWith(
        AcceptedNameUsage.serializer, json.decode(jsonString));
  }

  static Serializer<AcceptedNameUsage> get serializer =>
      _$acceptedNameUsageSerializer;
}