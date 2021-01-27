// GENERATED CODE - DO NOT MODIFY BY HAND

part of feature_property;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FeatureProperty> _$featurePropertySerializer =
    new _$FeaturePropertySerializer();

class _$FeaturePropertySerializer
    implements StructuredSerializer<FeatureProperty> {
  @override
  final Iterable<Type> types = const [FeatureProperty, _$FeatureProperty];
  @override
  final String wireName = 'FeatureProperty';

  @override
  Iterable<Object> serialize(Serializers serializers, FeatureProperty object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'ObservationCount',
      serializers.serialize(object.observationCount,
          specifiedType: const FullType(int)),
      'MaxCategory',
      serializers.serialize(object.maxCategory,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  FeatureProperty deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FeaturePropertyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'ObservationCount':
          result.observationCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'MaxCategory':
          result.maxCategory = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$FeatureProperty extends FeatureProperty {
  @override
  final int observationCount;
  @override
  final int maxCategory;

  factory _$FeatureProperty([void Function(FeaturePropertyBuilder) updates]) =>
      (new FeaturePropertyBuilder()..update(updates)).build();

  _$FeatureProperty._({this.observationCount, this.maxCategory}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        observationCount, 'FeatureProperty', 'observationCount');
    BuiltValueNullFieldError.checkNotNull(
        maxCategory, 'FeatureProperty', 'maxCategory');
  }

  @override
  FeatureProperty rebuild(void Function(FeaturePropertyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeaturePropertyBuilder toBuilder() =>
      new FeaturePropertyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FeatureProperty &&
        observationCount == other.observationCount &&
        maxCategory == other.maxCategory;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, observationCount.hashCode), maxCategory.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FeatureProperty')
          ..add('observationCount', observationCount)
          ..add('maxCategory', maxCategory))
        .toString();
  }
}

class FeaturePropertyBuilder
    implements Builder<FeatureProperty, FeaturePropertyBuilder> {
  _$FeatureProperty _$v;

  int _observationCount;
  int get observationCount => _$this._observationCount;
  set observationCount(int observationCount) =>
      _$this._observationCount = observationCount;

  int _maxCategory;
  int get maxCategory => _$this._maxCategory;
  set maxCategory(int maxCategory) => _$this._maxCategory = maxCategory;

  FeaturePropertyBuilder();

  FeaturePropertyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _observationCount = $v.observationCount;
      _maxCategory = $v.maxCategory;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FeatureProperty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FeatureProperty;
  }

  @override
  void update(void Function(FeaturePropertyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FeatureProperty build() {
    final _$result = _$v ??
        new _$FeatureProperty._(
            observationCount: BuiltValueNullFieldError.checkNotNull(
                observationCount, 'FeatureProperty', 'observationCount'),
            maxCategory: BuiltValueNullFieldError.checkNotNull(
                maxCategory, 'FeatureProperty', 'maxCategory'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
