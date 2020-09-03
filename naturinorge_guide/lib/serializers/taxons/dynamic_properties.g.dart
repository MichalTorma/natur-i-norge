// GENERATED CODE - DO NOT MODIFY BY HAND

part of dynamic_properties;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DynamicProperties> _$dynamicPropertiesSerializer =
    new _$DynamicPropertiesSerializer();

class _$DynamicPropertiesSerializer
    implements StructuredSerializer<DynamicProperties> {
  @override
  final Iterable<Type> types = const [DynamicProperties, _$DynamicProperties];
  @override
  final String wireName = 'DynamicProperties';

  @override
  Iterable<Object> serialize(Serializers serializers, DynamicProperties object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'Name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'Value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
    ];
    if (object.properties != null) {
      result
        ..add('Properties')
        ..add(serializers.serialize(object.properties,
            specifiedType: const FullType(
                BuiltList, const [const FullType(DynamicProperties)])));
    }
    return result;
  }

  @override
  DynamicProperties deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DynamicPropertiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'Name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Properties':
          result.properties.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DynamicProperties)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$DynamicProperties extends DynamicProperties {
  @override
  final String name;
  @override
  final String value;
  @override
  final BuiltList<DynamicProperties> properties;

  factory _$DynamicProperties(
          [void Function(DynamicPropertiesBuilder) updates]) =>
      (new DynamicPropertiesBuilder()..update(updates)).build();

  _$DynamicProperties._({this.name, this.value, this.properties}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('DynamicProperties', 'name');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('DynamicProperties', 'value');
    }
  }

  @override
  DynamicProperties rebuild(void Function(DynamicPropertiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DynamicPropertiesBuilder toBuilder() =>
      new DynamicPropertiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DynamicProperties &&
        name == other.name &&
        value == other.value &&
        properties == other.properties;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), value.hashCode), properties.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DynamicProperties')
          ..add('name', name)
          ..add('value', value)
          ..add('properties', properties))
        .toString();
  }
}

class DynamicPropertiesBuilder
    implements Builder<DynamicProperties, DynamicPropertiesBuilder> {
  _$DynamicProperties _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  ListBuilder<DynamicProperties> _properties;
  ListBuilder<DynamicProperties> get properties =>
      _$this._properties ??= new ListBuilder<DynamicProperties>();
  set properties(ListBuilder<DynamicProperties> properties) =>
      _$this._properties = properties;

  DynamicPropertiesBuilder();

  DynamicPropertiesBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _value = _$v.value;
      _properties = _$v.properties?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DynamicProperties other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DynamicProperties;
  }

  @override
  void update(void Function(DynamicPropertiesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DynamicProperties build() {
    _$DynamicProperties _$result;
    try {
      _$result = _$v ??
          new _$DynamicProperties._(
              name: name, value: value, properties: _properties?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'properties';
        _properties?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DynamicProperties', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
