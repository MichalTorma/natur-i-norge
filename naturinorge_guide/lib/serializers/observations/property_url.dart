library property_url;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:naturinorge_guide/serializers/observations/serializers.dart';

part 'property_url.g.dart';

abstract class PropertyUrl implements Built<PropertyUrl, PropertyUrlBuilder> {
  PropertyUrl._();

  factory PropertyUrl([updates(PropertyUrlBuilder b)]) = _$PropertyUrl;

  @nullable
  @BuiltValueField(wireName: 'Type')
  String get type;
  @nullable
  @BuiltValueField(wireName: 'LinkTekst')
  String get linkTekst;
  @nullable
  @BuiltValueField(wireName: 'Url')
  String get url;
  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(PropertyUrl.serializer, this));
  }

  static PropertyUrl fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        PropertyUrl.serializer, json.decode(jsonString));
  }

  static Serializer<PropertyUrl> get serializer => _$propertyUrlSerializer;
}
