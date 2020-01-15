// GENERATED CODE - DO NOT MODIFY BY HAND

part of arts_taxon;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArtsTaxon> _$artsTaxonSerializer = new _$ArtsTaxonSerializer();

class _$ArtsTaxonSerializer implements StructuredSerializer<ArtsTaxon> {
  @override
  final Iterable<Type> types = const [ArtsTaxon, _$ArtsTaxon];
  @override
  final String wireName = 'ArtsTaxon';

  @override
  Iterable<Object> serialize(Serializers serializers, ArtsTaxon object,
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
      'higherClassification',
      serializers.serialize(object.higherClassification,
          specifiedType: const FullType(
              BuiltList, const [const FullType(AcceptedNameUsage)])),
      'nameAccordingTo',
      serializers.serialize(object.nameAccordingTo,
          specifiedType: const FullType(String)),
      'dynamicProperties',
      serializers.serialize(object.dynamicProperties,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DynamicProperties)])),
    ];
    if (object.acceptedNameUsage != null) {
      result
        ..add('acceptedNameUsage')
        ..add(serializers.serialize(object.acceptedNameUsage,
            specifiedType: const FullType(AcceptedNameUsage)));
    }
    return result;
  }

  @override
  ArtsTaxon deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArtsTaxonBuilder();

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
          result.acceptedNameUsage.replace(serializers.deserialize(value,
                  specifiedType: const FullType(AcceptedNameUsage))
              as AcceptedNameUsage);
          break;
        case 'higherClassification':
          result.higherClassification.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AcceptedNameUsage)]))
              as BuiltList<dynamic>);
          break;
        case 'nameAccordingTo':
          result.nameAccordingTo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dynamicProperties':
          result.dynamicProperties.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DynamicProperties)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$ArtsTaxon extends ArtsTaxon {
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
  final AcceptedNameUsage acceptedNameUsage;
  @override
  final BuiltList<AcceptedNameUsage> higherClassification;
  @override
  final String nameAccordingTo;
  @override
  final BuiltList<DynamicProperties> dynamicProperties;

  factory _$ArtsTaxon([void Function(ArtsTaxonBuilder) updates]) =>
      (new ArtsTaxonBuilder()..update(updates)).build();

  _$ArtsTaxon._(
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
      throw new BuiltValueNullFieldError('ArtsTaxon', 'id');
    }
    if (scientificNameID == null) {
      throw new BuiltValueNullFieldError('ArtsTaxon', 'scientificNameID');
    }
    if (taxonID == null) {
      throw new BuiltValueNullFieldError('ArtsTaxon', 'taxonID');
    }
    if (scientificName == null) {
      throw new BuiltValueNullFieldError('ArtsTaxon', 'scientificName');
    }
    if (scientificNameAuthorship == null) {
      throw new BuiltValueNullFieldError(
          'ArtsTaxon', 'scientificNameAuthorship');
    }
    if (taxonRank == null) {
      throw new BuiltValueNullFieldError('ArtsTaxon', 'taxonRank');
    }
    if (taxonomicStatus == null) {
      throw new BuiltValueNullFieldError('ArtsTaxon', 'taxonomicStatus');
    }
    if (higherClassification == null) {
      throw new BuiltValueNullFieldError('ArtsTaxon', 'higherClassification');
    }
    if (nameAccordingTo == null) {
      throw new BuiltValueNullFieldError('ArtsTaxon', 'nameAccordingTo');
    }
    if (dynamicProperties == null) {
      throw new BuiltValueNullFieldError('ArtsTaxon', 'dynamicProperties');
    }
  }

  @override
  ArtsTaxon rebuild(void Function(ArtsTaxonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtsTaxonBuilder toBuilder() => new ArtsTaxonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArtsTaxon &&
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
    return (newBuiltValueToStringHelper('ArtsTaxon')
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

class ArtsTaxonBuilder implements Builder<ArtsTaxon, ArtsTaxonBuilder> {
  _$ArtsTaxon _$v;

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

  AcceptedNameUsageBuilder _acceptedNameUsage;
  AcceptedNameUsageBuilder get acceptedNameUsage =>
      _$this._acceptedNameUsage ??= new AcceptedNameUsageBuilder();
  set acceptedNameUsage(AcceptedNameUsageBuilder acceptedNameUsage) =>
      _$this._acceptedNameUsage = acceptedNameUsage;

  ListBuilder<AcceptedNameUsage> _higherClassification;
  ListBuilder<AcceptedNameUsage> get higherClassification =>
      _$this._higherClassification ??= new ListBuilder<AcceptedNameUsage>();
  set higherClassification(
          ListBuilder<AcceptedNameUsage> higherClassification) =>
      _$this._higherClassification = higherClassification;

  String _nameAccordingTo;
  String get nameAccordingTo => _$this._nameAccordingTo;
  set nameAccordingTo(String nameAccordingTo) =>
      _$this._nameAccordingTo = nameAccordingTo;

  ListBuilder<DynamicProperties> _dynamicProperties;
  ListBuilder<DynamicProperties> get dynamicProperties =>
      _$this._dynamicProperties ??= new ListBuilder<DynamicProperties>();
  set dynamicProperties(ListBuilder<DynamicProperties> dynamicProperties) =>
      _$this._dynamicProperties = dynamicProperties;

  ArtsTaxonBuilder();

  ArtsTaxonBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _scientificNameID = _$v.scientificNameID;
      _taxonID = _$v.taxonID;
      _scientificName = _$v.scientificName;
      _scientificNameAuthorship = _$v.scientificNameAuthorship;
      _taxonRank = _$v.taxonRank;
      _taxonomicStatus = _$v.taxonomicStatus;
      _acceptedNameUsage = _$v.acceptedNameUsage?.toBuilder();
      _higherClassification = _$v.higherClassification?.toBuilder();
      _nameAccordingTo = _$v.nameAccordingTo;
      _dynamicProperties = _$v.dynamicProperties?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArtsTaxon other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ArtsTaxon;
  }

  @override
  void update(void Function(ArtsTaxonBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ArtsTaxon build() {
    _$ArtsTaxon _$result;
    try {
      _$result = _$v ??
          new _$ArtsTaxon._(
              id: id,
              scientificNameID: scientificNameID,
              taxonID: taxonID,
              scientificName: scientificName,
              scientificNameAuthorship: scientificNameAuthorship,
              taxonRank: taxonRank,
              taxonomicStatus: taxonomicStatus,
              acceptedNameUsage: _acceptedNameUsage?.build(),
              higherClassification: higherClassification.build(),
              nameAccordingTo: nameAccordingTo,
              dynamicProperties: dynamicProperties.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'acceptedNameUsage';
        _acceptedNameUsage?.build();
        _$failedField = 'higherClassification';
        higherClassification.build();

        _$failedField = 'dynamicProperties';
        dynamicProperties.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ArtsTaxon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
