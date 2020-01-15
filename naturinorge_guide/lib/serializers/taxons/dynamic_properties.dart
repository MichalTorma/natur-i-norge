library dynamic_properties;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:naturinorge_guide/serializers/observations/serializers.dart';

part 'dynamic_properties.g.dart';

abstract class DynamicProperties
    implements Built<DynamicProperties, DynamicPropertiesBuilder> {
  DynamicProperties._();

  factory DynamicProperties([updates(DynamicPropertiesBuilder b)]) =
      _$DynamicProperties;

  @BuiltValueField(wireName: 'Name')
  String get name;
  @BuiltValueField(wireName: 'Value')
  String get value;
  @BuiltValueField(wireName: 'Properties')
  BuiltList<DynamicProperties> get properties;
  String toJson() {
    return json
        .encode(serializers.serializeWith(DynamicProperties.serializer, this));
  }

  static DynamicProperties fromJson(String jsonString) {
    return serializers.deserializeWith(
        DynamicProperties.serializer, json.decode(jsonString));
  }

  static Serializer<DynamicProperties> get serializer =>
      _$dynamicPropertiesSerializer;
}
