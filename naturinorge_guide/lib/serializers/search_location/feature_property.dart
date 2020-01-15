library feature_property;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:naturinorge_guide/serializers/observations/serializers.dart';

part 'feature_property.g.dart';

abstract class FeatureProperty
    implements Built<FeatureProperty, FeaturePropertyBuilder> {
  FeatureProperty._();

  factory FeatureProperty([updates(FeaturePropertyBuilder b)]) =
      _$FeatureProperty;

  @BuiltValueField(wireName: 'ObservationCount')
  int get observationCount;
  @BuiltValueField(wireName: 'MaxCategory')
  int get maxCategory;
  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(FeatureProperty.serializer, this));
  }

  static FeatureProperty fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        FeatureProperty.serializer, json.decode(jsonString));
  }

  static Serializer<FeatureProperty> get serializer =>
      _$featurePropertySerializer;
}
