// GENERATED CODE - DO NOT MODIFY BY HAND

part of crs;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Crs> _$crsSerializer = new _$CrsSerializer();

class _$CrsSerializer implements StructuredSerializer<Crs> {
  @override
  final Iterable<Type> types = const [Crs, _$Crs];
  @override
  final String wireName = 'Crs';

  @override
  Iterable<Object> serialize(Serializers serializers, Crs object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'properties',
      serializers.serialize(object.properties,
          specifiedType: const FullType(CrsProperty)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Crs deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CrsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'properties':
          result.properties.replace(serializers.deserialize(value,
              specifiedType: const FullType(CrsProperty)) as CrsProperty);
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

class _$Crs extends Crs {
  @override
  final CrsProperty properties;
  @override
  final String type;

  factory _$Crs([void Function(CrsBuilder) updates]) =>
      (new CrsBuilder()..update(updates)).build();

  _$Crs._({this.properties, this.type}) : super._() {
    if (properties == null) {
      throw new BuiltValueNullFieldError('Crs', 'properties');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Crs', 'type');
    }
  }

  @override
  Crs rebuild(void Function(CrsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CrsBuilder toBuilder() => new CrsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Crs && properties == other.properties && type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, properties.hashCode), type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Crs')
          ..add('properties', properties)
          ..add('type', type))
        .toString();
  }
}

class CrsBuilder implements Builder<Crs, CrsBuilder> {
  _$Crs _$v;

  CrsPropertyBuilder _properties;
  CrsPropertyBuilder get properties =>
      _$this._properties ??= new CrsPropertyBuilder();
  set properties(CrsPropertyBuilder properties) =>
      _$this._properties = properties;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  CrsBuilder();

  CrsBuilder get _$this {
    if (_$v != null) {
      _properties = _$v.properties?.toBuilder();
      _type = _$v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Crs other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Crs;
  }

  @override
  void update(void Function(CrsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Crs build() {
    _$Crs _$result;
    try {
      _$result = _$v ?? new _$Crs._(properties: properties.build(), type: type);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'properties';
        properties.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Crs', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
