// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nin_database.dart';

// ignore_for_file: type=lint
class $NinTypesTable extends NinTypes with TableInfo<$NinTypesTable, NinType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NinTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _navnMeta = const VerificationMeta('navn');
  @override
  late final GeneratedColumn<String> navn = GeneratedColumn<String>(
    'navn',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kategoriMeta = const VerificationMeta(
    'kategori',
  );
  @override
  late final GeneratedColumn<String> kategori = GeneratedColumn<String>(
    'kategori',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ecosystnivaaNavnMeta = const VerificationMeta(
    'ecosystnivaaNavn',
  );
  @override
  late final GeneratedColumn<String> ecosystnivaaNavn = GeneratedColumn<String>(
    'ecosystnivaa_navn',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typekategoriNavnMeta = const VerificationMeta(
    'typekategoriNavn',
  );
  @override
  late final GeneratedColumn<String> typekategoriNavn = GeneratedColumn<String>(
    'typekategori_navn',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _langkodeMeta = const VerificationMeta(
    'langkode',
  );
  @override
  late final GeneratedColumn<String> langkode = GeneratedColumn<String>(
    'langkode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _definisjonMeta = const VerificationMeta(
    'definisjon',
  );
  @override
  late final GeneratedColumn<String> definisjon = GeneratedColumn<String>(
    'definisjon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lkmDataMeta = const VerificationMeta(
    'lkmData',
  );
  @override
  late final GeneratedColumn<String> lkmData = GeneratedColumn<String>(
    'lkm_data',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scaleMeta = const VerificationMeta('scale');
  @override
  late final GeneratedColumn<String> scale = GeneratedColumn<String>(
    'scale',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _containsTypesMeta = const VerificationMeta(
    'containsTypes',
  );
  @override
  late final GeneratedColumn<String> containsTypes = GeneratedColumn<String>(
    'contains_types',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    navn,
    kategori,
    parentId,
    ecosystnivaaNavn,
    typekategoriNavn,
    langkode,
    definisjon,
    imageUrl,
    description,
    lkmData,
    scale,
    containsTypes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nin_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<NinType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('navn')) {
      context.handle(
        _navnMeta,
        navn.isAcceptableOrUnknown(data['navn']!, _navnMeta),
      );
    } else if (isInserting) {
      context.missing(_navnMeta);
    }
    if (data.containsKey('kategori')) {
      context.handle(
        _kategoriMeta,
        kategori.isAcceptableOrUnknown(data['kategori']!, _kategoriMeta),
      );
    } else if (isInserting) {
      context.missing(_kategoriMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('ecosystnivaa_navn')) {
      context.handle(
        _ecosystnivaaNavnMeta,
        ecosystnivaaNavn.isAcceptableOrUnknown(
          data['ecosystnivaa_navn']!,
          _ecosystnivaaNavnMeta,
        ),
      );
    }
    if (data.containsKey('typekategori_navn')) {
      context.handle(
        _typekategoriNavnMeta,
        typekategoriNavn.isAcceptableOrUnknown(
          data['typekategori_navn']!,
          _typekategoriNavnMeta,
        ),
      );
    }
    if (data.containsKey('langkode')) {
      context.handle(
        _langkodeMeta,
        langkode.isAcceptableOrUnknown(data['langkode']!, _langkodeMeta),
      );
    }
    if (data.containsKey('definisjon')) {
      context.handle(
        _definisjonMeta,
        definisjon.isAcceptableOrUnknown(data['definisjon']!, _definisjonMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('lkm_data')) {
      context.handle(
        _lkmDataMeta,
        lkmData.isAcceptableOrUnknown(data['lkm_data']!, _lkmDataMeta),
      );
    }
    if (data.containsKey('scale')) {
      context.handle(
        _scaleMeta,
        scale.isAcceptableOrUnknown(data['scale']!, _scaleMeta),
      );
    }
    if (data.containsKey('contains_types')) {
      context.handle(
        _containsTypesMeta,
        containsTypes.isAcceptableOrUnknown(
          data['contains_types']!,
          _containsTypesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NinType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      navn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}navn'],
      )!,
      kategori: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kategori'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      ),
      ecosystnivaaNavn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ecosystnivaa_navn'],
      ),
      typekategoriNavn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}typekategori_navn'],
      ),
      langkode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}langkode'],
      ),
      definisjon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}definisjon'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      lkmData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lkm_data'],
      ),
      scale: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scale'],
      ),
      containsTypes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contains_types'],
      ),
    );
  }

  @override
  $NinTypesTable createAlias(String alias) {
    return $NinTypesTable(attachedDatabase, alias);
  }
}

class NinType extends DataClass implements Insertable<NinType> {
  final String id;
  final String navn;
  final String kategori;
  final String? parentId;
  final String? ecosystnivaaNavn;
  final String? typekategoriNavn;
  final String? langkode;
  final String? definisjon;
  final String? imageUrl;
  final String? description;
  final String? lkmData;
  final String? scale;
  final String? containsTypes;
  const NinType({
    required this.id,
    required this.navn,
    required this.kategori,
    this.parentId,
    this.ecosystnivaaNavn,
    this.typekategoriNavn,
    this.langkode,
    this.definisjon,
    this.imageUrl,
    this.description,
    this.lkmData,
    this.scale,
    this.containsTypes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['navn'] = Variable<String>(navn);
    map['kategori'] = Variable<String>(kategori);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    if (!nullToAbsent || ecosystnivaaNavn != null) {
      map['ecosystnivaa_navn'] = Variable<String>(ecosystnivaaNavn);
    }
    if (!nullToAbsent || typekategoriNavn != null) {
      map['typekategori_navn'] = Variable<String>(typekategoriNavn);
    }
    if (!nullToAbsent || langkode != null) {
      map['langkode'] = Variable<String>(langkode);
    }
    if (!nullToAbsent || definisjon != null) {
      map['definisjon'] = Variable<String>(definisjon);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || lkmData != null) {
      map['lkm_data'] = Variable<String>(lkmData);
    }
    if (!nullToAbsent || scale != null) {
      map['scale'] = Variable<String>(scale);
    }
    if (!nullToAbsent || containsTypes != null) {
      map['contains_types'] = Variable<String>(containsTypes);
    }
    return map;
  }

  NinTypesCompanion toCompanion(bool nullToAbsent) {
    return NinTypesCompanion(
      id: Value(id),
      navn: Value(navn),
      kategori: Value(kategori),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      ecosystnivaaNavn: ecosystnivaaNavn == null && nullToAbsent
          ? const Value.absent()
          : Value(ecosystnivaaNavn),
      typekategoriNavn: typekategoriNavn == null && nullToAbsent
          ? const Value.absent()
          : Value(typekategoriNavn),
      langkode: langkode == null && nullToAbsent
          ? const Value.absent()
          : Value(langkode),
      definisjon: definisjon == null && nullToAbsent
          ? const Value.absent()
          : Value(definisjon),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      lkmData: lkmData == null && nullToAbsent
          ? const Value.absent()
          : Value(lkmData),
      scale: scale == null && nullToAbsent
          ? const Value.absent()
          : Value(scale),
      containsTypes: containsTypes == null && nullToAbsent
          ? const Value.absent()
          : Value(containsTypes),
    );
  }

  factory NinType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NinType(
      id: serializer.fromJson<String>(json['id']),
      navn: serializer.fromJson<String>(json['navn']),
      kategori: serializer.fromJson<String>(json['kategori']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      ecosystnivaaNavn: serializer.fromJson<String?>(json['ecosystnivaaNavn']),
      typekategoriNavn: serializer.fromJson<String?>(json['typekategoriNavn']),
      langkode: serializer.fromJson<String?>(json['langkode']),
      definisjon: serializer.fromJson<String?>(json['definisjon']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      description: serializer.fromJson<String?>(json['description']),
      lkmData: serializer.fromJson<String?>(json['lkmData']),
      scale: serializer.fromJson<String?>(json['scale']),
      containsTypes: serializer.fromJson<String?>(json['containsTypes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'navn': serializer.toJson<String>(navn),
      'kategori': serializer.toJson<String>(kategori),
      'parentId': serializer.toJson<String?>(parentId),
      'ecosystnivaaNavn': serializer.toJson<String?>(ecosystnivaaNavn),
      'typekategoriNavn': serializer.toJson<String?>(typekategoriNavn),
      'langkode': serializer.toJson<String?>(langkode),
      'definisjon': serializer.toJson<String?>(definisjon),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'description': serializer.toJson<String?>(description),
      'lkmData': serializer.toJson<String?>(lkmData),
      'scale': serializer.toJson<String?>(scale),
      'containsTypes': serializer.toJson<String?>(containsTypes),
    };
  }

  NinType copyWith({
    String? id,
    String? navn,
    String? kategori,
    Value<String?> parentId = const Value.absent(),
    Value<String?> ecosystnivaaNavn = const Value.absent(),
    Value<String?> typekategoriNavn = const Value.absent(),
    Value<String?> langkode = const Value.absent(),
    Value<String?> definisjon = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> lkmData = const Value.absent(),
    Value<String?> scale = const Value.absent(),
    Value<String?> containsTypes = const Value.absent(),
  }) => NinType(
    id: id ?? this.id,
    navn: navn ?? this.navn,
    kategori: kategori ?? this.kategori,
    parentId: parentId.present ? parentId.value : this.parentId,
    ecosystnivaaNavn: ecosystnivaaNavn.present
        ? ecosystnivaaNavn.value
        : this.ecosystnivaaNavn,
    typekategoriNavn: typekategoriNavn.present
        ? typekategoriNavn.value
        : this.typekategoriNavn,
    langkode: langkode.present ? langkode.value : this.langkode,
    definisjon: definisjon.present ? definisjon.value : this.definisjon,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    description: description.present ? description.value : this.description,
    lkmData: lkmData.present ? lkmData.value : this.lkmData,
    scale: scale.present ? scale.value : this.scale,
    containsTypes: containsTypes.present
        ? containsTypes.value
        : this.containsTypes,
  );
  NinType copyWithCompanion(NinTypesCompanion data) {
    return NinType(
      id: data.id.present ? data.id.value : this.id,
      navn: data.navn.present ? data.navn.value : this.navn,
      kategori: data.kategori.present ? data.kategori.value : this.kategori,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      ecosystnivaaNavn: data.ecosystnivaaNavn.present
          ? data.ecosystnivaaNavn.value
          : this.ecosystnivaaNavn,
      typekategoriNavn: data.typekategoriNavn.present
          ? data.typekategoriNavn.value
          : this.typekategoriNavn,
      langkode: data.langkode.present ? data.langkode.value : this.langkode,
      definisjon: data.definisjon.present
          ? data.definisjon.value
          : this.definisjon,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      description: data.description.present
          ? data.description.value
          : this.description,
      lkmData: data.lkmData.present ? data.lkmData.value : this.lkmData,
      scale: data.scale.present ? data.scale.value : this.scale,
      containsTypes: data.containsTypes.present
          ? data.containsTypes.value
          : this.containsTypes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NinType(')
          ..write('id: $id, ')
          ..write('navn: $navn, ')
          ..write('kategori: $kategori, ')
          ..write('parentId: $parentId, ')
          ..write('ecosystnivaaNavn: $ecosystnivaaNavn, ')
          ..write('typekategoriNavn: $typekategoriNavn, ')
          ..write('langkode: $langkode, ')
          ..write('definisjon: $definisjon, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('lkmData: $lkmData, ')
          ..write('scale: $scale, ')
          ..write('containsTypes: $containsTypes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    navn,
    kategori,
    parentId,
    ecosystnivaaNavn,
    typekategoriNavn,
    langkode,
    definisjon,
    imageUrl,
    description,
    lkmData,
    scale,
    containsTypes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NinType &&
          other.id == this.id &&
          other.navn == this.navn &&
          other.kategori == this.kategori &&
          other.parentId == this.parentId &&
          other.ecosystnivaaNavn == this.ecosystnivaaNavn &&
          other.typekategoriNavn == this.typekategoriNavn &&
          other.langkode == this.langkode &&
          other.definisjon == this.definisjon &&
          other.imageUrl == this.imageUrl &&
          other.description == this.description &&
          other.lkmData == this.lkmData &&
          other.scale == this.scale &&
          other.containsTypes == this.containsTypes);
}

class NinTypesCompanion extends UpdateCompanion<NinType> {
  final Value<String> id;
  final Value<String> navn;
  final Value<String> kategori;
  final Value<String?> parentId;
  final Value<String?> ecosystnivaaNavn;
  final Value<String?> typekategoriNavn;
  final Value<String?> langkode;
  final Value<String?> definisjon;
  final Value<String?> imageUrl;
  final Value<String?> description;
  final Value<String?> lkmData;
  final Value<String?> scale;
  final Value<String?> containsTypes;
  final Value<int> rowid;
  const NinTypesCompanion({
    this.id = const Value.absent(),
    this.navn = const Value.absent(),
    this.kategori = const Value.absent(),
    this.parentId = const Value.absent(),
    this.ecosystnivaaNavn = const Value.absent(),
    this.typekategoriNavn = const Value.absent(),
    this.langkode = const Value.absent(),
    this.definisjon = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.lkmData = const Value.absent(),
    this.scale = const Value.absent(),
    this.containsTypes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NinTypesCompanion.insert({
    required String id,
    required String navn,
    required String kategori,
    this.parentId = const Value.absent(),
    this.ecosystnivaaNavn = const Value.absent(),
    this.typekategoriNavn = const Value.absent(),
    this.langkode = const Value.absent(),
    this.definisjon = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.description = const Value.absent(),
    this.lkmData = const Value.absent(),
    this.scale = const Value.absent(),
    this.containsTypes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       navn = Value(navn),
       kategori = Value(kategori);
  static Insertable<NinType> custom({
    Expression<String>? id,
    Expression<String>? navn,
    Expression<String>? kategori,
    Expression<String>? parentId,
    Expression<String>? ecosystnivaaNavn,
    Expression<String>? typekategoriNavn,
    Expression<String>? langkode,
    Expression<String>? definisjon,
    Expression<String>? imageUrl,
    Expression<String>? description,
    Expression<String>? lkmData,
    Expression<String>? scale,
    Expression<String>? containsTypes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (navn != null) 'navn': navn,
      if (kategori != null) 'kategori': kategori,
      if (parentId != null) 'parent_id': parentId,
      if (ecosystnivaaNavn != null) 'ecosystnivaa_navn': ecosystnivaaNavn,
      if (typekategoriNavn != null) 'typekategori_navn': typekategoriNavn,
      if (langkode != null) 'langkode': langkode,
      if (definisjon != null) 'definisjon': definisjon,
      if (imageUrl != null) 'image_url': imageUrl,
      if (description != null) 'description': description,
      if (lkmData != null) 'lkm_data': lkmData,
      if (scale != null) 'scale': scale,
      if (containsTypes != null) 'contains_types': containsTypes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NinTypesCompanion copyWith({
    Value<String>? id,
    Value<String>? navn,
    Value<String>? kategori,
    Value<String?>? parentId,
    Value<String?>? ecosystnivaaNavn,
    Value<String?>? typekategoriNavn,
    Value<String?>? langkode,
    Value<String?>? definisjon,
    Value<String?>? imageUrl,
    Value<String?>? description,
    Value<String?>? lkmData,
    Value<String?>? scale,
    Value<String?>? containsTypes,
    Value<int>? rowid,
  }) {
    return NinTypesCompanion(
      id: id ?? this.id,
      navn: navn ?? this.navn,
      kategori: kategori ?? this.kategori,
      parentId: parentId ?? this.parentId,
      ecosystnivaaNavn: ecosystnivaaNavn ?? this.ecosystnivaaNavn,
      typekategoriNavn: typekategoriNavn ?? this.typekategoriNavn,
      langkode: langkode ?? this.langkode,
      definisjon: definisjon ?? this.definisjon,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      lkmData: lkmData ?? this.lkmData,
      scale: scale ?? this.scale,
      containsTypes: containsTypes ?? this.containsTypes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (navn.present) {
      map['navn'] = Variable<String>(navn.value);
    }
    if (kategori.present) {
      map['kategori'] = Variable<String>(kategori.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (ecosystnivaaNavn.present) {
      map['ecosystnivaa_navn'] = Variable<String>(ecosystnivaaNavn.value);
    }
    if (typekategoriNavn.present) {
      map['typekategori_navn'] = Variable<String>(typekategoriNavn.value);
    }
    if (langkode.present) {
      map['langkode'] = Variable<String>(langkode.value);
    }
    if (definisjon.present) {
      map['definisjon'] = Variable<String>(definisjon.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (lkmData.present) {
      map['lkm_data'] = Variable<String>(lkmData.value);
    }
    if (scale.present) {
      map['scale'] = Variable<String>(scale.value);
    }
    if (containsTypes.present) {
      map['contains_types'] = Variable<String>(containsTypes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinTypesCompanion(')
          ..write('id: $id, ')
          ..write('navn: $navn, ')
          ..write('kategori: $kategori, ')
          ..write('parentId: $parentId, ')
          ..write('ecosystnivaaNavn: $ecosystnivaaNavn, ')
          ..write('typekategoriNavn: $typekategoriNavn, ')
          ..write('langkode: $langkode, ')
          ..write('definisjon: $definisjon, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('description: $description, ')
          ..write('lkmData: $lkmData, ')
          ..write('scale: $scale, ')
          ..write('containsTypes: $containsTypes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NinVariablesTable extends NinVariables
    with TableInfo<$NinVariablesTable, NinVariable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NinVariablesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _navnMeta = const VerificationMeta('navn');
  @override
  late final GeneratedColumn<String> navn = GeneratedColumn<String>(
    'navn',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kategoriMeta = const VerificationMeta(
    'kategori',
  );
  @override
  late final GeneratedColumn<String> kategori = GeneratedColumn<String>(
    'kategori',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ecosystnivaaNavnMeta = const VerificationMeta(
    'ecosystnivaaNavn',
  );
  @override
  late final GeneratedColumn<String> ecosystnivaaNavn = GeneratedColumn<String>(
    'ecosystnivaa_navn',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _variabelkategoriNavnMeta =
      const VerificationMeta('variabelkategoriNavn');
  @override
  late final GeneratedColumn<String> variabelkategoriNavn =
      GeneratedColumn<String>(
        'variabelkategori_navn',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stepsJsonMeta = const VerificationMeta(
    'stepsJson',
  );
  @override
  late final GeneratedColumn<String> stepsJson = GeneratedColumn<String>(
    'steps_json',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    navn,
    kategori,
    parentId,
    ecosystnivaaNavn,
    variabelkategoriNavn,
    description,
    stepsJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nin_variables';
  @override
  VerificationContext validateIntegrity(
    Insertable<NinVariable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('navn')) {
      context.handle(
        _navnMeta,
        navn.isAcceptableOrUnknown(data['navn']!, _navnMeta),
      );
    } else if (isInserting) {
      context.missing(_navnMeta);
    }
    if (data.containsKey('kategori')) {
      context.handle(
        _kategoriMeta,
        kategori.isAcceptableOrUnknown(data['kategori']!, _kategoriMeta),
      );
    } else if (isInserting) {
      context.missing(_kategoriMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('ecosystnivaa_navn')) {
      context.handle(
        _ecosystnivaaNavnMeta,
        ecosystnivaaNavn.isAcceptableOrUnknown(
          data['ecosystnivaa_navn']!,
          _ecosystnivaaNavnMeta,
        ),
      );
    }
    if (data.containsKey('variabelkategori_navn')) {
      context.handle(
        _variabelkategoriNavnMeta,
        variabelkategoriNavn.isAcceptableOrUnknown(
          data['variabelkategori_navn']!,
          _variabelkategoriNavnMeta,
        ),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('steps_json')) {
      context.handle(
        _stepsJsonMeta,
        stepsJson.isAcceptableOrUnknown(data['steps_json']!, _stepsJsonMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinVariable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NinVariable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      navn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}navn'],
      )!,
      kategori: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kategori'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      ),
      ecosystnivaaNavn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ecosystnivaa_navn'],
      ),
      variabelkategoriNavn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}variabelkategori_navn'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      stepsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}steps_json'],
      ),
    );
  }

  @override
  $NinVariablesTable createAlias(String alias) {
    return $NinVariablesTable(attachedDatabase, alias);
  }
}

class NinVariable extends DataClass implements Insertable<NinVariable> {
  final String id;
  final String navn;
  final String kategori;
  final String? parentId;
  final String? ecosystnivaaNavn;
  final String? variabelkategoriNavn;
  final String? description;
  final String? stepsJson;
  const NinVariable({
    required this.id,
    required this.navn,
    required this.kategori,
    this.parentId,
    this.ecosystnivaaNavn,
    this.variabelkategoriNavn,
    this.description,
    this.stepsJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['navn'] = Variable<String>(navn);
    map['kategori'] = Variable<String>(kategori);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    if (!nullToAbsent || ecosystnivaaNavn != null) {
      map['ecosystnivaa_navn'] = Variable<String>(ecosystnivaaNavn);
    }
    if (!nullToAbsent || variabelkategoriNavn != null) {
      map['variabelkategori_navn'] = Variable<String>(variabelkategoriNavn);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || stepsJson != null) {
      map['steps_json'] = Variable<String>(stepsJson);
    }
    return map;
  }

  NinVariablesCompanion toCompanion(bool nullToAbsent) {
    return NinVariablesCompanion(
      id: Value(id),
      navn: Value(navn),
      kategori: Value(kategori),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      ecosystnivaaNavn: ecosystnivaaNavn == null && nullToAbsent
          ? const Value.absent()
          : Value(ecosystnivaaNavn),
      variabelkategoriNavn: variabelkategoriNavn == null && nullToAbsent
          ? const Value.absent()
          : Value(variabelkategoriNavn),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      stepsJson: stepsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(stepsJson),
    );
  }

  factory NinVariable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NinVariable(
      id: serializer.fromJson<String>(json['id']),
      navn: serializer.fromJson<String>(json['navn']),
      kategori: serializer.fromJson<String>(json['kategori']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      ecosystnivaaNavn: serializer.fromJson<String?>(json['ecosystnivaaNavn']),
      variabelkategoriNavn: serializer.fromJson<String?>(
        json['variabelkategoriNavn'],
      ),
      description: serializer.fromJson<String?>(json['description']),
      stepsJson: serializer.fromJson<String?>(json['stepsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'navn': serializer.toJson<String>(navn),
      'kategori': serializer.toJson<String>(kategori),
      'parentId': serializer.toJson<String?>(parentId),
      'ecosystnivaaNavn': serializer.toJson<String?>(ecosystnivaaNavn),
      'variabelkategoriNavn': serializer.toJson<String?>(variabelkategoriNavn),
      'description': serializer.toJson<String?>(description),
      'stepsJson': serializer.toJson<String?>(stepsJson),
    };
  }

  NinVariable copyWith({
    String? id,
    String? navn,
    String? kategori,
    Value<String?> parentId = const Value.absent(),
    Value<String?> ecosystnivaaNavn = const Value.absent(),
    Value<String?> variabelkategoriNavn = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> stepsJson = const Value.absent(),
  }) => NinVariable(
    id: id ?? this.id,
    navn: navn ?? this.navn,
    kategori: kategori ?? this.kategori,
    parentId: parentId.present ? parentId.value : this.parentId,
    ecosystnivaaNavn: ecosystnivaaNavn.present
        ? ecosystnivaaNavn.value
        : this.ecosystnivaaNavn,
    variabelkategoriNavn: variabelkategoriNavn.present
        ? variabelkategoriNavn.value
        : this.variabelkategoriNavn,
    description: description.present ? description.value : this.description,
    stepsJson: stepsJson.present ? stepsJson.value : this.stepsJson,
  );
  NinVariable copyWithCompanion(NinVariablesCompanion data) {
    return NinVariable(
      id: data.id.present ? data.id.value : this.id,
      navn: data.navn.present ? data.navn.value : this.navn,
      kategori: data.kategori.present ? data.kategori.value : this.kategori,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      ecosystnivaaNavn: data.ecosystnivaaNavn.present
          ? data.ecosystnivaaNavn.value
          : this.ecosystnivaaNavn,
      variabelkategoriNavn: data.variabelkategoriNavn.present
          ? data.variabelkategoriNavn.value
          : this.variabelkategoriNavn,
      description: data.description.present
          ? data.description.value
          : this.description,
      stepsJson: data.stepsJson.present ? data.stepsJson.value : this.stepsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NinVariable(')
          ..write('id: $id, ')
          ..write('navn: $navn, ')
          ..write('kategori: $kategori, ')
          ..write('parentId: $parentId, ')
          ..write('ecosystnivaaNavn: $ecosystnivaaNavn, ')
          ..write('variabelkategoriNavn: $variabelkategoriNavn, ')
          ..write('description: $description, ')
          ..write('stepsJson: $stepsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    navn,
    kategori,
    parentId,
    ecosystnivaaNavn,
    variabelkategoriNavn,
    description,
    stepsJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NinVariable &&
          other.id == this.id &&
          other.navn == this.navn &&
          other.kategori == this.kategori &&
          other.parentId == this.parentId &&
          other.ecosystnivaaNavn == this.ecosystnivaaNavn &&
          other.variabelkategoriNavn == this.variabelkategoriNavn &&
          other.description == this.description &&
          other.stepsJson == this.stepsJson);
}

class NinVariablesCompanion extends UpdateCompanion<NinVariable> {
  final Value<String> id;
  final Value<String> navn;
  final Value<String> kategori;
  final Value<String?> parentId;
  final Value<String?> ecosystnivaaNavn;
  final Value<String?> variabelkategoriNavn;
  final Value<String?> description;
  final Value<String?> stepsJson;
  final Value<int> rowid;
  const NinVariablesCompanion({
    this.id = const Value.absent(),
    this.navn = const Value.absent(),
    this.kategori = const Value.absent(),
    this.parentId = const Value.absent(),
    this.ecosystnivaaNavn = const Value.absent(),
    this.variabelkategoriNavn = const Value.absent(),
    this.description = const Value.absent(),
    this.stepsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NinVariablesCompanion.insert({
    required String id,
    required String navn,
    required String kategori,
    this.parentId = const Value.absent(),
    this.ecosystnivaaNavn = const Value.absent(),
    this.variabelkategoriNavn = const Value.absent(),
    this.description = const Value.absent(),
    this.stepsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       navn = Value(navn),
       kategori = Value(kategori);
  static Insertable<NinVariable> custom({
    Expression<String>? id,
    Expression<String>? navn,
    Expression<String>? kategori,
    Expression<String>? parentId,
    Expression<String>? ecosystnivaaNavn,
    Expression<String>? variabelkategoriNavn,
    Expression<String>? description,
    Expression<String>? stepsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (navn != null) 'navn': navn,
      if (kategori != null) 'kategori': kategori,
      if (parentId != null) 'parent_id': parentId,
      if (ecosystnivaaNavn != null) 'ecosystnivaa_navn': ecosystnivaaNavn,
      if (variabelkategoriNavn != null)
        'variabelkategori_navn': variabelkategoriNavn,
      if (description != null) 'description': description,
      if (stepsJson != null) 'steps_json': stepsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NinVariablesCompanion copyWith({
    Value<String>? id,
    Value<String>? navn,
    Value<String>? kategori,
    Value<String?>? parentId,
    Value<String?>? ecosystnivaaNavn,
    Value<String?>? variabelkategoriNavn,
    Value<String?>? description,
    Value<String?>? stepsJson,
    Value<int>? rowid,
  }) {
    return NinVariablesCompanion(
      id: id ?? this.id,
      navn: navn ?? this.navn,
      kategori: kategori ?? this.kategori,
      parentId: parentId ?? this.parentId,
      ecosystnivaaNavn: ecosystnivaaNavn ?? this.ecosystnivaaNavn,
      variabelkategoriNavn: variabelkategoriNavn ?? this.variabelkategoriNavn,
      description: description ?? this.description,
      stepsJson: stepsJson ?? this.stepsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (navn.present) {
      map['navn'] = Variable<String>(navn.value);
    }
    if (kategori.present) {
      map['kategori'] = Variable<String>(kategori.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (ecosystnivaaNavn.present) {
      map['ecosystnivaa_navn'] = Variable<String>(ecosystnivaaNavn.value);
    }
    if (variabelkategoriNavn.present) {
      map['variabelkategori_navn'] = Variable<String>(
        variabelkategoriNavn.value,
      );
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (stepsJson.present) {
      map['steps_json'] = Variable<String>(stepsJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinVariablesCompanion(')
          ..write('id: $id, ')
          ..write('navn: $navn, ')
          ..write('kategori: $kategori, ')
          ..write('parentId: $parentId, ')
          ..write('ecosystnivaaNavn: $ecosystnivaaNavn, ')
          ..write('variabelkategoriNavn: $variabelkategoriNavn, ')
          ..write('description: $description, ')
          ..write('stepsJson: $stepsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NinConversionsTable extends NinConversions
    with TableInfo<$NinConversionsTable, NinConversion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NinConversionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _kodeMeta = const VerificationMeta('kode');
  @override
  late final GeneratedColumn<String> kode = GeneratedColumn<String>(
    'kode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _forrigeKodeMeta = const VerificationMeta(
    'forrigeKode',
  );
  @override
  late final GeneratedColumn<String> forrigeKode = GeneratedColumn<String>(
    'forrige_kode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _klasseNavnMeta = const VerificationMeta(
    'klasseNavn',
  );
  @override
  late final GeneratedColumn<String> klasseNavn = GeneratedColumn<String>(
    'klasse_navn',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _forrigeVersjonMeta = const VerificationMeta(
    'forrigeVersjon',
  );
  @override
  late final GeneratedColumn<String> forrigeVersjon = GeneratedColumn<String>(
    'forrige_versjon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    kode,
    forrigeKode,
    klasseNavn,
    forrigeVersjon,
    url,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nin_conversions';
  @override
  VerificationContext validateIntegrity(
    Insertable<NinConversion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('kode')) {
      context.handle(
        _kodeMeta,
        kode.isAcceptableOrUnknown(data['kode']!, _kodeMeta),
      );
    } else if (isInserting) {
      context.missing(_kodeMeta);
    }
    if (data.containsKey('forrige_kode')) {
      context.handle(
        _forrigeKodeMeta,
        forrigeKode.isAcceptableOrUnknown(
          data['forrige_kode']!,
          _forrigeKodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_forrigeKodeMeta);
    }
    if (data.containsKey('klasse_navn')) {
      context.handle(
        _klasseNavnMeta,
        klasseNavn.isAcceptableOrUnknown(data['klasse_navn']!, _klasseNavnMeta),
      );
    } else if (isInserting) {
      context.missing(_klasseNavnMeta);
    }
    if (data.containsKey('forrige_versjon')) {
      context.handle(
        _forrigeVersjonMeta,
        forrigeVersjon.isAcceptableOrUnknown(
          data['forrige_versjon']!,
          _forrigeVersjonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_forrigeVersjonMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinConversion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NinConversion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      kode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kode'],
      )!,
      forrigeKode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}forrige_kode'],
      )!,
      klasseNavn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}klasse_navn'],
      )!,
      forrigeVersjon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}forrige_versjon'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
    );
  }

  @override
  $NinConversionsTable createAlias(String alias) {
    return $NinConversionsTable(attachedDatabase, alias);
  }
}

class NinConversion extends DataClass implements Insertable<NinConversion> {
  final int id;
  final String kode;
  final String forrigeKode;
  final String klasseNavn;
  final String forrigeVersjon;
  final String? url;
  const NinConversion({
    required this.id,
    required this.kode,
    required this.forrigeKode,
    required this.klasseNavn,
    required this.forrigeVersjon,
    this.url,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['kode'] = Variable<String>(kode);
    map['forrige_kode'] = Variable<String>(forrigeKode);
    map['klasse_navn'] = Variable<String>(klasseNavn);
    map['forrige_versjon'] = Variable<String>(forrigeVersjon);
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    return map;
  }

  NinConversionsCompanion toCompanion(bool nullToAbsent) {
    return NinConversionsCompanion(
      id: Value(id),
      kode: Value(kode),
      forrigeKode: Value(forrigeKode),
      klasseNavn: Value(klasseNavn),
      forrigeVersjon: Value(forrigeVersjon),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
    );
  }

  factory NinConversion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NinConversion(
      id: serializer.fromJson<int>(json['id']),
      kode: serializer.fromJson<String>(json['kode']),
      forrigeKode: serializer.fromJson<String>(json['forrigeKode']),
      klasseNavn: serializer.fromJson<String>(json['klasseNavn']),
      forrigeVersjon: serializer.fromJson<String>(json['forrigeVersjon']),
      url: serializer.fromJson<String?>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kode': serializer.toJson<String>(kode),
      'forrigeKode': serializer.toJson<String>(forrigeKode),
      'klasseNavn': serializer.toJson<String>(klasseNavn),
      'forrigeVersjon': serializer.toJson<String>(forrigeVersjon),
      'url': serializer.toJson<String?>(url),
    };
  }

  NinConversion copyWith({
    int? id,
    String? kode,
    String? forrigeKode,
    String? klasseNavn,
    String? forrigeVersjon,
    Value<String?> url = const Value.absent(),
  }) => NinConversion(
    id: id ?? this.id,
    kode: kode ?? this.kode,
    forrigeKode: forrigeKode ?? this.forrigeKode,
    klasseNavn: klasseNavn ?? this.klasseNavn,
    forrigeVersjon: forrigeVersjon ?? this.forrigeVersjon,
    url: url.present ? url.value : this.url,
  );
  NinConversion copyWithCompanion(NinConversionsCompanion data) {
    return NinConversion(
      id: data.id.present ? data.id.value : this.id,
      kode: data.kode.present ? data.kode.value : this.kode,
      forrigeKode: data.forrigeKode.present
          ? data.forrigeKode.value
          : this.forrigeKode,
      klasseNavn: data.klasseNavn.present
          ? data.klasseNavn.value
          : this.klasseNavn,
      forrigeVersjon: data.forrigeVersjon.present
          ? data.forrigeVersjon.value
          : this.forrigeVersjon,
      url: data.url.present ? data.url.value : this.url,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NinConversion(')
          ..write('id: $id, ')
          ..write('kode: $kode, ')
          ..write('forrigeKode: $forrigeKode, ')
          ..write('klasseNavn: $klasseNavn, ')
          ..write('forrigeVersjon: $forrigeVersjon, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, kode, forrigeKode, klasseNavn, forrigeVersjon, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NinConversion &&
          other.id == this.id &&
          other.kode == this.kode &&
          other.forrigeKode == this.forrigeKode &&
          other.klasseNavn == this.klasseNavn &&
          other.forrigeVersjon == this.forrigeVersjon &&
          other.url == this.url);
}

class NinConversionsCompanion extends UpdateCompanion<NinConversion> {
  final Value<int> id;
  final Value<String> kode;
  final Value<String> forrigeKode;
  final Value<String> klasseNavn;
  final Value<String> forrigeVersjon;
  final Value<String?> url;
  const NinConversionsCompanion({
    this.id = const Value.absent(),
    this.kode = const Value.absent(),
    this.forrigeKode = const Value.absent(),
    this.klasseNavn = const Value.absent(),
    this.forrigeVersjon = const Value.absent(),
    this.url = const Value.absent(),
  });
  NinConversionsCompanion.insert({
    this.id = const Value.absent(),
    required String kode,
    required String forrigeKode,
    required String klasseNavn,
    required String forrigeVersjon,
    this.url = const Value.absent(),
  }) : kode = Value(kode),
       forrigeKode = Value(forrigeKode),
       klasseNavn = Value(klasseNavn),
       forrigeVersjon = Value(forrigeVersjon);
  static Insertable<NinConversion> custom({
    Expression<int>? id,
    Expression<String>? kode,
    Expression<String>? forrigeKode,
    Expression<String>? klasseNavn,
    Expression<String>? forrigeVersjon,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kode != null) 'kode': kode,
      if (forrigeKode != null) 'forrige_kode': forrigeKode,
      if (klasseNavn != null) 'klasse_navn': klasseNavn,
      if (forrigeVersjon != null) 'forrige_versjon': forrigeVersjon,
      if (url != null) 'url': url,
    });
  }

  NinConversionsCompanion copyWith({
    Value<int>? id,
    Value<String>? kode,
    Value<String>? forrigeKode,
    Value<String>? klasseNavn,
    Value<String>? forrigeVersjon,
    Value<String?>? url,
  }) {
    return NinConversionsCompanion(
      id: id ?? this.id,
      kode: kode ?? this.kode,
      forrigeKode: forrigeKode ?? this.forrigeKode,
      klasseNavn: klasseNavn ?? this.klasseNavn,
      forrigeVersjon: forrigeVersjon ?? this.forrigeVersjon,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (kode.present) {
      map['kode'] = Variable<String>(kode.value);
    }
    if (forrigeKode.present) {
      map['forrige_kode'] = Variable<String>(forrigeKode.value);
    }
    if (klasseNavn.present) {
      map['klasse_navn'] = Variable<String>(klasseNavn.value);
    }
    if (forrigeVersjon.present) {
      map['forrige_versjon'] = Variable<String>(forrigeVersjon.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinConversionsCompanion(')
          ..write('id: $id, ')
          ..write('kode: $kode, ')
          ..write('forrigeKode: $forrigeKode, ')
          ..write('klasseNavn: $klasseNavn, ')
          ..write('forrigeVersjon: $forrigeVersjon, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

abstract class _$NinDatabase extends GeneratedDatabase {
  _$NinDatabase(QueryExecutor e) : super(e);
  $NinDatabaseManager get managers => $NinDatabaseManager(this);
  late final $NinTypesTable ninTypes = $NinTypesTable(this);
  late final $NinVariablesTable ninVariables = $NinVariablesTable(this);
  late final $NinConversionsTable ninConversions = $NinConversionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    ninTypes,
    ninVariables,
    ninConversions,
  ];
}

typedef $$NinTypesTableCreateCompanionBuilder =
    NinTypesCompanion Function({
      required String id,
      required String navn,
      required String kategori,
      Value<String?> parentId,
      Value<String?> ecosystnivaaNavn,
      Value<String?> typekategoriNavn,
      Value<String?> langkode,
      Value<String?> definisjon,
      Value<String?> imageUrl,
      Value<String?> description,
      Value<String?> lkmData,
      Value<String?> scale,
      Value<String?> containsTypes,
      Value<int> rowid,
    });
typedef $$NinTypesTableUpdateCompanionBuilder =
    NinTypesCompanion Function({
      Value<String> id,
      Value<String> navn,
      Value<String> kategori,
      Value<String?> parentId,
      Value<String?> ecosystnivaaNavn,
      Value<String?> typekategoriNavn,
      Value<String?> langkode,
      Value<String?> definisjon,
      Value<String?> imageUrl,
      Value<String?> description,
      Value<String?> lkmData,
      Value<String?> scale,
      Value<String?> containsTypes,
      Value<int> rowid,
    });

class $$NinTypesTableFilterComposer
    extends Composer<_$NinDatabase, $NinTypesTable> {
  $$NinTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get navn => $composableBuilder(
    column: $table.navn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kategori => $composableBuilder(
    column: $table.kategori,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ecosystnivaaNavn => $composableBuilder(
    column: $table.ecosystnivaaNavn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get typekategoriNavn => $composableBuilder(
    column: $table.typekategoriNavn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get langkode => $composableBuilder(
    column: $table.langkode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get definisjon => $composableBuilder(
    column: $table.definisjon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lkmData => $composableBuilder(
    column: $table.lkmData,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scale => $composableBuilder(
    column: $table.scale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get containsTypes => $composableBuilder(
    column: $table.containsTypes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NinTypesTableOrderingComposer
    extends Composer<_$NinDatabase, $NinTypesTable> {
  $$NinTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get navn => $composableBuilder(
    column: $table.navn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kategori => $composableBuilder(
    column: $table.kategori,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ecosystnivaaNavn => $composableBuilder(
    column: $table.ecosystnivaaNavn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get typekategoriNavn => $composableBuilder(
    column: $table.typekategoriNavn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get langkode => $composableBuilder(
    column: $table.langkode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get definisjon => $composableBuilder(
    column: $table.definisjon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lkmData => $composableBuilder(
    column: $table.lkmData,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scale => $composableBuilder(
    column: $table.scale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get containsTypes => $composableBuilder(
    column: $table.containsTypes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NinTypesTableAnnotationComposer
    extends Composer<_$NinDatabase, $NinTypesTable> {
  $$NinTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get navn =>
      $composableBuilder(column: $table.navn, builder: (column) => column);

  GeneratedColumn<String> get kategori =>
      $composableBuilder(column: $table.kategori, builder: (column) => column);

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get ecosystnivaaNavn => $composableBuilder(
    column: $table.ecosystnivaaNavn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get typekategoriNavn => $composableBuilder(
    column: $table.typekategoriNavn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get langkode =>
      $composableBuilder(column: $table.langkode, builder: (column) => column);

  GeneratedColumn<String> get definisjon => $composableBuilder(
    column: $table.definisjon,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lkmData =>
      $composableBuilder(column: $table.lkmData, builder: (column) => column);

  GeneratedColumn<String> get scale =>
      $composableBuilder(column: $table.scale, builder: (column) => column);

  GeneratedColumn<String> get containsTypes => $composableBuilder(
    column: $table.containsTypes,
    builder: (column) => column,
  );
}

class $$NinTypesTableTableManager
    extends
        RootTableManager<
          _$NinDatabase,
          $NinTypesTable,
          NinType,
          $$NinTypesTableFilterComposer,
          $$NinTypesTableOrderingComposer,
          $$NinTypesTableAnnotationComposer,
          $$NinTypesTableCreateCompanionBuilder,
          $$NinTypesTableUpdateCompanionBuilder,
          (NinType, BaseReferences<_$NinDatabase, $NinTypesTable, NinType>),
          NinType,
          PrefetchHooks Function()
        > {
  $$NinTypesTableTableManager(_$NinDatabase db, $NinTypesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NinTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NinTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NinTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> navn = const Value.absent(),
                Value<String> kategori = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                Value<String?> ecosystnivaaNavn = const Value.absent(),
                Value<String?> typekategoriNavn = const Value.absent(),
                Value<String?> langkode = const Value.absent(),
                Value<String?> definisjon = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> lkmData = const Value.absent(),
                Value<String?> scale = const Value.absent(),
                Value<String?> containsTypes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NinTypesCompanion(
                id: id,
                navn: navn,
                kategori: kategori,
                parentId: parentId,
                ecosystnivaaNavn: ecosystnivaaNavn,
                typekategoriNavn: typekategoriNavn,
                langkode: langkode,
                definisjon: definisjon,
                imageUrl: imageUrl,
                description: description,
                lkmData: lkmData,
                scale: scale,
                containsTypes: containsTypes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String navn,
                required String kategori,
                Value<String?> parentId = const Value.absent(),
                Value<String?> ecosystnivaaNavn = const Value.absent(),
                Value<String?> typekategoriNavn = const Value.absent(),
                Value<String?> langkode = const Value.absent(),
                Value<String?> definisjon = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> lkmData = const Value.absent(),
                Value<String?> scale = const Value.absent(),
                Value<String?> containsTypes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NinTypesCompanion.insert(
                id: id,
                navn: navn,
                kategori: kategori,
                parentId: parentId,
                ecosystnivaaNavn: ecosystnivaaNavn,
                typekategoriNavn: typekategoriNavn,
                langkode: langkode,
                definisjon: definisjon,
                imageUrl: imageUrl,
                description: description,
                lkmData: lkmData,
                scale: scale,
                containsTypes: containsTypes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NinTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$NinDatabase,
      $NinTypesTable,
      NinType,
      $$NinTypesTableFilterComposer,
      $$NinTypesTableOrderingComposer,
      $$NinTypesTableAnnotationComposer,
      $$NinTypesTableCreateCompanionBuilder,
      $$NinTypesTableUpdateCompanionBuilder,
      (NinType, BaseReferences<_$NinDatabase, $NinTypesTable, NinType>),
      NinType,
      PrefetchHooks Function()
    >;
typedef $$NinVariablesTableCreateCompanionBuilder =
    NinVariablesCompanion Function({
      required String id,
      required String navn,
      required String kategori,
      Value<String?> parentId,
      Value<String?> ecosystnivaaNavn,
      Value<String?> variabelkategoriNavn,
      Value<String?> description,
      Value<String?> stepsJson,
      Value<int> rowid,
    });
typedef $$NinVariablesTableUpdateCompanionBuilder =
    NinVariablesCompanion Function({
      Value<String> id,
      Value<String> navn,
      Value<String> kategori,
      Value<String?> parentId,
      Value<String?> ecosystnivaaNavn,
      Value<String?> variabelkategoriNavn,
      Value<String?> description,
      Value<String?> stepsJson,
      Value<int> rowid,
    });

class $$NinVariablesTableFilterComposer
    extends Composer<_$NinDatabase, $NinVariablesTable> {
  $$NinVariablesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get navn => $composableBuilder(
    column: $table.navn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kategori => $composableBuilder(
    column: $table.kategori,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ecosystnivaaNavn => $composableBuilder(
    column: $table.ecosystnivaaNavn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get variabelkategoriNavn => $composableBuilder(
    column: $table.variabelkategoriNavn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stepsJson => $composableBuilder(
    column: $table.stepsJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NinVariablesTableOrderingComposer
    extends Composer<_$NinDatabase, $NinVariablesTable> {
  $$NinVariablesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get navn => $composableBuilder(
    column: $table.navn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kategori => $composableBuilder(
    column: $table.kategori,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ecosystnivaaNavn => $composableBuilder(
    column: $table.ecosystnivaaNavn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get variabelkategoriNavn => $composableBuilder(
    column: $table.variabelkategoriNavn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stepsJson => $composableBuilder(
    column: $table.stepsJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NinVariablesTableAnnotationComposer
    extends Composer<_$NinDatabase, $NinVariablesTable> {
  $$NinVariablesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get navn =>
      $composableBuilder(column: $table.navn, builder: (column) => column);

  GeneratedColumn<String> get kategori =>
      $composableBuilder(column: $table.kategori, builder: (column) => column);

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get ecosystnivaaNavn => $composableBuilder(
    column: $table.ecosystnivaaNavn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get variabelkategoriNavn => $composableBuilder(
    column: $table.variabelkategoriNavn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stepsJson =>
      $composableBuilder(column: $table.stepsJson, builder: (column) => column);
}

class $$NinVariablesTableTableManager
    extends
        RootTableManager<
          _$NinDatabase,
          $NinVariablesTable,
          NinVariable,
          $$NinVariablesTableFilterComposer,
          $$NinVariablesTableOrderingComposer,
          $$NinVariablesTableAnnotationComposer,
          $$NinVariablesTableCreateCompanionBuilder,
          $$NinVariablesTableUpdateCompanionBuilder,
          (
            NinVariable,
            BaseReferences<_$NinDatabase, $NinVariablesTable, NinVariable>,
          ),
          NinVariable,
          PrefetchHooks Function()
        > {
  $$NinVariablesTableTableManager(_$NinDatabase db, $NinVariablesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NinVariablesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NinVariablesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NinVariablesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> navn = const Value.absent(),
                Value<String> kategori = const Value.absent(),
                Value<String?> parentId = const Value.absent(),
                Value<String?> ecosystnivaaNavn = const Value.absent(),
                Value<String?> variabelkategoriNavn = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> stepsJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NinVariablesCompanion(
                id: id,
                navn: navn,
                kategori: kategori,
                parentId: parentId,
                ecosystnivaaNavn: ecosystnivaaNavn,
                variabelkategoriNavn: variabelkategoriNavn,
                description: description,
                stepsJson: stepsJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String navn,
                required String kategori,
                Value<String?> parentId = const Value.absent(),
                Value<String?> ecosystnivaaNavn = const Value.absent(),
                Value<String?> variabelkategoriNavn = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> stepsJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NinVariablesCompanion.insert(
                id: id,
                navn: navn,
                kategori: kategori,
                parentId: parentId,
                ecosystnivaaNavn: ecosystnivaaNavn,
                variabelkategoriNavn: variabelkategoriNavn,
                description: description,
                stepsJson: stepsJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NinVariablesTableProcessedTableManager =
    ProcessedTableManager<
      _$NinDatabase,
      $NinVariablesTable,
      NinVariable,
      $$NinVariablesTableFilterComposer,
      $$NinVariablesTableOrderingComposer,
      $$NinVariablesTableAnnotationComposer,
      $$NinVariablesTableCreateCompanionBuilder,
      $$NinVariablesTableUpdateCompanionBuilder,
      (
        NinVariable,
        BaseReferences<_$NinDatabase, $NinVariablesTable, NinVariable>,
      ),
      NinVariable,
      PrefetchHooks Function()
    >;
typedef $$NinConversionsTableCreateCompanionBuilder =
    NinConversionsCompanion Function({
      Value<int> id,
      required String kode,
      required String forrigeKode,
      required String klasseNavn,
      required String forrigeVersjon,
      Value<String?> url,
    });
typedef $$NinConversionsTableUpdateCompanionBuilder =
    NinConversionsCompanion Function({
      Value<int> id,
      Value<String> kode,
      Value<String> forrigeKode,
      Value<String> klasseNavn,
      Value<String> forrigeVersjon,
      Value<String?> url,
    });

class $$NinConversionsTableFilterComposer
    extends Composer<_$NinDatabase, $NinConversionsTable> {
  $$NinConversionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kode => $composableBuilder(
    column: $table.kode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get forrigeKode => $composableBuilder(
    column: $table.forrigeKode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get klasseNavn => $composableBuilder(
    column: $table.klasseNavn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get forrigeVersjon => $composableBuilder(
    column: $table.forrigeVersjon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NinConversionsTableOrderingComposer
    extends Composer<_$NinDatabase, $NinConversionsTable> {
  $$NinConversionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kode => $composableBuilder(
    column: $table.kode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get forrigeKode => $composableBuilder(
    column: $table.forrigeKode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get klasseNavn => $composableBuilder(
    column: $table.klasseNavn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get forrigeVersjon => $composableBuilder(
    column: $table.forrigeVersjon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NinConversionsTableAnnotationComposer
    extends Composer<_$NinDatabase, $NinConversionsTable> {
  $$NinConversionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kode =>
      $composableBuilder(column: $table.kode, builder: (column) => column);

  GeneratedColumn<String> get forrigeKode => $composableBuilder(
    column: $table.forrigeKode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get klasseNavn => $composableBuilder(
    column: $table.klasseNavn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get forrigeVersjon => $composableBuilder(
    column: $table.forrigeVersjon,
    builder: (column) => column,
  );

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);
}

class $$NinConversionsTableTableManager
    extends
        RootTableManager<
          _$NinDatabase,
          $NinConversionsTable,
          NinConversion,
          $$NinConversionsTableFilterComposer,
          $$NinConversionsTableOrderingComposer,
          $$NinConversionsTableAnnotationComposer,
          $$NinConversionsTableCreateCompanionBuilder,
          $$NinConversionsTableUpdateCompanionBuilder,
          (
            NinConversion,
            BaseReferences<_$NinDatabase, $NinConversionsTable, NinConversion>,
          ),
          NinConversion,
          PrefetchHooks Function()
        > {
  $$NinConversionsTableTableManager(
    _$NinDatabase db,
    $NinConversionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NinConversionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NinConversionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NinConversionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> kode = const Value.absent(),
                Value<String> forrigeKode = const Value.absent(),
                Value<String> klasseNavn = const Value.absent(),
                Value<String> forrigeVersjon = const Value.absent(),
                Value<String?> url = const Value.absent(),
              }) => NinConversionsCompanion(
                id: id,
                kode: kode,
                forrigeKode: forrigeKode,
                klasseNavn: klasseNavn,
                forrigeVersjon: forrigeVersjon,
                url: url,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String kode,
                required String forrigeKode,
                required String klasseNavn,
                required String forrigeVersjon,
                Value<String?> url = const Value.absent(),
              }) => NinConversionsCompanion.insert(
                id: id,
                kode: kode,
                forrigeKode: forrigeKode,
                klasseNavn: klasseNavn,
                forrigeVersjon: forrigeVersjon,
                url: url,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NinConversionsTableProcessedTableManager =
    ProcessedTableManager<
      _$NinDatabase,
      $NinConversionsTable,
      NinConversion,
      $$NinConversionsTableFilterComposer,
      $$NinConversionsTableOrderingComposer,
      $$NinConversionsTableAnnotationComposer,
      $$NinConversionsTableCreateCompanionBuilder,
      $$NinConversionsTableUpdateCompanionBuilder,
      (
        NinConversion,
        BaseReferences<_$NinDatabase, $NinConversionsTable, NinConversion>,
      ),
      NinConversion,
      PrefetchHooks Function()
    >;

class $NinDatabaseManager {
  final _$NinDatabase _db;
  $NinDatabaseManager(this._db);
  $$NinTypesTableTableManager get ninTypes =>
      $$NinTypesTableTableManager(_db, _db.ninTypes);
  $$NinVariablesTableTableManager get ninVariables =>
      $$NinVariablesTableTableManager(_db, _db.ninVariables);
  $$NinConversionsTableTableManager get ninConversions =>
      $$NinConversionsTableTableManager(_db, _db.ninConversions);
}
