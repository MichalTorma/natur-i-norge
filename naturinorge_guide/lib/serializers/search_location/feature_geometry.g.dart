// GENERATED CODE - DO NOT MODIFY BY HAND

part of feature_geometry;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FeatureGeometry> _$featureGeometrySerializer =
    new _$FeatureGeometrySerializer();

class _$FeatureGeometrySerializer
    implements StructuredSerializer<FeatureGeometry> {
  @override
  final Iterable<Type> types = const [FeatureGeometry, _$FeatureGeometry];
  @override
  final String wireName = 'FeatureGeometry';

  @override
  Iterable<Object> serialize(Serializers serializers, FeatureGeometry object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'coordinates',
      serializers.serialize(object.coordinates,
          specifiedType:
              const FullType(BuiltList, const [const FullType(double)])),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  FeatureGeometry deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FeatureGeometryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'coordinates':
          result.coordinates.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(double)]))
              as BuiltList<dynamic>);
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

class _$FeatureGeometry extends FeatureGeometry {
  @override
  final BuiltList<double> coordinates;
  @override
  final String type;

  factory _$FeatureGeometry([void Function(FeatureGeometryBuilder) updates]) =>
      (new FeatureGeometryBuilder()..update(updates)).build();

  _$FeatureGeometry._({this.coordinates, this.type}) : super._() {
    if (coordinates == null) {
      throw new BuiltValueNullFieldError('FeatureGeometry', 'coordinates');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('FeatureGeometry', 'type');
    }
  }

  @override
  FeatureGeometry rebuild(void Function(FeatureGeometryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeatureGeometryBuilder toBuilder() =>
      new FeatureGeometryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FeatureGeometry &&
        coordinates == other.coordinates &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, coordinates.hashCode), type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FeatureGeometry')
          ..add('coordinates', coordinates)
          ..add('type', type))
        .toString();
  }
}

class FeatureGeometryBuilder
    implements Builder<FeatureGeometry, FeatureGeometryBuilder> {
  _$FeatureGeometry _$v;

  ListBuilder<double> _coordinates;
  ListBuilder<double> get coordinates =>
      _$this._coordinates ??= new ListBuilder<double>();
  set coordinates(ListBuilder<double> coordinates) =>
      _$this._coordinates = coordinates;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  FeatureGeometryBuilder();

  FeatureGeometryBuilder get _$this {
    if (_$v != null) {
      _coordinates = _$v.coordinates?.toBuilder();
      _type = _$v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FeatureGeometry other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FeatureGeometry;
  }

  @override
  void update(void Function(FeatureGeometryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FeatureGeometry build() {
    _$FeatureGeometry _$result;
    try {
      _$result = _$v ??
          new _$FeatureGeometry._(coordinates: coordinates.build(), type: type);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'coordinates';
        coordinates.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FeatureGeometry', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
