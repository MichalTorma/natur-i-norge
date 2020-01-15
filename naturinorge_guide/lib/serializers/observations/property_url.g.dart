// GENERATED CODE - DO NOT MODIFY BY HAND

part of property_url;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PropertyUrl> _$propertyUrlSerializer = new _$PropertyUrlSerializer();

class _$PropertyUrlSerializer implements StructuredSerializer<PropertyUrl> {
  @override
  final Iterable<Type> types = const [PropertyUrl, _$PropertyUrl];
  @override
  final String wireName = 'PropertyUrl';

  @override
  Iterable<Object> serialize(Serializers serializers, PropertyUrl object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'Type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'LinkTekst',
      serializers.serialize(object.linkTekst,
          specifiedType: const FullType(String)),
      'Url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PropertyUrl deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PropertyUrlBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'Type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'LinkTekst':
          result.linkTekst = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PropertyUrl extends PropertyUrl {
  @override
  final String type;
  @override
  final String linkTekst;
  @override
  final String url;

  factory _$PropertyUrl([void Function(PropertyUrlBuilder) updates]) =>
      (new PropertyUrlBuilder()..update(updates)).build();

  _$PropertyUrl._({this.type, this.linkTekst, this.url}) : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('PropertyUrl', 'type');
    }
    if (linkTekst == null) {
      throw new BuiltValueNullFieldError('PropertyUrl', 'linkTekst');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('PropertyUrl', 'url');
    }
  }

  @override
  PropertyUrl rebuild(void Function(PropertyUrlBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PropertyUrlBuilder toBuilder() => new PropertyUrlBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PropertyUrl &&
        type == other.type &&
        linkTekst == other.linkTekst &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, type.hashCode), linkTekst.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PropertyUrl')
          ..add('type', type)
          ..add('linkTekst', linkTekst)
          ..add('url', url))
        .toString();
  }
}

class PropertyUrlBuilder implements Builder<PropertyUrl, PropertyUrlBuilder> {
  _$PropertyUrl _$v;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _linkTekst;
  String get linkTekst => _$this._linkTekst;
  set linkTekst(String linkTekst) => _$this._linkTekst = linkTekst;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  PropertyUrlBuilder();

  PropertyUrlBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type;
      _linkTekst = _$v.linkTekst;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PropertyUrl other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PropertyUrl;
  }

  @override
  void update(void Function(PropertyUrlBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PropertyUrl build() {
    final _$result =
        _$v ?? new _$PropertyUrl._(type: type, linkTekst: linkTekst, url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
