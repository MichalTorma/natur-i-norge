// GENERATED CODE - DO NOT MODIFY BY HAND

part of crs_property;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CrsProperty> _$crsPropertySerializer = new _$CrsPropertySerializer();

class _$CrsPropertySerializer implements StructuredSerializer<CrsProperty> {
  @override
  final Iterable<Type> types = const [CrsProperty, _$CrsProperty];
  @override
  final String wireName = 'CrsProperty';

  @override
  Iterable<Object> serialize(Serializers serializers, CrsProperty object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CrsProperty deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CrsPropertyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CrsProperty extends CrsProperty {
  @override
  final String name;

  factory _$CrsProperty([void Function(CrsPropertyBuilder) updates]) =>
      (new CrsPropertyBuilder()..update(updates)).build();

  _$CrsProperty._({this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'CrsProperty', 'name');
  }

  @override
  CrsProperty rebuild(void Function(CrsPropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CrsPropertyBuilder toBuilder() => new CrsPropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CrsProperty && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CrsProperty')..add('name', name))
        .toString();
  }
}

class CrsPropertyBuilder implements Builder<CrsProperty, CrsPropertyBuilder> {
  _$CrsProperty _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  CrsPropertyBuilder();

  CrsPropertyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CrsProperty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CrsProperty;
  }

  @override
  void update(void Function(CrsPropertyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CrsProperty build() {
    final _$result = _$v ??
        new _$CrsProperty._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'CrsProperty', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
