library search_location;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:naturinorge_guide/serializers/observations/serializers.dart';
import 'package:naturinorge_guide/serializers/search_location/features.dart';

import 'crs.dart';

part 'search_location.g.dart';

abstract class SearchLocation
    implements Built<SearchLocation, SearchLocationBuilder> {
  SearchLocation._();

  factory SearchLocation([updates(SearchLocationBuilder b)]) = _$SearchLocation;

  @BuiltValueField(wireName: 'features')
  BuiltList<Features> get features;
  @BuiltValueField(wireName: 'crs')
  Crs get crs;
  @BuiltValueField(wireName: 'type')
  String get type;
  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(SearchLocation.serializer, this));
  }

  static SearchLocation fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        SearchLocation.serializer, json.decode(jsonString));
  }

  static Serializer<SearchLocation> get serializer =>
      _$searchLocationSerializer;
}
