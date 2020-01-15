library property_url;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:naturinorge_guide/serializers/observations/serializers.dart';


part 'property_url.g.dart';

abstract class PropertyUrl implements Built<PropertyUrl, PropertyUrlBuilder> {
  PropertyUrl._();

  factory PropertyUrl([updates(PropertyUrlBuilder b)]) = _$PropertyUrl;

  @BuiltValueField(wireName: 'Type')
  String get type;
  @BuiltValueField(wireName: 'LinkTekst')
  String get linkTekst;
  @BuiltValueField(wireName: 'Url')
  String get url;
  String toJson() {
    return json.encode(standardSerializers.serializeWith(PropertyUrl.serializer, this));
  }

  static PropertyUrl fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        PropertyUrl.serializer, json.decode(jsonString));
  }

  static Serializer<PropertyUrl> get serializer => _$propertyUrlSerializer;
}
