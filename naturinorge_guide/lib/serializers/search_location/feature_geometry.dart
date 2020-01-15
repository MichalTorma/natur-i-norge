library feature_geometry;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:naturinorge_guide/serializers/observations/serializers.dart';

part 'feature_geometry.g.dart';

abstract class FeatureGeometry
    implements Built<FeatureGeometry, FeatureGeometryBuilder> {
  FeatureGeometry._();

  factory FeatureGeometry([updates(FeatureGeometryBuilder b)]) =
      _$FeatureGeometry;

  @BuiltValueField(wireName: 'coordinates')
  BuiltList<int> get coordinates;
  @BuiltValueField(wireName: 'type')
  String get type;
  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(FeatureGeometry.serializer, this));
  }

  static FeatureGeometry fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        FeatureGeometry.serializer, json.decode(jsonString));
  }

  static Serializer<FeatureGeometry> get serializer =>
      _$featureGeometrySerializer;
}
