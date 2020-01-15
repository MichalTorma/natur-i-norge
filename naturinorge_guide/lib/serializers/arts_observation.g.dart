// GENERATED CODE - DO NOT MODIFY BY HAND

part of arts_observation;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArtsObservation> _$artsObservationSerializer =
    new _$ArtsObservationSerializer();

class _$ArtsObservationSerializer
    implements StructuredSerializer<ArtsObservation> {
  @override
  final Iterable<Type> types = const [ArtsObservation, _$ArtsObservation];
  @override
  final String wireName = 'ArtsObservation';

  @override
  Iterable<Object> serialize(Serializers serializers, ArtsObservation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'Observations',
      serializers.serialize(object.observations,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Observations)])),
      'PageIndex',
      serializers.serialize(object.pageIndex,
          specifiedType: const FullType(int)),
      'PageSize',
      serializers.serialize(object.pageSize,
          specifiedType: const FullType(int)),
      'TotalCount',
      serializers.serialize(object.totalCount,
          specifiedType: const FullType(int)),
      'TotalPages',
      serializers.serialize(object.totalPages,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ArtsObservation deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArtsObservationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'Observations':
          result.observations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Observations)]))
              as BuiltList<dynamic>);
          break;
        case 'PageIndex':
          result.pageIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'PageSize':
          result.pageSize = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'TotalCount':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'TotalPages':
          result.totalPages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ArtsObservation extends ArtsObservation {
  @override
  final BuiltList<Observations> observations;
  @override
  final int pageIndex;
  @override
  final int pageSize;
  @override
  final int totalCount;
  @override
  final int totalPages;

  factory _$ArtsObservation([void Function(ArtsObservationBuilder) updates]) =>
      (new ArtsObservationBuilder()..update(updates)).build();

  _$ArtsObservation._(
      {this.observations,
      this.pageIndex,
      this.pageSize,
      this.totalCount,
      this.totalPages})
      : super._() {
    if (observations == null) {
      throw new BuiltValueNullFieldError('ArtsObservation', 'observations');
    }
    if (pageIndex == null) {
      throw new BuiltValueNullFieldError('ArtsObservation', 'pageIndex');
    }
    if (pageSize == null) {
      throw new BuiltValueNullFieldError('ArtsObservation', 'pageSize');
    }
    if (totalCount == null) {
      throw new BuiltValueNullFieldError('ArtsObservation', 'totalCount');
    }
    if (totalPages == null) {
      throw new BuiltValueNullFieldError('ArtsObservation', 'totalPages');
    }
  }

  @override
  ArtsObservation rebuild(void Function(ArtsObservationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtsObservationBuilder toBuilder() =>
      new ArtsObservationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArtsObservation &&
        observations == other.observations &&
        pageIndex == other.pageIndex &&
        pageSize == other.pageSize &&
        totalCount == other.totalCount &&
        totalPages == other.totalPages;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, observations.hashCode), pageIndex.hashCode),
                pageSize.hashCode),
            totalCount.hashCode),
        totalPages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ArtsObservation')
          ..add('observations', observations)
          ..add('pageIndex', pageIndex)
          ..add('pageSize', pageSize)
          ..add('totalCount', totalCount)
          ..add('totalPages', totalPages))
        .toString();
  }
}

class ArtsObservationBuilder
    implements Builder<ArtsObservation, ArtsObservationBuilder> {
  _$ArtsObservation _$v;

  ListBuilder<Observations> _observations;
  ListBuilder<Observations> get observations =>
      _$this._observations ??= new ListBuilder<Observations>();
  set observations(ListBuilder<Observations> observations) =>
      _$this._observations = observations;

  int _pageIndex;
  int get pageIndex => _$this._pageIndex;
  set pageIndex(int pageIndex) => _$this._pageIndex = pageIndex;

  int _pageSize;
  int get pageSize => _$this._pageSize;
  set pageSize(int pageSize) => _$this._pageSize = pageSize;

  int _totalCount;
  int get totalCount => _$this._totalCount;
  set totalCount(int totalCount) => _$this._totalCount = totalCount;

  int _totalPages;
  int get totalPages => _$this._totalPages;
  set totalPages(int totalPages) => _$this._totalPages = totalPages;

  ArtsObservationBuilder();

  ArtsObservationBuilder get _$this {
    if (_$v != null) {
      _observations = _$v.observations?.toBuilder();
      _pageIndex = _$v.pageIndex;
      _pageSize = _$v.pageSize;
      _totalCount = _$v.totalCount;
      _totalPages = _$v.totalPages;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArtsObservation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ArtsObservation;
  }

  @override
  void update(void Function(ArtsObservationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ArtsObservation build() {
    _$ArtsObservation _$result;
    try {
      _$result = _$v ??
          new _$ArtsObservation._(
              observations: observations.build(),
              pageIndex: pageIndex,
              pageSize: pageSize,
              totalCount: totalCount,
              totalPages: totalPages);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'observations';
        observations.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ArtsObservation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
