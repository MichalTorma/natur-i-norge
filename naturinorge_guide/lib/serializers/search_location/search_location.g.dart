// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_location;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchLocation> _$searchLocationSerializer =
    new _$SearchLocationSerializer();

class _$SearchLocationSerializer
    implements StructuredSerializer<SearchLocation> {
  @override
  final Iterable<Type> types = const [SearchLocation, _$SearchLocation];
  @override
  final String wireName = 'SearchLocation';

  @override
  Iterable<Object> serialize(Serializers serializers, SearchLocation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'features',
      serializers.serialize(object.features,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Features)])),
      'crs',
      serializers.serialize(object.crs, specifiedType: const FullType(Crs)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SearchLocation deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchLocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'features':
          result.features.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Features)]))
              as BuiltList<Object>);
          break;
        case 'crs':
          result.crs.replace(serializers.deserialize(value,
              specifiedType: const FullType(Crs)) as Crs);
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

class _$SearchLocation extends SearchLocation {
  @override
  final BuiltList<Features> features;
  @override
  final Crs crs;
  @override
  final String type;

  factory _$SearchLocation([void Function(SearchLocationBuilder) updates]) =>
      (new SearchLocationBuilder()..update(updates)).build();

  _$SearchLocation._({this.features, this.crs, this.type}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        features, 'SearchLocation', 'features');
    BuiltValueNullFieldError.checkNotNull(crs, 'SearchLocation', 'crs');
    BuiltValueNullFieldError.checkNotNull(type, 'SearchLocation', 'type');
  }

  @override
  SearchLocation rebuild(void Function(SearchLocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchLocationBuilder toBuilder() =>
      new SearchLocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchLocation &&
        features == other.features &&
        crs == other.crs &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, features.hashCode), crs.hashCode), type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchLocation')
          ..add('features', features)
          ..add('crs', crs)
          ..add('type', type))
        .toString();
  }
}

class SearchLocationBuilder
    implements Builder<SearchLocation, SearchLocationBuilder> {
  _$SearchLocation _$v;

  ListBuilder<Features> _features;
  ListBuilder<Features> get features =>
      _$this._features ??= new ListBuilder<Features>();
  set features(ListBuilder<Features> features) => _$this._features = features;

  CrsBuilder _crs;
  CrsBuilder get crs => _$this._crs ??= new CrsBuilder();
  set crs(CrsBuilder crs) => _$this._crs = crs;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  SearchLocationBuilder();

  SearchLocationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _features = $v.features.toBuilder();
      _crs = $v.crs.toBuilder();
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchLocation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchLocation;
  }

  @override
  void update(void Function(SearchLocationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchLocation build() {
    _$SearchLocation _$result;
    try {
      _$result = _$v ??
          new _$SearchLocation._(
              features: features.build(),
              crs: crs.build(),
              type: BuiltValueNullFieldError.checkNotNull(
                  type, 'SearchLocation', 'type'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'features';
        features.build();
        _$failedField = 'crs';
        crs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchLocation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
