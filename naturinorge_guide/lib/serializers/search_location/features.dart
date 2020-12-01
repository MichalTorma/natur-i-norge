library features;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:naturinorge_guide/serializers/observations/serializers.dart';
import 'package:naturinorge_guide/serializers/search_location/feature_geometry.dart';

import 'feature_property.dart';

part 'features.g.dart';

abstract class Features implements Built<Features, FeaturesBuilder> {
  Features._();

  factory Features([updates(FeaturesBuilder b)]) = _$Features;

  @BuiltValueField(wireName: 'geometry')
  FeatureGeometry get geometry;
  @BuiltValueField(wireName: 'id')
  String get id;
  @BuiltValueField(wireName: 'properties')
  FeatureProperty get properties;
  @BuiltValueField(wireName: 'type')
  String get type;
  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Features.serializer, this));
  }

  static Features fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Features.serializer, json.decode(jsonString));
  }

  static Serializer<Features> get serializer => _$featuresSerializer;
}
