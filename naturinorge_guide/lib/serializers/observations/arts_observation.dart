library arts_observation;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:naturinorge_guide/serializers/observations/observations.dart';
import 'package:naturinorge_guide/serializers/observations/serializers.dart';

part 'arts_observation.g.dart';

abstract class ArtsObservation
    implements Built<ArtsObservation, ArtsObservationBuilder> {
  ArtsObservation._();

  factory ArtsObservation([updates(ArtsObservationBuilder b)]) =
      _$ArtsObservation;

  @BuiltValueField(wireName: 'Observations')
  BuiltList<Observations> get observations;
  @BuiltValueField(wireName: 'PageIndex')
  int get pageIndex;
  @BuiltValueField(wireName: 'PageSize')
  int get pageSize;
  @BuiltValueField(wireName: 'TotalCount')
  int get totalCount;
  @BuiltValueField(wireName: 'TotalPages')
  int get totalPages;
  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(ArtsObservation.serializer, this));
  }

  static ArtsObservation fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        ArtsObservation.serializer, json.decode(jsonString));
  }

  static Serializer<ArtsObservation> get serializer =>
      _$artsObservationSerializer;
}
