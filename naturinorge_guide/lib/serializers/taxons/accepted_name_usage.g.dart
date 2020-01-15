// GENERATED CODE - DO NOT MODIFY BY HAND

part of accepted_name_usage;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AcceptedNameUsage> _$acceptedNameUsageSerializer =
    new _$AcceptedNameUsageSerializer();

class _$AcceptedNameUsageSerializer
    implements StructuredSerializer<AcceptedNameUsage> {
  @override
  final Iterable<Type> types = const [AcceptedNameUsage, _$AcceptedNameUsage];
  @override
  final String wireName = 'AcceptedNameUsage';

  @override
  Iterable<Object> serialize(Serializers serializers, AcceptedNameUsage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'Id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'scientificNameID',
      serializers.serialize(object.scientificNameID,
          specifiedType: const FullType(int)),
      'taxonID',
      serializers.serialize(object.taxonID, specifiedType: const FullType(int)),
      'scientificName',
      serializers.serialize(object.scientificName,
          specifiedType: const FullType(String)),
      'scientificNameAuthorship',
      serializers.serialize(object.scientificNameAuthorship,
          specifiedType: const FullType(String)),
      'taxonRank',
      serializers.serialize(object.taxonRank,
          specifiedType: const FullType(String)),
      'taxonomicStatus',
      serializers.serialize(object.taxonomicStatus,
          specifiedType: const FullType(String)),
      'acceptedNameUsage',
      serializers.serialize(object.acceptedNameUsage,
          specifiedType: const FullType(String)),
      'higherClassification',
      serializers.serialize(object.higherClassification,
          specifiedType: const FullType(String)),
      'nameAccordingTo',
      serializers.serialize(object.nameAccordingTo,
          specifiedType: const FullType(String)),
      'dynamicProperties',
      serializers.serialize(object.dynamicProperties,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AcceptedNameUsage deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AcceptedNameUsageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'Id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'scientificNameID':
          result.scientificNameID = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'taxonID':
          result.taxonID = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'scientificName':
          result.scientificName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'scientificNameAuthorship':
          result.scientificNameAuthorship = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'taxonRank':
          result.taxonRank = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'taxonomicStatus':
          result.taxonomicStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'acceptedNameUsage':
          result.acceptedNameUsage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'higherClassification':
          result.higherClassification = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nameAccordingTo':
          result.nameAccordingTo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dynamicProperties':
          result.dynamicProperties = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AcceptedNameUsage extends AcceptedNameUsage {
  @override
  final String id;
  @override
  final int scientificNameID;
  @override
  final int taxonID;
  @override
  final String scientificName;
  @override
  final String scientificNameAuthorship;
  @override
  final String taxonRank;
  @override
  final String taxonomicStatus;
  @override
  final String acceptedNameUsage;
  @override
  final String higherClassification;
  @override
  final String nameAccordingTo;
  @override
  final String dynamicProperties;

  factory _$AcceptedNameUsage(
          [void Function(AcceptedNameUsageBuilder) updates]) =>
      (new AcceptedNameUsageBuilder()..update(updates)).build();

  _$AcceptedNameUsage._(
      {this.id,
      this.scientificNameID,
      this.taxonID,
      this.scientificName,
      this.scientificNameAuthorship,
      this.taxonRank,
      this.taxonomicStatus,
      this.acceptedNameUsage,
      this.higherClassification,
      this.nameAccordingTo,
      this.dynamicProperties})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('AcceptedNameUsage', 'id');
    }
    if (scientificNameID == null) {
      throw new BuiltValueNullFieldError(
          'AcceptedNameUsage', 'scientificNameID');
    }
    if (taxonID == null) {
      throw new BuiltValueNullFieldError('AcceptedNameUsage', 'taxonID');
    }
    if (scientificName == null) {
      throw new BuiltValueNullFieldError('AcceptedNameUsage', 'scientificName');
    }
    if (scientificNameAuthorship == null) {
      throw new BuiltValueNullFieldError(
          'AcceptedNameUsage', 'scientificNameAuthorship');
    }
    if (taxonRank == null) {
      throw new BuiltValueNullFieldError('AcceptedNameUsage', 'taxonRank');
    }
    if (taxonomicStatus == null) {
      throw new BuiltValueNullFieldError(
          'AcceptedNameUsage', 'taxonomicStatus');
    }
    if (acceptedNameUsage == null) {
      throw new BuiltValueNullFieldError(
          'AcceptedNameUsage', 'acceptedNameUsage');
    }
    if (higherClassification == null) {
      throw new BuiltValueNullFieldError(
          'AcceptedNameUsage', 'higherClassification');
    }
    if (nameAccordingTo == null) {
      throw new BuiltValueNullFieldError(
          'AcceptedNameUsage', 'nameAccordingTo');
    }
    if (dynamicProperties == null) {
      throw new BuiltValueNullFieldError(
          'AcceptedNameUsage', 'dynamicProperties');
    }
  }

  @override
  AcceptedNameUsage rebuild(void Function(AcceptedNameUsageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AcceptedNameUsageBuilder toBuilder() =>
      new AcceptedNameUsageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AcceptedNameUsage &&
        id == other.id &&
        scientificNameID == other.scientificNameID &&
        taxonID == other.taxonID &&
        scientificName == other.scientificName &&
        scientificNameAuthorship == other.scientificNameAuthorship &&
        taxonRank == other.taxonRank &&
        taxonomicStatus == other.taxonomicStatus &&
        acceptedNameUsage == other.acceptedNameUsage &&
        higherClassification == other.higherClassification &&
        nameAccordingTo == other.nameAccordingTo &&
        dynamicProperties == other.dynamicProperties;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, id.hashCode),
                                            scientificNameID.hashCode),
                                        taxonID.hashCode),
                                    scientificName.hashCode),
                                scientificNameAuthorship.hashCode),
                            taxonRank.hashCode),
                        taxonomicStatus.hashCode),
                    acceptedNameUsage.hashCode),
                higherClassification.hashCode),
            nameAccordingTo.hashCode),
        dynamicProperties.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AcceptedNameUsage')
          ..add('id', id)
          ..add('scientificNameID', scientificNameID)
          ..add('taxonID', taxonID)
          ..add('scientificName', scientificName)
          ..add('scientificNameAuthorship', scientificNameAuthorship)
          ..add('taxonRank', taxonRank)
          ..add('taxonomicStatus', taxonomicStatus)
          ..add('acceptedNameUsage', acceptedNameUsage)
          ..add('higherClassification', higherClassification)
          ..add('nameAccordingTo', nameAccordingTo)
          ..add('dynamicProperties', dynamicProperties))
        .toString();
  }
}

class AcceptedNameUsageBuilder
    implements Builder<AcceptedNameUsage, AcceptedNameUsageBuilder> {
  _$AcceptedNameUsage _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  int _scientificNameID;
  int get scientificNameID => _$this._scientificNameID;
  set scientificNameID(int scientificNameID) =>
      _$this._scientificNameID = scientificNameID;

  int _taxonID;
  int get taxonID => _$this._taxonID;
  set taxonID(int taxonID) => _$this._taxonID = taxonID;

  String _scientificName;
  String get scientificName => _$this._scientificName;
  set scientificName(String scientificName) =>
      _$this._scientificName = scientificName;

  String _scientificNameAuthorship;
  String get scientificNameAuthorship => _$this._scientificNameAuthorship;
  set scientificNameAuthorship(String scientificNameAuthorship) =>
      _$this._scientificNameAuthorship = scientificNameAuthorship;

  String _taxonRank;
  String get taxonRank => _$this._taxonRank;
  set taxonRank(String taxonRank) => _$this._taxonRank = taxonRank;

  String _taxonomicStatus;
  String get taxonomicStatus => _$this._taxonomicStatus;
  set taxonomicStatus(String taxonomicStatus) =>
      _$this._taxonomicStatus = taxonomicStatus;

  String _acceptedNameUsage;
  String get acceptedNameUsage => _$this._acceptedNameUsage;
  set acceptedNameUsage(String acceptedNameUsage) =>
      _$this._acceptedNameUsage = acceptedNameUsage;

  String _higherClassification;
  String get higherClassification => _$this._higherClassification;
  set higherClassification(String higherClassification) =>
      _$this._higherClassification = higherClassification;

  String _nameAccordingTo;
  String get nameAccordingTo => _$this._nameAccordingTo;
  set nameAccordingTo(String nameAccordingTo) =>
      _$this._nameAccordingTo = nameAccordingTo;

  String _dynamicProperties;
  String get dynamicProperties => _$this._dynamicProperties;
  set dynamicProperties(String dynamicProperties) =>
      _$this._dynamicProperties = dynamicProperties;

  AcceptedNameUsageBuilder();

  AcceptedNameUsageBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _scientificNameID = _$v.scientificNameID;
      _taxonID = _$v.taxonID;
      _scientificName = _$v.scientificName;
      _scientificNameAuthorship = _$v.scientificNameAuthorship;
      _taxonRank = _$v.taxonRank;
      _taxonomicStatus = _$v.taxonomicStatus;
      _acceptedNameUsage = _$v.acceptedNameUsage;
      _higherClassification = _$v.higherClassification;
      _nameAccordingTo = _$v.nameAccordingTo;
      _dynamicProperties = _$v.dynamicProperties;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AcceptedNameUsage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AcceptedNameUsage;
  }

  @override
  void update(void Function(AcceptedNameUsageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AcceptedNameUsage build() {
    final _$result = _$v ??
        new _$AcceptedNameUsage._(
            id: id,
            scientificNameID: scientificNameID,
            taxonID: taxonID,
            scientificName: scientificName,
            scientificNameAuthorship: scientificNameAuthorship,
            taxonRank: taxonRank,
            taxonomicStatus: taxonomicStatus,
            acceptedNameUsage: acceptedNameUsage,
            higherClassification: higherClassification,
            nameAccordingTo: nameAccordingTo,
            dynamicProperties: dynamicProperties);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
