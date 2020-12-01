library crs_property;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:naturinorge_guide/serializers/observations/serializers.dart';

part 'crs_property.g.dart';

abstract class CrsProperty implements Built<CrsProperty, CrsPropertyBuilder> {
  CrsProperty._();

  factory CrsProperty([updates(CrsPropertyBuilder b)]) = _$CrsProperty;

  @BuiltValueField(wireName: 'name')
  String get name;
  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(CrsProperty.serializer, this));
  }

  static CrsProperty fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        CrsProperty.serializer, json.decode(jsonString));
  }

  static Serializer<CrsProperty> get serializer => _$crsPropertySerializer;
}
