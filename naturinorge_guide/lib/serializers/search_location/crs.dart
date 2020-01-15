
library crs;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:naturinorge_guide/serializers/observations/serializers.dart';
import 'package:naturinorge_guide/serializers/search_location/crs_property.dart';

part 'crs.g.dart';

abstract class Crs implements Built<Crs, CrsBuilder> {
  Crs._();

  factory Crs([updates(CrsBuilder b)]) = _$Crs;

  @BuiltValueField(wireName: 'properties')
  CrsProperty get properties;
  @BuiltValueField(wireName: 'type')
  String get type;
  String toJson() {
    return json.encode(standardSerializers.serializeWith(Crs.serializer, this));
  }

  static Crs fromJson(String jsonString) {
    return standardSerializers.deserializeWith(Crs.serializer, json.decode(jsonString));
  }

  static Serializer<Crs> get serializer => _$crsSerializer;
}
