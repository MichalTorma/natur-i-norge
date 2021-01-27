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
    final result = <Object>[];
    Object value;
    value = object.type;
    if (value != null) {
      result
        ..add('Type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.linkTekst;
    if (value != null) {
      result
        ..add('LinkTekst')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('Url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
      final Object value = iterator.current;
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

  _$PropertyUrl._({this.type, this.linkTekst, this.url}) : super._();

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
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _linkTekst = $v.linkTekst;
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PropertyUrl other) {
    ArgumentError.checkNotNull(other, 'other');
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
