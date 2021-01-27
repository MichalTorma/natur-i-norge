// GENERATED CODE - DO NOT MODIFY BY HAND

part of features;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Features> _$featuresSerializer = new _$FeaturesSerializer();

class _$FeaturesSerializer implements StructuredSerializer<Features> {
  @override
  final Iterable<Type> types = const [Features, _$Features];
  @override
  final String wireName = 'Features';

  @override
  Iterable<Object> serialize(Serializers serializers, Features object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'geometry',
      serializers.serialize(object.geometry,
          specifiedType: const FullType(FeatureGeometry)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'properties',
      serializers.serialize(object.properties,
          specifiedType: const FullType(FeatureProperty)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Features deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FeaturesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'geometry':
          result.geometry.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FeatureGeometry))
              as FeatureGeometry);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'properties':
          result.properties.replace(serializers.deserialize(value,
                  specifiedType: const FullType(FeatureProperty))
              as FeatureProperty);
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Features extends Features {
  @override
  final FeatureGeometry geometry;
  @override
  final String id;
  @override
  final FeatureProperty properties;
  @override
  final String type;

  factory _$Features([void Function(FeaturesBuilder) updates]) =>
      (new FeaturesBuilder()..update(updates)).build();

  _$Features._({this.geometry, this.id, this.properties, this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(geometry, 'Features', 'geometry');
    BuiltValueNullFieldError.checkNotNull(id, 'Features', 'id');
    BuiltValueNullFieldError.checkNotNull(properties, 'Features', 'properties');
    BuiltValueNullFieldError.checkNotNull(type, 'Features', 'type');
  }

  @override
  Features rebuild(void Function(FeaturesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeaturesBuilder toBuilder() => new FeaturesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Features &&
        geometry == other.geometry &&
        id == other.id &&
        properties == other.properties &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, geometry.hashCode), id.hashCode), properties.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Features')
          ..add('geometry', geometry)
          ..add('id', id)
          ..add('properties', properties)
          ..add('type', type))
        .toString();
  }
}

class FeaturesBuilder implements Builder<Features, FeaturesBuilder> {
  _$Features _$v;

  FeatureGeometryBuilder _geometry;
  FeatureGeometryBuilder get geometry =>
      _$this._geometry ??= new FeatureGeometryBuilder();
  set geometry(FeatureGeometryBuilder geometry) => _$this._geometry = geometry;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  FeaturePropertyBuilder _properties;
  FeaturePropertyBuilder get properties =>
      _$this._properties ??= new FeaturePropertyBuilder();
  set properties(FeaturePropertyBuilder properties) =>
      _$this._properties = properties;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  FeaturesBuilder();

  FeaturesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _geometry = $v.geometry.toBuilder();
      _id = $v.id;
      _properties = $v.properties.toBuilder();
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Features other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Features;
  }

  @override
  void update(void Function(FeaturesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Features build() {
    _$Features _$result;
    try {
      _$result = _$v ??
          new _$Features._(
              geometry: geometry.build(),
              id: BuiltValueNullFieldError.checkNotNull(id, 'Features', 'id'),
              properties: properties.build(),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, 'Features', 'type'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'geometry';
        geometry.build();

        _$failedField = 'properties';
        properties.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Features', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
