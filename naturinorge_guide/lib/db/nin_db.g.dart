// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nin_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class NinLanguageData extends DataClass implements Insertable<NinLanguageData> {
  final String id;
  final String name;
  NinLanguageData({@required this.id, this.name});
  factory NinLanguageData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinLanguageData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  NinLanguageCompanion toCompanion(bool nullToAbsent) {
    return NinLanguageCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory NinLanguageData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinLanguageData(
      id: serializer.fromJson<String>(json['_id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  NinLanguageData copyWith({String id, String name}) => NinLanguageData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('NinLanguageData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinLanguageData &&
          other.id == this.id &&
          other.name == this.name);
}

class NinLanguageCompanion extends UpdateCompanion<NinLanguageData> {
  final Value<String> id;
  final Value<String> name;
  const NinLanguageCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  NinLanguageCompanion.insert({
    @required String id,
    this.name = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinLanguageData> custom({
    Expression<String> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (name != null) 'name': name,
    });
  }

  NinLanguageCompanion copyWith({Value<String> id, Value<String> name}) {
    return NinLanguageCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinLanguageCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class NinLanguage extends Table with TableInfo<NinLanguage, NinLanguageData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinLanguage(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  NinLanguage get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_Language';
  @override
  final String actualTableName = 'nin_Language';
  @override
  VerificationContext validateIntegrity(Insertable<NinLanguageData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinLanguageData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinLanguageData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinLanguage createAlias(String alias) {
    return NinLanguage(_db, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY (_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class NinMappingScaleData extends DataClass
    implements Insertable<NinMappingScaleData> {
  final int id;
  final String name;
  NinMappingScaleData({@required this.id, this.name});
  factory NinMappingScaleData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinMappingScaleData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  NinMappingScaleCompanion toCompanion(bool nullToAbsent) {
    return NinMappingScaleCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory NinMappingScaleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMappingScaleData(
      id: serializer.fromJson<int>(json['_id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  NinMappingScaleData copyWith({int id, String name}) => NinMappingScaleData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('NinMappingScaleData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMappingScaleData &&
          other.id == this.id &&
          other.name == this.name);
}

class NinMappingScaleCompanion extends UpdateCompanion<NinMappingScaleData> {
  final Value<int> id;
  final Value<String> name;
  const NinMappingScaleCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  NinMappingScaleCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<NinMappingScaleData> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (name != null) 'name': name,
    });
  }

  NinMappingScaleCompanion copyWith({Value<int> id, Value<String> name}) {
    return NinMappingScaleCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinMappingScaleCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class NinMappingScale extends Table
    with TableInfo<NinMappingScale, NinMappingScaleData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinMappingScale(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  NinMappingScale get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_MappingScale';
  @override
  final String actualTableName = 'nin_MappingScale';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinMappingScaleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinMappingScaleData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinMappingScaleData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinMappingScale createAlias(String alias) {
    return NinMappingScale(_db, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY (_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class NinGadScaleData extends DataClass implements Insertable<NinGadScaleData> {
  final int m7Scale;
  final int m3Scale;
  final String constancy;
  NinGadScaleData({@required this.m7Scale, this.m3Scale, this.constancy});
  factory NinGadScaleData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinGadScaleData(
      m7Scale:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}m7Scale']),
      m3Scale:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}m3Scale']),
      constancy: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}Constancy']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || m7Scale != null) {
      map['m7Scale'] = Variable<int>(m7Scale);
    }
    if (!nullToAbsent || m3Scale != null) {
      map['m3Scale'] = Variable<int>(m3Scale);
    }
    if (!nullToAbsent || constancy != null) {
      map['Constancy'] = Variable<String>(constancy);
    }
    return map;
  }

  NinGadScaleCompanion toCompanion(bool nullToAbsent) {
    return NinGadScaleCompanion(
      m7Scale: m7Scale == null && nullToAbsent
          ? const Value.absent()
          : Value(m7Scale),
      m3Scale: m3Scale == null && nullToAbsent
          ? const Value.absent()
          : Value(m3Scale),
      constancy: constancy == null && nullToAbsent
          ? const Value.absent()
          : Value(constancy),
    );
  }

  factory NinGadScaleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinGadScaleData(
      m7Scale: serializer.fromJson<int>(json['m7Scale']),
      m3Scale: serializer.fromJson<int>(json['m3Scale']),
      constancy: serializer.fromJson<String>(json['Constancy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'm7Scale': serializer.toJson<int>(m7Scale),
      'm3Scale': serializer.toJson<int>(m3Scale),
      'Constancy': serializer.toJson<String>(constancy),
    };
  }

  NinGadScaleData copyWith({int m7Scale, int m3Scale, String constancy}) =>
      NinGadScaleData(
        m7Scale: m7Scale ?? this.m7Scale,
        m3Scale: m3Scale ?? this.m3Scale,
        constancy: constancy ?? this.constancy,
      );
  @override
  String toString() {
    return (StringBuffer('NinGadScaleData(')
          ..write('m7Scale: $m7Scale, ')
          ..write('m3Scale: $m3Scale, ')
          ..write('constancy: $constancy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(m7Scale.hashCode, $mrjc(m3Scale.hashCode, constancy.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinGadScaleData &&
          other.m7Scale == this.m7Scale &&
          other.m3Scale == this.m3Scale &&
          other.constancy == this.constancy);
}

class NinGadScaleCompanion extends UpdateCompanion<NinGadScaleData> {
  final Value<int> m7Scale;
  final Value<int> m3Scale;
  final Value<String> constancy;
  const NinGadScaleCompanion({
    this.m7Scale = const Value.absent(),
    this.m3Scale = const Value.absent(),
    this.constancy = const Value.absent(),
  });
  NinGadScaleCompanion.insert({
    this.m7Scale = const Value.absent(),
    this.m3Scale = const Value.absent(),
    this.constancy = const Value.absent(),
  });
  static Insertable<NinGadScaleData> custom({
    Expression<int> m7Scale,
    Expression<int> m3Scale,
    Expression<String> constancy,
  }) {
    return RawValuesInsertable({
      if (m7Scale != null) 'm7Scale': m7Scale,
      if (m3Scale != null) 'm3Scale': m3Scale,
      if (constancy != null) 'Constancy': constancy,
    });
  }

  NinGadScaleCompanion copyWith(
      {Value<int> m7Scale, Value<int> m3Scale, Value<String> constancy}) {
    return NinGadScaleCompanion(
      m7Scale: m7Scale ?? this.m7Scale,
      m3Scale: m3Scale ?? this.m3Scale,
      constancy: constancy ?? this.constancy,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (m7Scale.present) {
      map['m7Scale'] = Variable<int>(m7Scale.value);
    }
    if (m3Scale.present) {
      map['m3Scale'] = Variable<int>(m3Scale.value);
    }
    if (constancy.present) {
      map['Constancy'] = Variable<String>(constancy.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinGadScaleCompanion(')
          ..write('m7Scale: $m7Scale, ')
          ..write('m3Scale: $m3Scale, ')
          ..write('constancy: $constancy')
          ..write(')'))
        .toString();
  }
}

class NinGadScale extends Table with TableInfo<NinGadScale, NinGadScaleData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinGadScale(this._db, [this._alias]);
  final VerificationMeta _m7ScaleMeta = const VerificationMeta('m7Scale');
  GeneratedIntColumn _m7Scale;
  GeneratedIntColumn get m7Scale => _m7Scale ??= _constructM7Scale();
  GeneratedIntColumn _constructM7Scale() {
    return GeneratedIntColumn('m7Scale', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _m3ScaleMeta = const VerificationMeta('m3Scale');
  GeneratedIntColumn _m3Scale;
  GeneratedIntColumn get m3Scale => _m3Scale ??= _constructM3Scale();
  GeneratedIntColumn _constructM3Scale() {
    return GeneratedIntColumn('m3Scale', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _constancyMeta = const VerificationMeta('constancy');
  GeneratedTextColumn _constancy;
  GeneratedTextColumn get constancy => _constancy ??= _constructConstancy();
  GeneratedTextColumn _constructConstancy() {
    return GeneratedTextColumn('Constancy', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [m7Scale, m3Scale, constancy];
  @override
  NinGadScale get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_GadScale';
  @override
  final String actualTableName = 'nin_GadScale';
  @override
  VerificationContext validateIntegrity(Insertable<NinGadScaleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('m7Scale')) {
      context.handle(_m7ScaleMeta,
          m7Scale.isAcceptableOrUnknown(data['m7Scale'], _m7ScaleMeta));
    }
    if (data.containsKey('m3Scale')) {
      context.handle(_m3ScaleMeta,
          m3Scale.isAcceptableOrUnknown(data['m3Scale'], _m3ScaleMeta));
    }
    if (data.containsKey('Constancy')) {
      context.handle(_constancyMeta,
          constancy.isAcceptableOrUnknown(data['Constancy'], _constancyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {m7Scale};
  @override
  NinGadScaleData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinGadScaleData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinGadScale createAlias(String alias) {
    return NinGadScale(_db, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY ("m7Scale")'];
  @override
  bool get dontWriteConstraints => true;
}

class NinSpecie extends DataClass implements Insertable<NinSpecie> {
  final int scientificNameId;
  final String scientificName;
  final String author;
  final String vernacularName;
  NinSpecie(
      {@required this.scientificNameId,
      this.scientificName,
      this.author,
      this.vernacularName});
  factory NinSpecie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinSpecie(
      scientificNameId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}scientificNameId']),
      scientificName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}scientificName']),
      author:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}author']),
      vernacularName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}vernacularName']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || scientificNameId != null) {
      map['scientificNameId'] = Variable<int>(scientificNameId);
    }
    if (!nullToAbsent || scientificName != null) {
      map['scientificName'] = Variable<String>(scientificName);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || vernacularName != null) {
      map['vernacularName'] = Variable<String>(vernacularName);
    }
    return map;
  }

  NinSpeciesCompanion toCompanion(bool nullToAbsent) {
    return NinSpeciesCompanion(
      scientificNameId: scientificNameId == null && nullToAbsent
          ? const Value.absent()
          : Value(scientificNameId),
      scientificName: scientificName == null && nullToAbsent
          ? const Value.absent()
          : Value(scientificName),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      vernacularName: vernacularName == null && nullToAbsent
          ? const Value.absent()
          : Value(vernacularName),
    );
  }

  factory NinSpecie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinSpecie(
      scientificNameId: serializer.fromJson<int>(json['scientificNameId']),
      scientificName: serializer.fromJson<String>(json['scientificName']),
      author: serializer.fromJson<String>(json['author']),
      vernacularName: serializer.fromJson<String>(json['vernacularName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'scientificNameId': serializer.toJson<int>(scientificNameId),
      'scientificName': serializer.toJson<String>(scientificName),
      'author': serializer.toJson<String>(author),
      'vernacularName': serializer.toJson<String>(vernacularName),
    };
  }

  NinSpecie copyWith(
          {int scientificNameId,
          String scientificName,
          String author,
          String vernacularName}) =>
      NinSpecie(
        scientificNameId: scientificNameId ?? this.scientificNameId,
        scientificName: scientificName ?? this.scientificName,
        author: author ?? this.author,
        vernacularName: vernacularName ?? this.vernacularName,
      );
  @override
  String toString() {
    return (StringBuffer('NinSpecie(')
          ..write('scientificNameId: $scientificNameId, ')
          ..write('scientificName: $scientificName, ')
          ..write('author: $author, ')
          ..write('vernacularName: $vernacularName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      scientificNameId.hashCode,
      $mrjc(scientificName.hashCode,
          $mrjc(author.hashCode, vernacularName.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinSpecie &&
          other.scientificNameId == this.scientificNameId &&
          other.scientificName == this.scientificName &&
          other.author == this.author &&
          other.vernacularName == this.vernacularName);
}

class NinSpeciesCompanion extends UpdateCompanion<NinSpecie> {
  final Value<int> scientificNameId;
  final Value<String> scientificName;
  final Value<String> author;
  final Value<String> vernacularName;
  const NinSpeciesCompanion({
    this.scientificNameId = const Value.absent(),
    this.scientificName = const Value.absent(),
    this.author = const Value.absent(),
    this.vernacularName = const Value.absent(),
  });
  NinSpeciesCompanion.insert({
    this.scientificNameId = const Value.absent(),
    this.scientificName = const Value.absent(),
    this.author = const Value.absent(),
    this.vernacularName = const Value.absent(),
  });
  static Insertable<NinSpecie> custom({
    Expression<int> scientificNameId,
    Expression<String> scientificName,
    Expression<String> author,
    Expression<String> vernacularName,
  }) {
    return RawValuesInsertable({
      if (scientificNameId != null) 'scientificNameId': scientificNameId,
      if (scientificName != null) 'scientificName': scientificName,
      if (author != null) 'author': author,
      if (vernacularName != null) 'vernacularName': vernacularName,
    });
  }

  NinSpeciesCompanion copyWith(
      {Value<int> scientificNameId,
      Value<String> scientificName,
      Value<String> author,
      Value<String> vernacularName}) {
    return NinSpeciesCompanion(
      scientificNameId: scientificNameId ?? this.scientificNameId,
      scientificName: scientificName ?? this.scientificName,
      author: author ?? this.author,
      vernacularName: vernacularName ?? this.vernacularName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (scientificNameId.present) {
      map['scientificNameId'] = Variable<int>(scientificNameId.value);
    }
    if (scientificName.present) {
      map['scientificName'] = Variable<String>(scientificName.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (vernacularName.present) {
      map['vernacularName'] = Variable<String>(vernacularName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinSpeciesCompanion(')
          ..write('scientificNameId: $scientificNameId, ')
          ..write('scientificName: $scientificName, ')
          ..write('author: $author, ')
          ..write('vernacularName: $vernacularName')
          ..write(')'))
        .toString();
  }
}

class NinSpecies extends Table with TableInfo<NinSpecies, NinSpecie> {
  final GeneratedDatabase _db;
  final String _alias;
  NinSpecies(this._db, [this._alias]);
  final VerificationMeta _scientificNameIdMeta =
      const VerificationMeta('scientificNameId');
  GeneratedIntColumn _scientificNameId;
  GeneratedIntColumn get scientificNameId =>
      _scientificNameId ??= _constructScientificNameId();
  GeneratedIntColumn _constructScientificNameId() {
    return GeneratedIntColumn('scientificNameId', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _scientificNameMeta =
      const VerificationMeta('scientificName');
  GeneratedTextColumn _scientificName;
  GeneratedTextColumn get scientificName =>
      _scientificName ??= _constructScientificName();
  GeneratedTextColumn _constructScientificName() {
    return GeneratedTextColumn('scientificName', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _authorMeta = const VerificationMeta('author');
  GeneratedTextColumn _author;
  GeneratedTextColumn get author => _author ??= _constructAuthor();
  GeneratedTextColumn _constructAuthor() {
    return GeneratedTextColumn('author', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _vernacularNameMeta =
      const VerificationMeta('vernacularName');
  GeneratedTextColumn _vernacularName;
  GeneratedTextColumn get vernacularName =>
      _vernacularName ??= _constructVernacularName();
  GeneratedTextColumn _constructVernacularName() {
    return GeneratedTextColumn('vernacularName', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [scientificNameId, scientificName, author, vernacularName];
  @override
  NinSpecies get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_Species';
  @override
  final String actualTableName = 'nin_Species';
  @override
  VerificationContext validateIntegrity(Insertable<NinSpecie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('scientificNameId')) {
      context.handle(
          _scientificNameIdMeta,
          scientificNameId.isAcceptableOrUnknown(
              data['scientificNameId'], _scientificNameIdMeta));
    }
    if (data.containsKey('scientificName')) {
      context.handle(
          _scientificNameMeta,
          scientificName.isAcceptableOrUnknown(
              data['scientificName'], _scientificNameMeta));
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author'], _authorMeta));
    }
    if (data.containsKey('vernacularName')) {
      context.handle(
          _vernacularNameMeta,
          vernacularName.isAcceptableOrUnknown(
              data['vernacularName'], _vernacularNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {scientificNameId};
  @override
  NinSpecie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinSpecie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinSpecies createAlias(String alias) {
    return NinSpecies(_db, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['PRIMARY KEY ("scientificNameId")'];
  @override
  bool get dontWriteConstraints => true;
}

class NinDetailData extends DataClass implements Insertable<NinDetailData> {
  final String id;
  final String languageId;
  final String key;
  final String value;
  NinDetailData(
      {@required this.id,
      @required this.languageId,
      @required this.key,
      this.value});
  factory NinDetailData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinDetailData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      languageId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}language_id']),
      key: stringType.mapFromDatabaseResponse(data['${effectivePrefix}key']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || languageId != null) {
      map['language_id'] = Variable<String>(languageId);
    }
    if (!nullToAbsent || key != null) {
      map['key'] = Variable<String>(key);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  NinDetailCompanion toCompanion(bool nullToAbsent) {
    return NinDetailCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      languageId: languageId == null && nullToAbsent
          ? const Value.absent()
          : Value(languageId),
      key: key == null && nullToAbsent ? const Value.absent() : Value(key),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory NinDetailData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinDetailData(
      id: serializer.fromJson<String>(json['_id']),
      languageId: serializer.fromJson<String>(json['language_id']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'language_id': serializer.toJson<String>(languageId),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  NinDetailData copyWith(
          {String id, String languageId, String key, String value}) =>
      NinDetailData(
        id: id ?? this.id,
        languageId: languageId ?? this.languageId,
        key: key ?? this.key,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('NinDetailData(')
          ..write('id: $id, ')
          ..write('languageId: $languageId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(languageId.hashCode, $mrjc(key.hashCode, value.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinDetailData &&
          other.id == this.id &&
          other.languageId == this.languageId &&
          other.key == this.key &&
          other.value == this.value);
}

class NinDetailCompanion extends UpdateCompanion<NinDetailData> {
  final Value<String> id;
  final Value<String> languageId;
  final Value<String> key;
  final Value<String> value;
  const NinDetailCompanion({
    this.id = const Value.absent(),
    this.languageId = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
  });
  NinDetailCompanion.insert({
    @required String id,
    @required String languageId,
    @required String key,
    this.value = const Value.absent(),
  })  : id = Value(id),
        languageId = Value(languageId),
        key = Value(key);
  static Insertable<NinDetailData> custom({
    Expression<String> id,
    Expression<String> languageId,
    Expression<String> key,
    Expression<String> value,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (languageId != null) 'language_id': languageId,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    });
  }

  NinDetailCompanion copyWith(
      {Value<String> id,
      Value<String> languageId,
      Value<String> key,
      Value<String> value}) {
    return NinDetailCompanion(
      id: id ?? this.id,
      languageId: languageId ?? this.languageId,
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (languageId.present) {
      map['language_id'] = Variable<String>(languageId.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinDetailCompanion(')
          ..write('id: $id, ')
          ..write('languageId: $languageId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class NinDetail extends Table with TableInfo<NinDetail, NinDetailData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinDetail(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _languageIdMeta = const VerificationMeta('languageId');
  GeneratedTextColumn _languageId;
  GeneratedTextColumn get languageId => _languageId ??= _constructLanguageId();
  GeneratedTextColumn _constructLanguageId() {
    return GeneratedTextColumn('language_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _keyMeta = const VerificationMeta('key');
  GeneratedTextColumn _key;
  GeneratedTextColumn get key => _key ??= _constructKey();
  GeneratedTextColumn _constructKey() {
    return GeneratedTextColumn('key', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedTextColumn _value;
  GeneratedTextColumn get value => _value ??= _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn('value', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, languageId, key, value];
  @override
  NinDetail get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_Detail';
  @override
  final String actualTableName = 'nin_Detail';
  @override
  VerificationContext validateIntegrity(Insertable<NinDetailData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('language_id')) {
      context.handle(
          _languageIdMeta,
          languageId.isAcceptableOrUnknown(
              data['language_id'], _languageIdMeta));
    } else if (isInserting) {
      context.missing(_languageIdMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key'], _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, languageId, key};
  @override
  NinDetailData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinDetailData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinDetail createAlias(String alias) {
    return NinDetail(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id, language_id, "key")',
        'FOREIGN KEY(language_id) REFERENCES "nin_Language" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMajorTypeGroupData extends DataClass
    implements Insertable<NinMajorTypeGroupData> {
  final String id;
  final String detailId;
  NinMajorTypeGroupData({@required this.id, this.detailId});
  factory NinMajorTypeGroupData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinMajorTypeGroupData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || detailId != null) {
      map['detail_id'] = Variable<String>(detailId);
    }
    return map;
  }

  NinMajorTypeGroupCompanion toCompanion(bool nullToAbsent) {
    return NinMajorTypeGroupCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      detailId: detailId == null && nullToAbsent
          ? const Value.absent()
          : Value(detailId),
    );
  }

  factory NinMajorTypeGroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMajorTypeGroupData(
      id: serializer.fromJson<String>(json['_id']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinMajorTypeGroupData copyWith({String id, String detailId}) =>
      NinMajorTypeGroupData(
        id: id ?? this.id,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinMajorTypeGroupData(')
          ..write('id: $id, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, detailId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMajorTypeGroupData &&
          other.id == this.id &&
          other.detailId == this.detailId);
}

class NinMajorTypeGroupCompanion
    extends UpdateCompanion<NinMajorTypeGroupData> {
  final Value<String> id;
  final Value<String> detailId;
  const NinMajorTypeGroupCompanion({
    this.id = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinMajorTypeGroupCompanion.insert({
    @required String id,
    this.detailId = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinMajorTypeGroupData> custom({
    Expression<String> id,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinMajorTypeGroupCompanion copyWith(
      {Value<String> id, Value<String> detailId}) {
    return NinMajorTypeGroupCompanion(
      id: id ?? this.id,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (detailId.present) {
      map['detail_id'] = Variable<String>(detailId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinMajorTypeGroupCompanion(')
          ..write('id: $id, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }
}

class NinMajorTypeGroup extends Table
    with TableInfo<NinMajorTypeGroup, NinMajorTypeGroupData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinMajorTypeGroup(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, detailId];
  @override
  NinMajorTypeGroup get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_MajorTypeGroup';
  @override
  final String actualTableName = 'nin_MajorTypeGroup';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinMajorTypeGroupData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinMajorTypeGroupData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinMajorTypeGroupData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinMajorTypeGroup createAlias(String alias) {
    return NinMajorTypeGroup(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinStructuringProces extends DataClass
    implements Insertable<NinStructuringProces> {
  final String id;
  final String detailId;
  NinStructuringProces({@required this.id, this.detailId});
  factory NinStructuringProces.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinStructuringProces(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || detailId != null) {
      map['detail_id'] = Variable<String>(detailId);
    }
    return map;
  }

  NinStructuringProcessCompanion toCompanion(bool nullToAbsent) {
    return NinStructuringProcessCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      detailId: detailId == null && nullToAbsent
          ? const Value.absent()
          : Value(detailId),
    );
  }

  factory NinStructuringProces.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinStructuringProces(
      id: serializer.fromJson<String>(json['_id']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinStructuringProces copyWith({String id, String detailId}) =>
      NinStructuringProces(
        id: id ?? this.id,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinStructuringProces(')
          ..write('id: $id, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, detailId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinStructuringProces &&
          other.id == this.id &&
          other.detailId == this.detailId);
}

class NinStructuringProcessCompanion
    extends UpdateCompanion<NinStructuringProces> {
  final Value<String> id;
  final Value<String> detailId;
  const NinStructuringProcessCompanion({
    this.id = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinStructuringProcessCompanion.insert({
    @required String id,
    this.detailId = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinStructuringProces> custom({
    Expression<String> id,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinStructuringProcessCompanion copyWith(
      {Value<String> id, Value<String> detailId}) {
    return NinStructuringProcessCompanion(
      id: id ?? this.id,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (detailId.present) {
      map['detail_id'] = Variable<String>(detailId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinStructuringProcessCompanion(')
          ..write('id: $id, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }
}

class NinStructuringProcess extends Table
    with TableInfo<NinStructuringProcess, NinStructuringProces> {
  final GeneratedDatabase _db;
  final String _alias;
  NinStructuringProcess(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, detailId];
  @override
  NinStructuringProcess get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_StructuringProcess';
  @override
  final String actualTableName = 'nin_StructuringProcess';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinStructuringProces> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinStructuringProces map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinStructuringProces.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinStructuringProcess createAlias(String alias) {
    return NinStructuringProcess(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinPatternOfVariationData extends DataClass
    implements Insertable<NinPatternOfVariationData> {
  final String id;
  final String detailId;
  NinPatternOfVariationData({@required this.id, this.detailId});
  factory NinPatternOfVariationData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinPatternOfVariationData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || detailId != null) {
      map['detail_id'] = Variable<String>(detailId);
    }
    return map;
  }

  NinPatternOfVariationCompanion toCompanion(bool nullToAbsent) {
    return NinPatternOfVariationCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      detailId: detailId == null && nullToAbsent
          ? const Value.absent()
          : Value(detailId),
    );
  }

  factory NinPatternOfVariationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinPatternOfVariationData(
      id: serializer.fromJson<String>(json['_id']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinPatternOfVariationData copyWith({String id, String detailId}) =>
      NinPatternOfVariationData(
        id: id ?? this.id,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinPatternOfVariationData(')
          ..write('id: $id, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, detailId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinPatternOfVariationData &&
          other.id == this.id &&
          other.detailId == this.detailId);
}

class NinPatternOfVariationCompanion
    extends UpdateCompanion<NinPatternOfVariationData> {
  final Value<String> id;
  final Value<String> detailId;
  const NinPatternOfVariationCompanion({
    this.id = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinPatternOfVariationCompanion.insert({
    @required String id,
    this.detailId = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinPatternOfVariationData> custom({
    Expression<String> id,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinPatternOfVariationCompanion copyWith(
      {Value<String> id, Value<String> detailId}) {
    return NinPatternOfVariationCompanion(
      id: id ?? this.id,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (detailId.present) {
      map['detail_id'] = Variable<String>(detailId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinPatternOfVariationCompanion(')
          ..write('id: $id, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }
}

class NinPatternOfVariation extends Table
    with TableInfo<NinPatternOfVariation, NinPatternOfVariationData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinPatternOfVariation(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, detailId];
  @override
  NinPatternOfVariation get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_PatternOfVariation';
  @override
  final String actualTableName = 'nin_PatternOfVariation';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinPatternOfVariationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinPatternOfVariationData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinPatternOfVariationData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  NinPatternOfVariation createAlias(String alias) {
    return NinPatternOfVariation(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinLECTypeData extends DataClass implements Insertable<NinLECTypeData> {
  final String id;
  final String detailId;
  NinLECTypeData({@required this.id, this.detailId});
  factory NinLECTypeData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinLECTypeData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || detailId != null) {
      map['detail_id'] = Variable<String>(detailId);
    }
    return map;
  }

  NinLECTypeCompanion toCompanion(bool nullToAbsent) {
    return NinLECTypeCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      detailId: detailId == null && nullToAbsent
          ? const Value.absent()
          : Value(detailId),
    );
  }

  factory NinLECTypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinLECTypeData(
      id: serializer.fromJson<String>(json['_id']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinLECTypeData copyWith({String id, String detailId}) => NinLECTypeData(
        id: id ?? this.id,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinLECTypeData(')
          ..write('id: $id, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, detailId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinLECTypeData &&
          other.id == this.id &&
          other.detailId == this.detailId);
}

class NinLECTypeCompanion extends UpdateCompanion<NinLECTypeData> {
  final Value<String> id;
  final Value<String> detailId;
  const NinLECTypeCompanion({
    this.id = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinLECTypeCompanion.insert({
    @required String id,
    this.detailId = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinLECTypeData> custom({
    Expression<String> id,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinLECTypeCompanion copyWith({Value<String> id, Value<String> detailId}) {
    return NinLECTypeCompanion(
      id: id ?? this.id,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (detailId.present) {
      map['detail_id'] = Variable<String>(detailId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinLECTypeCompanion(')
          ..write('id: $id, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }
}

class NinLECType extends Table with TableInfo<NinLECType, NinLECTypeData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinLECType(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, detailId];
  @override
  NinLECType get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_LECType';
  @override
  final String actualTableName = 'nin_LECType';
  @override
  VerificationContext validateIntegrity(Insertable<NinLECTypeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinLECTypeData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinLECTypeData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinLECType createAlias(String alias) {
    return NinLECType(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMajorTypeData extends DataClass
    implements Insertable<NinMajorTypeData> {
  final String id;
  final String majorTypeGroupId;
  final int order;
  final String detailId;
  NinMajorTypeData(
      {@required this.id, this.majorTypeGroupId, this.order, this.detailId});
  factory NinMajorTypeData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return NinMajorTypeData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      majorTypeGroupId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorTypeGroup_id']),
      order: intType.mapFromDatabaseResponse(data['${effectivePrefix}order']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || majorTypeGroupId != null) {
      map['majorTypeGroup_id'] = Variable<String>(majorTypeGroupId);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    if (!nullToAbsent || detailId != null) {
      map['detail_id'] = Variable<String>(detailId);
    }
    return map;
  }

  NinMajorTypeCompanion toCompanion(bool nullToAbsent) {
    return NinMajorTypeCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      majorTypeGroupId: majorTypeGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeGroupId),
      order:
          order == null && nullToAbsent ? const Value.absent() : Value(order),
      detailId: detailId == null && nullToAbsent
          ? const Value.absent()
          : Value(detailId),
    );
  }

  factory NinMajorTypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMajorTypeData(
      id: serializer.fromJson<String>(json['_id']),
      majorTypeGroupId: serializer.fromJson<String>(json['majorTypeGroup_id']),
      order: serializer.fromJson<int>(json['order']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'majorTypeGroup_id': serializer.toJson<String>(majorTypeGroupId),
      'order': serializer.toJson<int>(order),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinMajorTypeData copyWith(
          {String id, String majorTypeGroupId, int order, String detailId}) =>
      NinMajorTypeData(
        id: id ?? this.id,
        majorTypeGroupId: majorTypeGroupId ?? this.majorTypeGroupId,
        order: order ?? this.order,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinMajorTypeData(')
          ..write('id: $id, ')
          ..write('majorTypeGroupId: $majorTypeGroupId, ')
          ..write('order: $order, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(majorTypeGroupId.hashCode,
          $mrjc(order.hashCode, detailId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMajorTypeData &&
          other.id == this.id &&
          other.majorTypeGroupId == this.majorTypeGroupId &&
          other.order == this.order &&
          other.detailId == this.detailId);
}

class NinMajorTypeCompanion extends UpdateCompanion<NinMajorTypeData> {
  final Value<String> id;
  final Value<String> majorTypeGroupId;
  final Value<int> order;
  final Value<String> detailId;
  const NinMajorTypeCompanion({
    this.id = const Value.absent(),
    this.majorTypeGroupId = const Value.absent(),
    this.order = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinMajorTypeCompanion.insert({
    @required String id,
    this.majorTypeGroupId = const Value.absent(),
    this.order = const Value.absent(),
    this.detailId = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinMajorTypeData> custom({
    Expression<String> id,
    Expression<String> majorTypeGroupId,
    Expression<int> order,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (majorTypeGroupId != null) 'majorTypeGroup_id': majorTypeGroupId,
      if (order != null) 'order': order,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinMajorTypeCompanion copyWith(
      {Value<String> id,
      Value<String> majorTypeGroupId,
      Value<int> order,
      Value<String> detailId}) {
    return NinMajorTypeCompanion(
      id: id ?? this.id,
      majorTypeGroupId: majorTypeGroupId ?? this.majorTypeGroupId,
      order: order ?? this.order,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (majorTypeGroupId.present) {
      map['majorTypeGroup_id'] = Variable<String>(majorTypeGroupId.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (detailId.present) {
      map['detail_id'] = Variable<String>(detailId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinMajorTypeCompanion(')
          ..write('id: $id, ')
          ..write('majorTypeGroupId: $majorTypeGroupId, ')
          ..write('order: $order, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }
}

class NinMajorType extends Table
    with TableInfo<NinMajorType, NinMajorTypeData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinMajorType(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _majorTypeGroupIdMeta =
      const VerificationMeta('majorTypeGroupId');
  GeneratedTextColumn _majorTypeGroupId;
  GeneratedTextColumn get majorTypeGroupId =>
      _majorTypeGroupId ??= _constructMajorTypeGroupId();
  GeneratedTextColumn _constructMajorTypeGroupId() {
    return GeneratedTextColumn('majorTypeGroup_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  GeneratedIntColumn _order;
  GeneratedIntColumn get order => _order ??= _constructOrder();
  GeneratedIntColumn _constructOrder() {
    return GeneratedIntColumn('order', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, majorTypeGroupId, order, detailId];
  @override
  NinMajorType get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_MajorType';
  @override
  final String actualTableName = 'nin_MajorType';
  @override
  VerificationContext validateIntegrity(Insertable<NinMajorTypeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('majorTypeGroup_id')) {
      context.handle(
          _majorTypeGroupIdMeta,
          majorTypeGroupId.isAcceptableOrUnknown(
              data['majorTypeGroup_id'], _majorTypeGroupIdMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order'], _orderMeta));
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinMajorTypeData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinMajorTypeData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinMajorType createAlias(String alias) {
    return NinMajorType(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id)',
        'FOREIGN KEY("majorTypeGroup_id") REFERENCES "nin_MajorTypeGroup" (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinLECData extends DataClass implements Insertable<NinLECData> {
  final String id;
  final String parentLecId;
  final String structuringProcessId;
  final String patternOfVariationId;
  final int knowledgeBaseRelations;
  final int knowledgeBaseDivision;
  final int spatialScale;
  final String detailId;
  NinLECData(
      {@required this.id,
      this.parentLecId,
      this.structuringProcessId,
      this.patternOfVariationId,
      this.knowledgeBaseRelations,
      this.knowledgeBaseDivision,
      this.spatialScale,
      this.detailId});
  factory NinLECData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return NinLECData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      parentLecId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}parentLec_id']),
      structuringProcessId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}structuringProcess_id']),
      patternOfVariationId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}patternOfVariation_id']),
      knowledgeBaseRelations: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}knowledgeBaseRelations']),
      knowledgeBaseDivision: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}knowledgeBaseDivision']),
      spatialScale: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}spatialScale']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || parentLecId != null) {
      map['parentLec_id'] = Variable<String>(parentLecId);
    }
    if (!nullToAbsent || structuringProcessId != null) {
      map['structuringProcess_id'] = Variable<String>(structuringProcessId);
    }
    if (!nullToAbsent || patternOfVariationId != null) {
      map['patternOfVariation_id'] = Variable<String>(patternOfVariationId);
    }
    if (!nullToAbsent || knowledgeBaseRelations != null) {
      map['knowledgeBaseRelations'] = Variable<int>(knowledgeBaseRelations);
    }
    if (!nullToAbsent || knowledgeBaseDivision != null) {
      map['knowledgeBaseDivision'] = Variable<int>(knowledgeBaseDivision);
    }
    if (!nullToAbsent || spatialScale != null) {
      map['spatialScale'] = Variable<int>(spatialScale);
    }
    if (!nullToAbsent || detailId != null) {
      map['detail_id'] = Variable<String>(detailId);
    }
    return map;
  }

  NinLECCompanion toCompanion(bool nullToAbsent) {
    return NinLECCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      parentLecId: parentLecId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentLecId),
      structuringProcessId: structuringProcessId == null && nullToAbsent
          ? const Value.absent()
          : Value(structuringProcessId),
      patternOfVariationId: patternOfVariationId == null && nullToAbsent
          ? const Value.absent()
          : Value(patternOfVariationId),
      knowledgeBaseRelations: knowledgeBaseRelations == null && nullToAbsent
          ? const Value.absent()
          : Value(knowledgeBaseRelations),
      knowledgeBaseDivision: knowledgeBaseDivision == null && nullToAbsent
          ? const Value.absent()
          : Value(knowledgeBaseDivision),
      spatialScale: spatialScale == null && nullToAbsent
          ? const Value.absent()
          : Value(spatialScale),
      detailId: detailId == null && nullToAbsent
          ? const Value.absent()
          : Value(detailId),
    );
  }

  factory NinLECData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinLECData(
      id: serializer.fromJson<String>(json['_id']),
      parentLecId: serializer.fromJson<String>(json['parentLec_id']),
      structuringProcessId:
          serializer.fromJson<String>(json['structuringProcess_id']),
      patternOfVariationId:
          serializer.fromJson<String>(json['patternOfVariation_id']),
      knowledgeBaseRelations:
          serializer.fromJson<int>(json['knowledgeBaseRelations']),
      knowledgeBaseDivision:
          serializer.fromJson<int>(json['knowledgeBaseDivision']),
      spatialScale: serializer.fromJson<int>(json['spatialScale']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'parentLec_id': serializer.toJson<String>(parentLecId),
      'structuringProcess_id': serializer.toJson<String>(structuringProcessId),
      'patternOfVariation_id': serializer.toJson<String>(patternOfVariationId),
      'knowledgeBaseRelations': serializer.toJson<int>(knowledgeBaseRelations),
      'knowledgeBaseDivision': serializer.toJson<int>(knowledgeBaseDivision),
      'spatialScale': serializer.toJson<int>(spatialScale),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinLECData copyWith(
          {String id,
          String parentLecId,
          String structuringProcessId,
          String patternOfVariationId,
          int knowledgeBaseRelations,
          int knowledgeBaseDivision,
          int spatialScale,
          String detailId}) =>
      NinLECData(
        id: id ?? this.id,
        parentLecId: parentLecId ?? this.parentLecId,
        structuringProcessId: structuringProcessId ?? this.structuringProcessId,
        patternOfVariationId: patternOfVariationId ?? this.patternOfVariationId,
        knowledgeBaseRelations:
            knowledgeBaseRelations ?? this.knowledgeBaseRelations,
        knowledgeBaseDivision:
            knowledgeBaseDivision ?? this.knowledgeBaseDivision,
        spatialScale: spatialScale ?? this.spatialScale,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinLECData(')
          ..write('id: $id, ')
          ..write('parentLecId: $parentLecId, ')
          ..write('structuringProcessId: $structuringProcessId, ')
          ..write('patternOfVariationId: $patternOfVariationId, ')
          ..write('knowledgeBaseRelations: $knowledgeBaseRelations, ')
          ..write('knowledgeBaseDivision: $knowledgeBaseDivision, ')
          ..write('spatialScale: $spatialScale, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          parentLecId.hashCode,
          $mrjc(
              structuringProcessId.hashCode,
              $mrjc(
                  patternOfVariationId.hashCode,
                  $mrjc(
                      knowledgeBaseRelations.hashCode,
                      $mrjc(
                          knowledgeBaseDivision.hashCode,
                          $mrjc(
                              spatialScale.hashCode, detailId.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinLECData &&
          other.id == this.id &&
          other.parentLecId == this.parentLecId &&
          other.structuringProcessId == this.structuringProcessId &&
          other.patternOfVariationId == this.patternOfVariationId &&
          other.knowledgeBaseRelations == this.knowledgeBaseRelations &&
          other.knowledgeBaseDivision == this.knowledgeBaseDivision &&
          other.spatialScale == this.spatialScale &&
          other.detailId == this.detailId);
}

class NinLECCompanion extends UpdateCompanion<NinLECData> {
  final Value<String> id;
  final Value<String> parentLecId;
  final Value<String> structuringProcessId;
  final Value<String> patternOfVariationId;
  final Value<int> knowledgeBaseRelations;
  final Value<int> knowledgeBaseDivision;
  final Value<int> spatialScale;
  final Value<String> detailId;
  const NinLECCompanion({
    this.id = const Value.absent(),
    this.parentLecId = const Value.absent(),
    this.structuringProcessId = const Value.absent(),
    this.patternOfVariationId = const Value.absent(),
    this.knowledgeBaseRelations = const Value.absent(),
    this.knowledgeBaseDivision = const Value.absent(),
    this.spatialScale = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinLECCompanion.insert({
    @required String id,
    this.parentLecId = const Value.absent(),
    this.structuringProcessId = const Value.absent(),
    this.patternOfVariationId = const Value.absent(),
    this.knowledgeBaseRelations = const Value.absent(),
    this.knowledgeBaseDivision = const Value.absent(),
    this.spatialScale = const Value.absent(),
    this.detailId = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinLECData> custom({
    Expression<String> id,
    Expression<String> parentLecId,
    Expression<String> structuringProcessId,
    Expression<String> patternOfVariationId,
    Expression<int> knowledgeBaseRelations,
    Expression<int> knowledgeBaseDivision,
    Expression<int> spatialScale,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (parentLecId != null) 'parentLec_id': parentLecId,
      if (structuringProcessId != null)
        'structuringProcess_id': structuringProcessId,
      if (patternOfVariationId != null)
        'patternOfVariation_id': patternOfVariationId,
      if (knowledgeBaseRelations != null)
        'knowledgeBaseRelations': knowledgeBaseRelations,
      if (knowledgeBaseDivision != null)
        'knowledgeBaseDivision': knowledgeBaseDivision,
      if (spatialScale != null) 'spatialScale': spatialScale,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinLECCompanion copyWith(
      {Value<String> id,
      Value<String> parentLecId,
      Value<String> structuringProcessId,
      Value<String> patternOfVariationId,
      Value<int> knowledgeBaseRelations,
      Value<int> knowledgeBaseDivision,
      Value<int> spatialScale,
      Value<String> detailId}) {
    return NinLECCompanion(
      id: id ?? this.id,
      parentLecId: parentLecId ?? this.parentLecId,
      structuringProcessId: structuringProcessId ?? this.structuringProcessId,
      patternOfVariationId: patternOfVariationId ?? this.patternOfVariationId,
      knowledgeBaseRelations:
          knowledgeBaseRelations ?? this.knowledgeBaseRelations,
      knowledgeBaseDivision:
          knowledgeBaseDivision ?? this.knowledgeBaseDivision,
      spatialScale: spatialScale ?? this.spatialScale,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (parentLecId.present) {
      map['parentLec_id'] = Variable<String>(parentLecId.value);
    }
    if (structuringProcessId.present) {
      map['structuringProcess_id'] =
          Variable<String>(structuringProcessId.value);
    }
    if (patternOfVariationId.present) {
      map['patternOfVariation_id'] =
          Variable<String>(patternOfVariationId.value);
    }
    if (knowledgeBaseRelations.present) {
      map['knowledgeBaseRelations'] =
          Variable<int>(knowledgeBaseRelations.value);
    }
    if (knowledgeBaseDivision.present) {
      map['knowledgeBaseDivision'] = Variable<int>(knowledgeBaseDivision.value);
    }
    if (spatialScale.present) {
      map['spatialScale'] = Variable<int>(spatialScale.value);
    }
    if (detailId.present) {
      map['detail_id'] = Variable<String>(detailId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinLECCompanion(')
          ..write('id: $id, ')
          ..write('parentLecId: $parentLecId, ')
          ..write('structuringProcessId: $structuringProcessId, ')
          ..write('patternOfVariationId: $patternOfVariationId, ')
          ..write('knowledgeBaseRelations: $knowledgeBaseRelations, ')
          ..write('knowledgeBaseDivision: $knowledgeBaseDivision, ')
          ..write('spatialScale: $spatialScale, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }
}

class NinLEC extends Table with TableInfo<NinLEC, NinLECData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinLEC(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _parentLecIdMeta =
      const VerificationMeta('parentLecId');
  GeneratedTextColumn _parentLecId;
  GeneratedTextColumn get parentLecId =>
      _parentLecId ??= _constructParentLecId();
  GeneratedTextColumn _constructParentLecId() {
    return GeneratedTextColumn('parentLec_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _structuringProcessIdMeta =
      const VerificationMeta('structuringProcessId');
  GeneratedTextColumn _structuringProcessId;
  GeneratedTextColumn get structuringProcessId =>
      _structuringProcessId ??= _constructStructuringProcessId();
  GeneratedTextColumn _constructStructuringProcessId() {
    return GeneratedTextColumn('structuringProcess_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _patternOfVariationIdMeta =
      const VerificationMeta('patternOfVariationId');
  GeneratedTextColumn _patternOfVariationId;
  GeneratedTextColumn get patternOfVariationId =>
      _patternOfVariationId ??= _constructPatternOfVariationId();
  GeneratedTextColumn _constructPatternOfVariationId() {
    return GeneratedTextColumn('patternOfVariation_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _knowledgeBaseRelationsMeta =
      const VerificationMeta('knowledgeBaseRelations');
  GeneratedIntColumn _knowledgeBaseRelations;
  GeneratedIntColumn get knowledgeBaseRelations =>
      _knowledgeBaseRelations ??= _constructKnowledgeBaseRelations();
  GeneratedIntColumn _constructKnowledgeBaseRelations() {
    return GeneratedIntColumn('knowledgeBaseRelations', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _knowledgeBaseDivisionMeta =
      const VerificationMeta('knowledgeBaseDivision');
  GeneratedIntColumn _knowledgeBaseDivision;
  GeneratedIntColumn get knowledgeBaseDivision =>
      _knowledgeBaseDivision ??= _constructKnowledgeBaseDivision();
  GeneratedIntColumn _constructKnowledgeBaseDivision() {
    return GeneratedIntColumn('knowledgeBaseDivision', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _spatialScaleMeta =
      const VerificationMeta('spatialScale');
  GeneratedIntColumn _spatialScale;
  GeneratedIntColumn get spatialScale =>
      _spatialScale ??= _constructSpatialScale();
  GeneratedIntColumn _constructSpatialScale() {
    return GeneratedIntColumn('spatialScale', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        parentLecId,
        structuringProcessId,
        patternOfVariationId,
        knowledgeBaseRelations,
        knowledgeBaseDivision,
        spatialScale,
        detailId
      ];
  @override
  NinLEC get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_LEC';
  @override
  final String actualTableName = 'nin_LEC';
  @override
  VerificationContext validateIntegrity(Insertable<NinLECData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('parentLec_id')) {
      context.handle(
          _parentLecIdMeta,
          parentLecId.isAcceptableOrUnknown(
              data['parentLec_id'], _parentLecIdMeta));
    }
    if (data.containsKey('structuringProcess_id')) {
      context.handle(
          _structuringProcessIdMeta,
          structuringProcessId.isAcceptableOrUnknown(
              data['structuringProcess_id'], _structuringProcessIdMeta));
    }
    if (data.containsKey('patternOfVariation_id')) {
      context.handle(
          _patternOfVariationIdMeta,
          patternOfVariationId.isAcceptableOrUnknown(
              data['patternOfVariation_id'], _patternOfVariationIdMeta));
    }
    if (data.containsKey('knowledgeBaseRelations')) {
      context.handle(
          _knowledgeBaseRelationsMeta,
          knowledgeBaseRelations.isAcceptableOrUnknown(
              data['knowledgeBaseRelations'], _knowledgeBaseRelationsMeta));
    }
    if (data.containsKey('knowledgeBaseDivision')) {
      context.handle(
          _knowledgeBaseDivisionMeta,
          knowledgeBaseDivision.isAcceptableOrUnknown(
              data['knowledgeBaseDivision'], _knowledgeBaseDivisionMeta));
    }
    if (data.containsKey('spatialScale')) {
      context.handle(
          _spatialScaleMeta,
          spatialScale.isAcceptableOrUnknown(
              data['spatialScale'], _spatialScaleMeta));
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinLECData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinLECData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinLEC createAlias(String alias) {
    return NinLEC(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id)',
        'FOREIGN KEY("parentLec_id") REFERENCES "nin_LEC" (_id)',
        'FOREIGN KEY("structuringProcess_id") REFERENCES "nin_StructuringProcess" (_id)',
        'FOREIGN KEY("patternOfVariation_id") REFERENCES "nin_PatternOfVariation" (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMinorTypeData extends DataClass
    implements Insertable<NinMinorTypeData> {
  final String id;
  final int order;
  final String majorTypeId;
  final String detailId;
  NinMinorTypeData(
      {@required this.id, this.order, this.majorTypeId, this.detailId});
  factory NinMinorTypeData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return NinMinorTypeData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      order: intType.mapFromDatabaseResponse(data['${effectivePrefix}order']),
      majorTypeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorType_id']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    if (!nullToAbsent || majorTypeId != null) {
      map['majorType_id'] = Variable<String>(majorTypeId);
    }
    if (!nullToAbsent || detailId != null) {
      map['detail_id'] = Variable<String>(detailId);
    }
    return map;
  }

  NinMinorTypeCompanion toCompanion(bool nullToAbsent) {
    return NinMinorTypeCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      order:
          order == null && nullToAbsent ? const Value.absent() : Value(order),
      majorTypeId: majorTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeId),
      detailId: detailId == null && nullToAbsent
          ? const Value.absent()
          : Value(detailId),
    );
  }

  factory NinMinorTypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMinorTypeData(
      id: serializer.fromJson<String>(json['_id']),
      order: serializer.fromJson<int>(json['order']),
      majorTypeId: serializer.fromJson<String>(json['majorType_id']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'order': serializer.toJson<int>(order),
      'majorType_id': serializer.toJson<String>(majorTypeId),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinMinorTypeData copyWith(
          {String id, int order, String majorTypeId, String detailId}) =>
      NinMinorTypeData(
        id: id ?? this.id,
        order: order ?? this.order,
        majorTypeId: majorTypeId ?? this.majorTypeId,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinMinorTypeData(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(order.hashCode, $mrjc(majorTypeId.hashCode, detailId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMinorTypeData &&
          other.id == this.id &&
          other.order == this.order &&
          other.majorTypeId == this.majorTypeId &&
          other.detailId == this.detailId);
}

class NinMinorTypeCompanion extends UpdateCompanion<NinMinorTypeData> {
  final Value<String> id;
  final Value<int> order;
  final Value<String> majorTypeId;
  final Value<String> detailId;
  const NinMinorTypeCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinMinorTypeCompanion.insert({
    @required String id,
    this.order = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.detailId = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinMinorTypeData> custom({
    Expression<String> id,
    Expression<int> order,
    Expression<String> majorTypeId,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (order != null) 'order': order,
      if (majorTypeId != null) 'majorType_id': majorTypeId,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinMinorTypeCompanion copyWith(
      {Value<String> id,
      Value<int> order,
      Value<String> majorTypeId,
      Value<String> detailId}) {
    return NinMinorTypeCompanion(
      id: id ?? this.id,
      order: order ?? this.order,
      majorTypeId: majorTypeId ?? this.majorTypeId,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (majorTypeId.present) {
      map['majorType_id'] = Variable<String>(majorTypeId.value);
    }
    if (detailId.present) {
      map['detail_id'] = Variable<String>(detailId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinMinorTypeCompanion(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }
}

class NinMinorType extends Table
    with TableInfo<NinMinorType, NinMinorTypeData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinMinorType(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  GeneratedIntColumn _order;
  GeneratedIntColumn get order => _order ??= _constructOrder();
  GeneratedIntColumn _constructOrder() {
    return GeneratedIntColumn('order', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _majorTypeIdMeta =
      const VerificationMeta('majorTypeId');
  GeneratedTextColumn _majorTypeId;
  GeneratedTextColumn get majorTypeId =>
      _majorTypeId ??= _constructMajorTypeId();
  GeneratedTextColumn _constructMajorTypeId() {
    return GeneratedTextColumn('majorType_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, order, majorTypeId, detailId];
  @override
  NinMinorType get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_MinorType';
  @override
  final String actualTableName = 'nin_MinorType';
  @override
  VerificationContext validateIntegrity(Insertable<NinMinorTypeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order'], _orderMeta));
    }
    if (data.containsKey('majorType_id')) {
      context.handle(
          _majorTypeIdMeta,
          majorTypeId.isAcceptableOrUnknown(
              data['majorType_id'], _majorTypeIdMeta));
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinMinorTypeData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinMinorTypeData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinMinorType createAlias(String alias) {
    return NinMinorType(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id)',
        'FOREIGN KEY("majorType_id") REFERENCES "nin_MajorType" (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMajorTypeLECData extends DataClass
    implements Insertable<NinMajorTypeLECData> {
  final String id;
  final String lecId;
  final String majorTypeId;
  final String lecTypeId;
  final int axis;
  NinMajorTypeLECData(
      {@required this.id,
      this.lecId,
      this.majorTypeId,
      this.lecTypeId,
      this.axis});
  factory NinMajorTypeLECData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return NinMajorTypeLECData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      lecId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}lec_id']),
      majorTypeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorType_id']),
      lecTypeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}lecType_id']),
      axis: intType.mapFromDatabaseResponse(data['${effectivePrefix}axis']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || lecId != null) {
      map['lec_id'] = Variable<String>(lecId);
    }
    if (!nullToAbsent || majorTypeId != null) {
      map['majorType_id'] = Variable<String>(majorTypeId);
    }
    if (!nullToAbsent || lecTypeId != null) {
      map['lecType_id'] = Variable<String>(lecTypeId);
    }
    if (!nullToAbsent || axis != null) {
      map['axis'] = Variable<int>(axis);
    }
    return map;
  }

  NinMajorTypeLECCompanion toCompanion(bool nullToAbsent) {
    return NinMajorTypeLECCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      lecId:
          lecId == null && nullToAbsent ? const Value.absent() : Value(lecId),
      majorTypeId: majorTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeId),
      lecTypeId: lecTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(lecTypeId),
      axis: axis == null && nullToAbsent ? const Value.absent() : Value(axis),
    );
  }

  factory NinMajorTypeLECData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMajorTypeLECData(
      id: serializer.fromJson<String>(json['_id']),
      lecId: serializer.fromJson<String>(json['lec_id']),
      majorTypeId: serializer.fromJson<String>(json['majorType_id']),
      lecTypeId: serializer.fromJson<String>(json['lecType_id']),
      axis: serializer.fromJson<int>(json['axis']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'lec_id': serializer.toJson<String>(lecId),
      'majorType_id': serializer.toJson<String>(majorTypeId),
      'lecType_id': serializer.toJson<String>(lecTypeId),
      'axis': serializer.toJson<int>(axis),
    };
  }

  NinMajorTypeLECData copyWith(
          {String id,
          String lecId,
          String majorTypeId,
          String lecTypeId,
          int axis}) =>
      NinMajorTypeLECData(
        id: id ?? this.id,
        lecId: lecId ?? this.lecId,
        majorTypeId: majorTypeId ?? this.majorTypeId,
        lecTypeId: lecTypeId ?? this.lecTypeId,
        axis: axis ?? this.axis,
      );
  @override
  String toString() {
    return (StringBuffer('NinMajorTypeLECData(')
          ..write('id: $id, ')
          ..write('lecId: $lecId, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('lecTypeId: $lecTypeId, ')
          ..write('axis: $axis')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          lecId.hashCode,
          $mrjc(majorTypeId.hashCode,
              $mrjc(lecTypeId.hashCode, axis.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMajorTypeLECData &&
          other.id == this.id &&
          other.lecId == this.lecId &&
          other.majorTypeId == this.majorTypeId &&
          other.lecTypeId == this.lecTypeId &&
          other.axis == this.axis);
}

class NinMajorTypeLECCompanion extends UpdateCompanion<NinMajorTypeLECData> {
  final Value<String> id;
  final Value<String> lecId;
  final Value<String> majorTypeId;
  final Value<String> lecTypeId;
  final Value<int> axis;
  const NinMajorTypeLECCompanion({
    this.id = const Value.absent(),
    this.lecId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.lecTypeId = const Value.absent(),
    this.axis = const Value.absent(),
  });
  NinMajorTypeLECCompanion.insert({
    @required String id,
    this.lecId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.lecTypeId = const Value.absent(),
    this.axis = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinMajorTypeLECData> custom({
    Expression<String> id,
    Expression<String> lecId,
    Expression<String> majorTypeId,
    Expression<String> lecTypeId,
    Expression<int> axis,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (lecId != null) 'lec_id': lecId,
      if (majorTypeId != null) 'majorType_id': majorTypeId,
      if (lecTypeId != null) 'lecType_id': lecTypeId,
      if (axis != null) 'axis': axis,
    });
  }

  NinMajorTypeLECCompanion copyWith(
      {Value<String> id,
      Value<String> lecId,
      Value<String> majorTypeId,
      Value<String> lecTypeId,
      Value<int> axis}) {
    return NinMajorTypeLECCompanion(
      id: id ?? this.id,
      lecId: lecId ?? this.lecId,
      majorTypeId: majorTypeId ?? this.majorTypeId,
      lecTypeId: lecTypeId ?? this.lecTypeId,
      axis: axis ?? this.axis,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (lecId.present) {
      map['lec_id'] = Variable<String>(lecId.value);
    }
    if (majorTypeId.present) {
      map['majorType_id'] = Variable<String>(majorTypeId.value);
    }
    if (lecTypeId.present) {
      map['lecType_id'] = Variable<String>(lecTypeId.value);
    }
    if (axis.present) {
      map['axis'] = Variable<int>(axis.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinMajorTypeLECCompanion(')
          ..write('id: $id, ')
          ..write('lecId: $lecId, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('lecTypeId: $lecTypeId, ')
          ..write('axis: $axis')
          ..write(')'))
        .toString();
  }
}

class NinMajorTypeLEC extends Table
    with TableInfo<NinMajorTypeLEC, NinMajorTypeLECData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinMajorTypeLEC(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _lecIdMeta = const VerificationMeta('lecId');
  GeneratedTextColumn _lecId;
  GeneratedTextColumn get lecId => _lecId ??= _constructLecId();
  GeneratedTextColumn _constructLecId() {
    return GeneratedTextColumn('lec_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _majorTypeIdMeta =
      const VerificationMeta('majorTypeId');
  GeneratedTextColumn _majorTypeId;
  GeneratedTextColumn get majorTypeId =>
      _majorTypeId ??= _constructMajorTypeId();
  GeneratedTextColumn _constructMajorTypeId() {
    return GeneratedTextColumn('majorType_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _lecTypeIdMeta = const VerificationMeta('lecTypeId');
  GeneratedTextColumn _lecTypeId;
  GeneratedTextColumn get lecTypeId => _lecTypeId ??= _constructLecTypeId();
  GeneratedTextColumn _constructLecTypeId() {
    return GeneratedTextColumn('lecType_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _axisMeta = const VerificationMeta('axis');
  GeneratedIntColumn _axis;
  GeneratedIntColumn get axis => _axis ??= _constructAxis();
  GeneratedIntColumn _constructAxis() {
    return GeneratedIntColumn('axis', $tableName, true, $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, lecId, majorTypeId, lecTypeId, axis];
  @override
  NinMajorTypeLEC get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_MajorTypeLEC';
  @override
  final String actualTableName = 'nin_MajorTypeLEC';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinMajorTypeLECData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('lec_id')) {
      context.handle(
          _lecIdMeta, lecId.isAcceptableOrUnknown(data['lec_id'], _lecIdMeta));
    }
    if (data.containsKey('majorType_id')) {
      context.handle(
          _majorTypeIdMeta,
          majorTypeId.isAcceptableOrUnknown(
              data['majorType_id'], _majorTypeIdMeta));
    }
    if (data.containsKey('lecType_id')) {
      context.handle(_lecTypeIdMeta,
          lecTypeId.isAcceptableOrUnknown(data['lecType_id'], _lecTypeIdMeta));
    }
    if (data.containsKey('axis')) {
      context.handle(
          _axisMeta, axis.isAcceptableOrUnknown(data['axis'], _axisMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinMajorTypeLECData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinMajorTypeLECData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinMajorTypeLEC createAlias(String alias) {
    return NinMajorTypeLEC(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id)',
        'FOREIGN KEY(lec_id) REFERENCES "nin_LEC" (_id)',
        'FOREIGN KEY("majorType_id") REFERENCES "nin_MajorType" (_id)',
        'FOREIGN KEY("lecType_id") REFERENCES "nin_LECType" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinElementarySegmentData extends DataClass
    implements Insertable<NinElementarySegmentData> {
  final String id;
  final String lecId;
  final String value;
  final int order;
  NinElementarySegmentData(
      {@required this.id, this.lecId, @required this.value, this.order});
  factory NinElementarySegmentData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return NinElementarySegmentData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      lecId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}lec_id']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      order: intType.mapFromDatabaseResponse(data['${effectivePrefix}order']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || lecId != null) {
      map['lec_id'] = Variable<String>(lecId);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    return map;
  }

  NinElementarySegmentCompanion toCompanion(bool nullToAbsent) {
    return NinElementarySegmentCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      lecId:
          lecId == null && nullToAbsent ? const Value.absent() : Value(lecId),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      order:
          order == null && nullToAbsent ? const Value.absent() : Value(order),
    );
  }

  factory NinElementarySegmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinElementarySegmentData(
      id: serializer.fromJson<String>(json['_id']),
      lecId: serializer.fromJson<String>(json['lec_id']),
      value: serializer.fromJson<String>(json['value']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'lec_id': serializer.toJson<String>(lecId),
      'value': serializer.toJson<String>(value),
      'order': serializer.toJson<int>(order),
    };
  }

  NinElementarySegmentData copyWith(
          {String id, String lecId, String value, int order}) =>
      NinElementarySegmentData(
        id: id ?? this.id,
        lecId: lecId ?? this.lecId,
        value: value ?? this.value,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentData(')
          ..write('id: $id, ')
          ..write('lecId: $lecId, ')
          ..write('value: $value, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(lecId.hashCode, $mrjc(value.hashCode, order.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinElementarySegmentData &&
          other.id == this.id &&
          other.lecId == this.lecId &&
          other.value == this.value &&
          other.order == this.order);
}

class NinElementarySegmentCompanion
    extends UpdateCompanion<NinElementarySegmentData> {
  final Value<String> id;
  final Value<String> lecId;
  final Value<String> value;
  final Value<int> order;
  const NinElementarySegmentCompanion({
    this.id = const Value.absent(),
    this.lecId = const Value.absent(),
    this.value = const Value.absent(),
    this.order = const Value.absent(),
  });
  NinElementarySegmentCompanion.insert({
    @required String id,
    this.lecId = const Value.absent(),
    @required String value,
    this.order = const Value.absent(),
  })  : id = Value(id),
        value = Value(value);
  static Insertable<NinElementarySegmentData> custom({
    Expression<String> id,
    Expression<String> lecId,
    Expression<String> value,
    Expression<int> order,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (lecId != null) 'lec_id': lecId,
      if (value != null) 'value': value,
      if (order != null) 'order': order,
    });
  }

  NinElementarySegmentCompanion copyWith(
      {Value<String> id,
      Value<String> lecId,
      Value<String> value,
      Value<int> order}) {
    return NinElementarySegmentCompanion(
      id: id ?? this.id,
      lecId: lecId ?? this.lecId,
      value: value ?? this.value,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (lecId.present) {
      map['lec_id'] = Variable<String>(lecId.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentCompanion(')
          ..write('id: $id, ')
          ..write('lecId: $lecId, ')
          ..write('value: $value, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class NinElementarySegment extends Table
    with TableInfo<NinElementarySegment, NinElementarySegmentData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinElementarySegment(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _lecIdMeta = const VerificationMeta('lecId');
  GeneratedTextColumn _lecId;
  GeneratedTextColumn get lecId => _lecId ??= _constructLecId();
  GeneratedTextColumn _constructLecId() {
    return GeneratedTextColumn('lec_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedTextColumn _value;
  GeneratedTextColumn get value => _value ??= _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn('value', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  GeneratedIntColumn _order;
  GeneratedIntColumn get order => _order ??= _constructOrder();
  GeneratedIntColumn _constructOrder() {
    return GeneratedIntColumn('order', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, lecId, value, order];
  @override
  NinElementarySegment get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_ElementarySegment';
  @override
  final String actualTableName = 'nin_ElementarySegment';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinElementarySegmentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('lec_id')) {
      context.handle(
          _lecIdMeta, lecId.isAcceptableOrUnknown(data['lec_id'], _lecIdMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order'], _orderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, value};
  @override
  NinElementarySegmentData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinElementarySegmentData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  NinElementarySegment createAlias(String alias) {
    return NinElementarySegment(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id, value)',
        'FOREIGN KEY(lec_id) REFERENCES "nin_LEC" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMinorTypeScaledData extends DataClass
    implements Insertable<NinMinorTypeScaledData> {
  final String id;
  final String minorTypeId;
  final int mappingScaleId;
  NinMinorTypeScaledData(
      {@required this.id, @required this.minorTypeId, this.mappingScaleId});
  factory NinMinorTypeScaledData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return NinMinorTypeScaledData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      minorTypeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}minorType_id']),
      mappingScaleId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}mappingScale_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || minorTypeId != null) {
      map['minorType_id'] = Variable<String>(minorTypeId);
    }
    if (!nullToAbsent || mappingScaleId != null) {
      map['mappingScale_id'] = Variable<int>(mappingScaleId);
    }
    return map;
  }

  NinMinorTypeScaledCompanion toCompanion(bool nullToAbsent) {
    return NinMinorTypeScaledCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      minorTypeId: minorTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(minorTypeId),
      mappingScaleId: mappingScaleId == null && nullToAbsent
          ? const Value.absent()
          : Value(mappingScaleId),
    );
  }

  factory NinMinorTypeScaledData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMinorTypeScaledData(
      id: serializer.fromJson<String>(json['_id']),
      minorTypeId: serializer.fromJson<String>(json['minorType_id']),
      mappingScaleId: serializer.fromJson<int>(json['mappingScale_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'minorType_id': serializer.toJson<String>(minorTypeId),
      'mappingScale_id': serializer.toJson<int>(mappingScaleId),
    };
  }

  NinMinorTypeScaledData copyWith(
          {String id, String minorTypeId, int mappingScaleId}) =>
      NinMinorTypeScaledData(
        id: id ?? this.id,
        minorTypeId: minorTypeId ?? this.minorTypeId,
        mappingScaleId: mappingScaleId ?? this.mappingScaleId,
      );
  @override
  String toString() {
    return (StringBuffer('NinMinorTypeScaledData(')
          ..write('id: $id, ')
          ..write('minorTypeId: $minorTypeId, ')
          ..write('mappingScaleId: $mappingScaleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(id.hashCode, $mrjc(minorTypeId.hashCode, mappingScaleId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMinorTypeScaledData &&
          other.id == this.id &&
          other.minorTypeId == this.minorTypeId &&
          other.mappingScaleId == this.mappingScaleId);
}

class NinMinorTypeScaledCompanion
    extends UpdateCompanion<NinMinorTypeScaledData> {
  final Value<String> id;
  final Value<String> minorTypeId;
  final Value<int> mappingScaleId;
  const NinMinorTypeScaledCompanion({
    this.id = const Value.absent(),
    this.minorTypeId = const Value.absent(),
    this.mappingScaleId = const Value.absent(),
  });
  NinMinorTypeScaledCompanion.insert({
    @required String id,
    @required String minorTypeId,
    this.mappingScaleId = const Value.absent(),
  })  : id = Value(id),
        minorTypeId = Value(minorTypeId);
  static Insertable<NinMinorTypeScaledData> custom({
    Expression<String> id,
    Expression<String> minorTypeId,
    Expression<int> mappingScaleId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (minorTypeId != null) 'minorType_id': minorTypeId,
      if (mappingScaleId != null) 'mappingScale_id': mappingScaleId,
    });
  }

  NinMinorTypeScaledCompanion copyWith(
      {Value<String> id,
      Value<String> minorTypeId,
      Value<int> mappingScaleId}) {
    return NinMinorTypeScaledCompanion(
      id: id ?? this.id,
      minorTypeId: minorTypeId ?? this.minorTypeId,
      mappingScaleId: mappingScaleId ?? this.mappingScaleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (minorTypeId.present) {
      map['minorType_id'] = Variable<String>(minorTypeId.value);
    }
    if (mappingScaleId.present) {
      map['mappingScale_id'] = Variable<int>(mappingScaleId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinMinorTypeScaledCompanion(')
          ..write('id: $id, ')
          ..write('minorTypeId: $minorTypeId, ')
          ..write('mappingScaleId: $mappingScaleId')
          ..write(')'))
        .toString();
  }
}

class NinMinorTypeScaled extends Table
    with TableInfo<NinMinorTypeScaled, NinMinorTypeScaledData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinMinorTypeScaled(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _minorTypeIdMeta =
      const VerificationMeta('minorTypeId');
  GeneratedTextColumn _minorTypeId;
  GeneratedTextColumn get minorTypeId =>
      _minorTypeId ??= _constructMinorTypeId();
  GeneratedTextColumn _constructMinorTypeId() {
    return GeneratedTextColumn('minorType_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _mappingScaleIdMeta =
      const VerificationMeta('mappingScaleId');
  GeneratedIntColumn _mappingScaleId;
  GeneratedIntColumn get mappingScaleId =>
      _mappingScaleId ??= _constructMappingScaleId();
  GeneratedIntColumn _constructMappingScaleId() {
    return GeneratedIntColumn('mappingScale_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, minorTypeId, mappingScaleId];
  @override
  NinMinorTypeScaled get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_MinorTypeScaled';
  @override
  final String actualTableName = 'nin_MinorTypeScaled';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinMinorTypeScaledData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('minorType_id')) {
      context.handle(
          _minorTypeIdMeta,
          minorTypeId.isAcceptableOrUnknown(
              data['minorType_id'], _minorTypeIdMeta));
    } else if (isInserting) {
      context.missing(_minorTypeIdMeta);
    }
    if (data.containsKey('mappingScale_id')) {
      context.handle(
          _mappingScaleIdMeta,
          mappingScaleId.isAcceptableOrUnknown(
              data['mappingScale_id'], _mappingScaleIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, minorTypeId};
  @override
  NinMinorTypeScaledData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinMinorTypeScaledData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinMinorTypeScaled createAlias(String alias) {
    return NinMinorTypeScaled(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id, "minorType_id")',
        'FOREIGN KEY("minorType_id") REFERENCES "nin_MinorType" (_id)',
        'FOREIGN KEY("mappingScale_id") REFERENCES "nin_MappingScale" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinElementarySegmentGroupData extends DataClass
    implements Insertable<NinElementarySegmentGroupData> {
  final String id;
  final String elementarySegmentId;
  NinElementarySegmentGroupData(
      {@required this.id, @required this.elementarySegmentId});
  factory NinElementarySegmentGroupData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinElementarySegmentGroupData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      elementarySegmentId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}elementarySegment_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || elementarySegmentId != null) {
      map['elementarySegment_id'] = Variable<String>(elementarySegmentId);
    }
    return map;
  }

  NinElementarySegmentGroupCompanion toCompanion(bool nullToAbsent) {
    return NinElementarySegmentGroupCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      elementarySegmentId: elementarySegmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(elementarySegmentId),
    );
  }

  factory NinElementarySegmentGroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinElementarySegmentGroupData(
      id: serializer.fromJson<String>(json['_id']),
      elementarySegmentId:
          serializer.fromJson<String>(json['elementarySegment_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'elementarySegment_id': serializer.toJson<String>(elementarySegmentId),
    };
  }

  NinElementarySegmentGroupData copyWith(
          {String id, String elementarySegmentId}) =>
      NinElementarySegmentGroupData(
        id: id ?? this.id,
        elementarySegmentId: elementarySegmentId ?? this.elementarySegmentId,
      );
  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentGroupData(')
          ..write('id: $id, ')
          ..write('elementarySegmentId: $elementarySegmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, elementarySegmentId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinElementarySegmentGroupData &&
          other.id == this.id &&
          other.elementarySegmentId == this.elementarySegmentId);
}

class NinElementarySegmentGroupCompanion
    extends UpdateCompanion<NinElementarySegmentGroupData> {
  final Value<String> id;
  final Value<String> elementarySegmentId;
  const NinElementarySegmentGroupCompanion({
    this.id = const Value.absent(),
    this.elementarySegmentId = const Value.absent(),
  });
  NinElementarySegmentGroupCompanion.insert({
    @required String id,
    @required String elementarySegmentId,
  })  : id = Value(id),
        elementarySegmentId = Value(elementarySegmentId);
  static Insertable<NinElementarySegmentGroupData> custom({
    Expression<String> id,
    Expression<String> elementarySegmentId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (elementarySegmentId != null)
        'elementarySegment_id': elementarySegmentId,
    });
  }

  NinElementarySegmentGroupCompanion copyWith(
      {Value<String> id, Value<String> elementarySegmentId}) {
    return NinElementarySegmentGroupCompanion(
      id: id ?? this.id,
      elementarySegmentId: elementarySegmentId ?? this.elementarySegmentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (elementarySegmentId.present) {
      map['elementarySegment_id'] = Variable<String>(elementarySegmentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentGroupCompanion(')
          ..write('id: $id, ')
          ..write('elementarySegmentId: $elementarySegmentId')
          ..write(')'))
        .toString();
  }
}

class NinElementarySegmentGroup extends Table
    with TableInfo<NinElementarySegmentGroup, NinElementarySegmentGroupData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinElementarySegmentGroup(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _elementarySegmentIdMeta =
      const VerificationMeta('elementarySegmentId');
  GeneratedTextColumn _elementarySegmentId;
  GeneratedTextColumn get elementarySegmentId =>
      _elementarySegmentId ??= _constructElementarySegmentId();
  GeneratedTextColumn _constructElementarySegmentId() {
    return GeneratedTextColumn('elementarySegment_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  @override
  List<GeneratedColumn> get $columns => [id, elementarySegmentId];
  @override
  NinElementarySegmentGroup get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_ElementarySegmentGroup';
  @override
  final String actualTableName = 'nin_ElementarySegmentGroup';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinElementarySegmentGroupData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('elementarySegment_id')) {
      context.handle(
          _elementarySegmentIdMeta,
          elementarySegmentId.isAcceptableOrUnknown(
              data['elementarySegment_id'], _elementarySegmentIdMeta));
    } else if (isInserting) {
      context.missing(_elementarySegmentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, elementarySegmentId};
  @override
  NinElementarySegmentGroupData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinElementarySegmentGroupData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  NinElementarySegmentGroup createAlias(String alias) {
    return NinElementarySegmentGroup(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id, "elementarySegment_id")',
        'FOREIGN KEY("elementarySegment_id") REFERENCES "nin_ElementarySegment" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinStandardSegmentData extends DataClass
    implements Insertable<NinStandardSegmentData> {
  final String id;
  final String majorTypeLECId;
  final String detailId;
  NinStandardSegmentData(
      {@required this.id, this.majorTypeLECId, this.detailId});
  factory NinStandardSegmentData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinStandardSegmentData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      majorTypeLECId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorTypeLEC_id']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || majorTypeLECId != null) {
      map['majorTypeLEC_id'] = Variable<String>(majorTypeLECId);
    }
    if (!nullToAbsent || detailId != null) {
      map['detail_id'] = Variable<String>(detailId);
    }
    return map;
  }

  NinStandardSegmentCompanion toCompanion(bool nullToAbsent) {
    return NinStandardSegmentCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      majorTypeLECId: majorTypeLECId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeLECId),
      detailId: detailId == null && nullToAbsent
          ? const Value.absent()
          : Value(detailId),
    );
  }

  factory NinStandardSegmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinStandardSegmentData(
      id: serializer.fromJson<String>(json['_id']),
      majorTypeLECId: serializer.fromJson<String>(json['majorTypeLEC_id']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'majorTypeLEC_id': serializer.toJson<String>(majorTypeLECId),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinStandardSegmentData copyWith(
          {String id, String majorTypeLECId, String detailId}) =>
      NinStandardSegmentData(
        id: id ?? this.id,
        majorTypeLECId: majorTypeLECId ?? this.majorTypeLECId,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinStandardSegmentData(')
          ..write('id: $id, ')
          ..write('majorTypeLECId: $majorTypeLECId, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(id.hashCode, $mrjc(majorTypeLECId.hashCode, detailId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinStandardSegmentData &&
          other.id == this.id &&
          other.majorTypeLECId == this.majorTypeLECId &&
          other.detailId == this.detailId);
}

class NinStandardSegmentCompanion
    extends UpdateCompanion<NinStandardSegmentData> {
  final Value<String> id;
  final Value<String> majorTypeLECId;
  final Value<String> detailId;
  const NinStandardSegmentCompanion({
    this.id = const Value.absent(),
    this.majorTypeLECId = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinStandardSegmentCompanion.insert({
    @required String id,
    this.majorTypeLECId = const Value.absent(),
    this.detailId = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinStandardSegmentData> custom({
    Expression<String> id,
    Expression<String> majorTypeLECId,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (majorTypeLECId != null) 'majorTypeLEC_id': majorTypeLECId,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinStandardSegmentCompanion copyWith(
      {Value<String> id,
      Value<String> majorTypeLECId,
      Value<String> detailId}) {
    return NinStandardSegmentCompanion(
      id: id ?? this.id,
      majorTypeLECId: majorTypeLECId ?? this.majorTypeLECId,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (majorTypeLECId.present) {
      map['majorTypeLEC_id'] = Variable<String>(majorTypeLECId.value);
    }
    if (detailId.present) {
      map['detail_id'] = Variable<String>(detailId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinStandardSegmentCompanion(')
          ..write('id: $id, ')
          ..write('majorTypeLECId: $majorTypeLECId, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }
}

class NinStandardSegment extends Table
    with TableInfo<NinStandardSegment, NinStandardSegmentData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinStandardSegment(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _majorTypeLECIdMeta =
      const VerificationMeta('majorTypeLECId');
  GeneratedTextColumn _majorTypeLECId;
  GeneratedTextColumn get majorTypeLECId =>
      _majorTypeLECId ??= _constructMajorTypeLECId();
  GeneratedTextColumn _constructMajorTypeLECId() {
    return GeneratedTextColumn('majorTypeLEC_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, majorTypeLECId, detailId];
  @override
  NinStandardSegment get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_StandardSegment';
  @override
  final String actualTableName = 'nin_StandardSegment';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinStandardSegmentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('majorTypeLEC_id')) {
      context.handle(
          _majorTypeLECIdMeta,
          majorTypeLECId.isAcceptableOrUnknown(
              data['majorTypeLEC_id'], _majorTypeLECIdMeta));
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NinStandardSegmentData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinStandardSegmentData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinStandardSegment createAlias(String alias) {
    return NinStandardSegment(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id)',
        'FOREIGN KEY("majorTypeLEC_id") REFERENCES "nin_MajorTypeLEC" (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinGadModifierData extends DataClass
    implements Insertable<NinGadModifierData> {
  final String majorTypeLECId;
  final String majorTypeId;
  final String lecId;
  final int speciesId;
  final int value;
  NinGadModifierData(
      {@required this.majorTypeLECId,
      this.majorTypeId,
      this.lecId,
      @required this.speciesId,
      this.value});
  factory NinGadModifierData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return NinGadModifierData(
      majorTypeLECId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorTypeLEC_id']),
      majorTypeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorType_id']),
      lecId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}lec_id']),
      speciesId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}species_id']),
      value: intType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || majorTypeLECId != null) {
      map['majorTypeLEC_id'] = Variable<String>(majorTypeLECId);
    }
    if (!nullToAbsent || majorTypeId != null) {
      map['majorType_id'] = Variable<String>(majorTypeId);
    }
    if (!nullToAbsent || lecId != null) {
      map['lec_id'] = Variable<String>(lecId);
    }
    if (!nullToAbsent || speciesId != null) {
      map['species_id'] = Variable<int>(speciesId);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<int>(value);
    }
    return map;
  }

  NinGadModifierCompanion toCompanion(bool nullToAbsent) {
    return NinGadModifierCompanion(
      majorTypeLECId: majorTypeLECId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeLECId),
      majorTypeId: majorTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeId),
      lecId:
          lecId == null && nullToAbsent ? const Value.absent() : Value(lecId),
      speciesId: speciesId == null && nullToAbsent
          ? const Value.absent()
          : Value(speciesId),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory NinGadModifierData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinGadModifierData(
      majorTypeLECId: serializer.fromJson<String>(json['majorTypeLEC_id']),
      majorTypeId: serializer.fromJson<String>(json['majorType_id']),
      lecId: serializer.fromJson<String>(json['lec_id']),
      speciesId: serializer.fromJson<int>(json['species_id']),
      value: serializer.fromJson<int>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'majorTypeLEC_id': serializer.toJson<String>(majorTypeLECId),
      'majorType_id': serializer.toJson<String>(majorTypeId),
      'lec_id': serializer.toJson<String>(lecId),
      'species_id': serializer.toJson<int>(speciesId),
      'value': serializer.toJson<int>(value),
    };
  }

  NinGadModifierData copyWith(
          {String majorTypeLECId,
          String majorTypeId,
          String lecId,
          int speciesId,
          int value}) =>
      NinGadModifierData(
        majorTypeLECId: majorTypeLECId ?? this.majorTypeLECId,
        majorTypeId: majorTypeId ?? this.majorTypeId,
        lecId: lecId ?? this.lecId,
        speciesId: speciesId ?? this.speciesId,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('NinGadModifierData(')
          ..write('majorTypeLECId: $majorTypeLECId, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('lecId: $lecId, ')
          ..write('speciesId: $speciesId, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      majorTypeLECId.hashCode,
      $mrjc(majorTypeId.hashCode,
          $mrjc(lecId.hashCode, $mrjc(speciesId.hashCode, value.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinGadModifierData &&
          other.majorTypeLECId == this.majorTypeLECId &&
          other.majorTypeId == this.majorTypeId &&
          other.lecId == this.lecId &&
          other.speciesId == this.speciesId &&
          other.value == this.value);
}

class NinGadModifierCompanion extends UpdateCompanion<NinGadModifierData> {
  final Value<String> majorTypeLECId;
  final Value<String> majorTypeId;
  final Value<String> lecId;
  final Value<int> speciesId;
  final Value<int> value;
  const NinGadModifierCompanion({
    this.majorTypeLECId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.lecId = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.value = const Value.absent(),
  });
  NinGadModifierCompanion.insert({
    @required String majorTypeLECId,
    this.majorTypeId = const Value.absent(),
    this.lecId = const Value.absent(),
    @required int speciesId,
    this.value = const Value.absent(),
  })  : majorTypeLECId = Value(majorTypeLECId),
        speciesId = Value(speciesId);
  static Insertable<NinGadModifierData> custom({
    Expression<String> majorTypeLECId,
    Expression<String> majorTypeId,
    Expression<String> lecId,
    Expression<int> speciesId,
    Expression<int> value,
  }) {
    return RawValuesInsertable({
      if (majorTypeLECId != null) 'majorTypeLEC_id': majorTypeLECId,
      if (majorTypeId != null) 'majorType_id': majorTypeId,
      if (lecId != null) 'lec_id': lecId,
      if (speciesId != null) 'species_id': speciesId,
      if (value != null) 'value': value,
    });
  }

  NinGadModifierCompanion copyWith(
      {Value<String> majorTypeLECId,
      Value<String> majorTypeId,
      Value<String> lecId,
      Value<int> speciesId,
      Value<int> value}) {
    return NinGadModifierCompanion(
      majorTypeLECId: majorTypeLECId ?? this.majorTypeLECId,
      majorTypeId: majorTypeId ?? this.majorTypeId,
      lecId: lecId ?? this.lecId,
      speciesId: speciesId ?? this.speciesId,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (majorTypeLECId.present) {
      map['majorTypeLEC_id'] = Variable<String>(majorTypeLECId.value);
    }
    if (majorTypeId.present) {
      map['majorType_id'] = Variable<String>(majorTypeId.value);
    }
    if (lecId.present) {
      map['lec_id'] = Variable<String>(lecId.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<int>(speciesId.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinGadModifierCompanion(')
          ..write('majorTypeLECId: $majorTypeLECId, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('lecId: $lecId, ')
          ..write('speciesId: $speciesId, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class NinGadModifier extends Table
    with TableInfo<NinGadModifier, NinGadModifierData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinGadModifier(this._db, [this._alias]);
  final VerificationMeta _majorTypeLECIdMeta =
      const VerificationMeta('majorTypeLECId');
  GeneratedTextColumn _majorTypeLECId;
  GeneratedTextColumn get majorTypeLECId =>
      _majorTypeLECId ??= _constructMajorTypeLECId();
  GeneratedTextColumn _constructMajorTypeLECId() {
    return GeneratedTextColumn('majorTypeLEC_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _majorTypeIdMeta =
      const VerificationMeta('majorTypeId');
  GeneratedTextColumn _majorTypeId;
  GeneratedTextColumn get majorTypeId =>
      _majorTypeId ??= _constructMajorTypeId();
  GeneratedTextColumn _constructMajorTypeId() {
    return GeneratedTextColumn('majorType_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _lecIdMeta = const VerificationMeta('lecId');
  GeneratedTextColumn _lecId;
  GeneratedTextColumn get lecId => _lecId ??= _constructLecId();
  GeneratedTextColumn _constructLecId() {
    return GeneratedTextColumn('lec_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _speciesIdMeta = const VerificationMeta('speciesId');
  GeneratedIntColumn _speciesId;
  GeneratedIntColumn get speciesId => _speciesId ??= _constructSpeciesId();
  GeneratedIntColumn _constructSpeciesId() {
    return GeneratedIntColumn('species_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedIntColumn _value;
  GeneratedIntColumn get value => _value ??= _constructValue();
  GeneratedIntColumn _constructValue() {
    return GeneratedIntColumn('value', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [majorTypeLECId, majorTypeId, lecId, speciesId, value];
  @override
  NinGadModifier get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_GadModifier';
  @override
  final String actualTableName = 'nin_GadModifier';
  @override
  VerificationContext validateIntegrity(Insertable<NinGadModifierData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('majorTypeLEC_id')) {
      context.handle(
          _majorTypeLECIdMeta,
          majorTypeLECId.isAcceptableOrUnknown(
              data['majorTypeLEC_id'], _majorTypeLECIdMeta));
    } else if (isInserting) {
      context.missing(_majorTypeLECIdMeta);
    }
    if (data.containsKey('majorType_id')) {
      context.handle(
          _majorTypeIdMeta,
          majorTypeId.isAcceptableOrUnknown(
              data['majorType_id'], _majorTypeIdMeta));
    }
    if (data.containsKey('lec_id')) {
      context.handle(
          _lecIdMeta, lecId.isAcceptableOrUnknown(data['lec_id'], _lecIdMeta));
    }
    if (data.containsKey('species_id')) {
      context.handle(_speciesIdMeta,
          speciesId.isAcceptableOrUnknown(data['species_id'], _speciesIdMeta));
    } else if (isInserting) {
      context.missing(_speciesIdMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {majorTypeLECId, speciesId};
  @override
  NinGadModifierData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinGadModifierData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinGadModifier createAlias(String alias) {
    return NinGadModifier(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY ("majorTypeLEC_id", species_id)',
        'FOREIGN KEY("majorTypeLEC_id") REFERENCES "nin_MajorTypeLEC" (_id)',
        'FOREIGN KEY("majorType_id") REFERENCES "nin_MajorType" (_id)',
        'FOREIGN KEY(lec_id) REFERENCES "nin_LEC" (_id)',
        'FOREIGN KEY(species_id) REFERENCES "nin_Species" ("scientificNameId")'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMinorTypeStandardSegmentData extends DataClass
    implements Insertable<NinMinorTypeStandardSegmentData> {
  final String minorTypeId;
  final String standardSegmentId;
  NinMinorTypeStandardSegmentData(
      {@required this.minorTypeId, @required this.standardSegmentId});
  factory NinMinorTypeStandardSegmentData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinMinorTypeStandardSegmentData(
      minorTypeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}minorType_id']),
      standardSegmentId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}standardSegment_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || minorTypeId != null) {
      map['minorType_id'] = Variable<String>(minorTypeId);
    }
    if (!nullToAbsent || standardSegmentId != null) {
      map['standardSegment_id'] = Variable<String>(standardSegmentId);
    }
    return map;
  }

  NinMinorTypeStandardSegmentCompanion toCompanion(bool nullToAbsent) {
    return NinMinorTypeStandardSegmentCompanion(
      minorTypeId: minorTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(minorTypeId),
      standardSegmentId: standardSegmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(standardSegmentId),
    );
  }

  factory NinMinorTypeStandardSegmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMinorTypeStandardSegmentData(
      minorTypeId: serializer.fromJson<String>(json['minorType_id']),
      standardSegmentId:
          serializer.fromJson<String>(json['standardSegment_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'minorType_id': serializer.toJson<String>(minorTypeId),
      'standardSegment_id': serializer.toJson<String>(standardSegmentId),
    };
  }

  NinMinorTypeStandardSegmentData copyWith(
          {String minorTypeId, String standardSegmentId}) =>
      NinMinorTypeStandardSegmentData(
        minorTypeId: minorTypeId ?? this.minorTypeId,
        standardSegmentId: standardSegmentId ?? this.standardSegmentId,
      );
  @override
  String toString() {
    return (StringBuffer('NinMinorTypeStandardSegmentData(')
          ..write('minorTypeId: $minorTypeId, ')
          ..write('standardSegmentId: $standardSegmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(minorTypeId.hashCode, standardSegmentId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMinorTypeStandardSegmentData &&
          other.minorTypeId == this.minorTypeId &&
          other.standardSegmentId == this.standardSegmentId);
}

class NinMinorTypeStandardSegmentCompanion
    extends UpdateCompanion<NinMinorTypeStandardSegmentData> {
  final Value<String> minorTypeId;
  final Value<String> standardSegmentId;
  const NinMinorTypeStandardSegmentCompanion({
    this.minorTypeId = const Value.absent(),
    this.standardSegmentId = const Value.absent(),
  });
  NinMinorTypeStandardSegmentCompanion.insert({
    @required String minorTypeId,
    @required String standardSegmentId,
  })  : minorTypeId = Value(minorTypeId),
        standardSegmentId = Value(standardSegmentId);
  static Insertable<NinMinorTypeStandardSegmentData> custom({
    Expression<String> minorTypeId,
    Expression<String> standardSegmentId,
  }) {
    return RawValuesInsertable({
      if (minorTypeId != null) 'minorType_id': minorTypeId,
      if (standardSegmentId != null) 'standardSegment_id': standardSegmentId,
    });
  }

  NinMinorTypeStandardSegmentCompanion copyWith(
      {Value<String> minorTypeId, Value<String> standardSegmentId}) {
    return NinMinorTypeStandardSegmentCompanion(
      minorTypeId: minorTypeId ?? this.minorTypeId,
      standardSegmentId: standardSegmentId ?? this.standardSegmentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (minorTypeId.present) {
      map['minorType_id'] = Variable<String>(minorTypeId.value);
    }
    if (standardSegmentId.present) {
      map['standardSegment_id'] = Variable<String>(standardSegmentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinMinorTypeStandardSegmentCompanion(')
          ..write('minorTypeId: $minorTypeId, ')
          ..write('standardSegmentId: $standardSegmentId')
          ..write(')'))
        .toString();
  }
}

class NinMinorTypeStandardSegment extends Table
    with
        TableInfo<NinMinorTypeStandardSegment,
            NinMinorTypeStandardSegmentData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinMinorTypeStandardSegment(this._db, [this._alias]);
  final VerificationMeta _minorTypeIdMeta =
      const VerificationMeta('minorTypeId');
  GeneratedTextColumn _minorTypeId;
  GeneratedTextColumn get minorTypeId =>
      _minorTypeId ??= _constructMinorTypeId();
  GeneratedTextColumn _constructMinorTypeId() {
    return GeneratedTextColumn('minorType_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _standardSegmentIdMeta =
      const VerificationMeta('standardSegmentId');
  GeneratedTextColumn _standardSegmentId;
  GeneratedTextColumn get standardSegmentId =>
      _standardSegmentId ??= _constructStandardSegmentId();
  GeneratedTextColumn _constructStandardSegmentId() {
    return GeneratedTextColumn('standardSegment_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  @override
  List<GeneratedColumn> get $columns => [minorTypeId, standardSegmentId];
  @override
  NinMinorTypeStandardSegment get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_MinorTypeStandardSegment';
  @override
  final String actualTableName = 'nin_MinorTypeStandardSegment';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinMinorTypeStandardSegmentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('minorType_id')) {
      context.handle(
          _minorTypeIdMeta,
          minorTypeId.isAcceptableOrUnknown(
              data['minorType_id'], _minorTypeIdMeta));
    } else if (isInserting) {
      context.missing(_minorTypeIdMeta);
    }
    if (data.containsKey('standardSegment_id')) {
      context.handle(
          _standardSegmentIdMeta,
          standardSegmentId.isAcceptableOrUnknown(
              data['standardSegment_id'], _standardSegmentIdMeta));
    } else if (isInserting) {
      context.missing(_standardSegmentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {minorTypeId, standardSegmentId};
  @override
  NinMinorTypeStandardSegmentData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinMinorTypeStandardSegmentData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  NinMinorTypeStandardSegment createAlias(String alias) {
    return NinMinorTypeStandardSegment(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY ("minorType_id", "standardSegment_id")',
        'FOREIGN KEY("minorType_id") REFERENCES "nin_MinorType" (_id)',
        'FOREIGN KEY("standardSegment_id") REFERENCES "nin_StandardSegment" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinElementarySegmentGroupDetailData extends DataClass
    implements Insertable<NinElementarySegmentGroupDetailData> {
  final String elementarySegmentGroupId;
  final String lecId;
  final String value;
  final String detailId;
  NinElementarySegmentGroupDetailData(
      {@required this.elementarySegmentGroupId,
      this.lecId,
      this.value,
      this.detailId});
  factory NinElementarySegmentGroupDetailData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinElementarySegmentGroupDetailData(
      elementarySegmentGroupId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}elementarySegmentGroup_id']),
      lecId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}lec_id']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || elementarySegmentGroupId != null) {
      map['elementarySegmentGroup_id'] =
          Variable<String>(elementarySegmentGroupId);
    }
    if (!nullToAbsent || lecId != null) {
      map['lec_id'] = Variable<String>(lecId);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || detailId != null) {
      map['detail_id'] = Variable<String>(detailId);
    }
    return map;
  }

  NinElementarySegmentGroupDetailCompanion toCompanion(bool nullToAbsent) {
    return NinElementarySegmentGroupDetailCompanion(
      elementarySegmentGroupId: elementarySegmentGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(elementarySegmentGroupId),
      lecId:
          lecId == null && nullToAbsent ? const Value.absent() : Value(lecId),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      detailId: detailId == null && nullToAbsent
          ? const Value.absent()
          : Value(detailId),
    );
  }

  factory NinElementarySegmentGroupDetailData.fromJson(
      Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinElementarySegmentGroupDetailData(
      elementarySegmentGroupId:
          serializer.fromJson<String>(json['elementarySegmentGroup_id']),
      lecId: serializer.fromJson<String>(json['lec_id']),
      value: serializer.fromJson<String>(json['value']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'elementarySegmentGroup_id':
          serializer.toJson<String>(elementarySegmentGroupId),
      'lec_id': serializer.toJson<String>(lecId),
      'value': serializer.toJson<String>(value),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinElementarySegmentGroupDetailData copyWith(
          {String elementarySegmentGroupId,
          String lecId,
          String value,
          String detailId}) =>
      NinElementarySegmentGroupDetailData(
        elementarySegmentGroupId:
            elementarySegmentGroupId ?? this.elementarySegmentGroupId,
        lecId: lecId ?? this.lecId,
        value: value ?? this.value,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentGroupDetailData(')
          ..write('elementarySegmentGroupId: $elementarySegmentGroupId, ')
          ..write('lecId: $lecId, ')
          ..write('value: $value, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(elementarySegmentGroupId.hashCode,
      $mrjc(lecId.hashCode, $mrjc(value.hashCode, detailId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinElementarySegmentGroupDetailData &&
          other.elementarySegmentGroupId == this.elementarySegmentGroupId &&
          other.lecId == this.lecId &&
          other.value == this.value &&
          other.detailId == this.detailId);
}

class NinElementarySegmentGroupDetailCompanion
    extends UpdateCompanion<NinElementarySegmentGroupDetailData> {
  final Value<String> elementarySegmentGroupId;
  final Value<String> lecId;
  final Value<String> value;
  final Value<String> detailId;
  const NinElementarySegmentGroupDetailCompanion({
    this.elementarySegmentGroupId = const Value.absent(),
    this.lecId = const Value.absent(),
    this.value = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinElementarySegmentGroupDetailCompanion.insert({
    @required String elementarySegmentGroupId,
    this.lecId = const Value.absent(),
    this.value = const Value.absent(),
    this.detailId = const Value.absent(),
  }) : elementarySegmentGroupId = Value(elementarySegmentGroupId);
  static Insertable<NinElementarySegmentGroupDetailData> custom({
    Expression<String> elementarySegmentGroupId,
    Expression<String> lecId,
    Expression<String> value,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (elementarySegmentGroupId != null)
        'elementarySegmentGroup_id': elementarySegmentGroupId,
      if (lecId != null) 'lec_id': lecId,
      if (value != null) 'value': value,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinElementarySegmentGroupDetailCompanion copyWith(
      {Value<String> elementarySegmentGroupId,
      Value<String> lecId,
      Value<String> value,
      Value<String> detailId}) {
    return NinElementarySegmentGroupDetailCompanion(
      elementarySegmentGroupId:
          elementarySegmentGroupId ?? this.elementarySegmentGroupId,
      lecId: lecId ?? this.lecId,
      value: value ?? this.value,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (elementarySegmentGroupId.present) {
      map['elementarySegmentGroup_id'] =
          Variable<String>(elementarySegmentGroupId.value);
    }
    if (lecId.present) {
      map['lec_id'] = Variable<String>(lecId.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (detailId.present) {
      map['detail_id'] = Variable<String>(detailId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentGroupDetailCompanion(')
          ..write('elementarySegmentGroupId: $elementarySegmentGroupId, ')
          ..write('lecId: $lecId, ')
          ..write('value: $value, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }
}

class NinElementarySegmentGroupDetail extends Table
    with
        TableInfo<NinElementarySegmentGroupDetail,
            NinElementarySegmentGroupDetailData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinElementarySegmentGroupDetail(this._db, [this._alias]);
  final VerificationMeta _elementarySegmentGroupIdMeta =
      const VerificationMeta('elementarySegmentGroupId');
  GeneratedTextColumn _elementarySegmentGroupId;
  GeneratedTextColumn get elementarySegmentGroupId =>
      _elementarySegmentGroupId ??= _constructElementarySegmentGroupId();
  GeneratedTextColumn _constructElementarySegmentGroupId() {
    return GeneratedTextColumn('elementarySegmentGroup_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _lecIdMeta = const VerificationMeta('lecId');
  GeneratedTextColumn _lecId;
  GeneratedTextColumn get lecId => _lecId ??= _constructLecId();
  GeneratedTextColumn _constructLecId() {
    return GeneratedTextColumn('lec_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedTextColumn _value;
  GeneratedTextColumn get value => _value ??= _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn('value', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [elementarySegmentGroupId, lecId, value, detailId];
  @override
  NinElementarySegmentGroupDetail get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_ElementarySegmentGroupDetail';
  @override
  final String actualTableName = 'nin_ElementarySegmentGroupDetail';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinElementarySegmentGroupDetailData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('elementarySegmentGroup_id')) {
      context.handle(
          _elementarySegmentGroupIdMeta,
          elementarySegmentGroupId.isAcceptableOrUnknown(
              data['elementarySegmentGroup_id'],
              _elementarySegmentGroupIdMeta));
    } else if (isInserting) {
      context.missing(_elementarySegmentGroupIdMeta);
    }
    if (data.containsKey('lec_id')) {
      context.handle(
          _lecIdMeta, lecId.isAcceptableOrUnknown(data['lec_id'], _lecIdMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {elementarySegmentGroupId};
  @override
  NinElementarySegmentGroupDetailData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinElementarySegmentGroupDetailData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  NinElementarySegmentGroupDetail createAlias(String alias) {
    return NinElementarySegmentGroupDetail(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY ("elementarySegmentGroup_id")',
        'FOREIGN KEY("elementarySegmentGroup_id") REFERENCES "nin_ElementarySegmentGroup" ("elementarySegment_id")',
        'FOREIGN KEY(lec_id) REFERENCES "nin_LEC" (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinStandardSegmentElementData extends DataClass
    implements Insertable<NinStandardSegmentElementData> {
  final String standardSegmentId;
  final String elementarySegmentId;
  NinStandardSegmentElementData(
      {@required this.standardSegmentId, @required this.elementarySegmentId});
  factory NinStandardSegmentElementData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinStandardSegmentElementData(
      standardSegmentId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}standardSegment_id']),
      elementarySegmentId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}elementarySegment_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || standardSegmentId != null) {
      map['standardSegment_id'] = Variable<String>(standardSegmentId);
    }
    if (!nullToAbsent || elementarySegmentId != null) {
      map['elementarySegment_id'] = Variable<String>(elementarySegmentId);
    }
    return map;
  }

  NinStandardSegmentElementCompanion toCompanion(bool nullToAbsent) {
    return NinStandardSegmentElementCompanion(
      standardSegmentId: standardSegmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(standardSegmentId),
      elementarySegmentId: elementarySegmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(elementarySegmentId),
    );
  }

  factory NinStandardSegmentElementData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinStandardSegmentElementData(
      standardSegmentId:
          serializer.fromJson<String>(json['standardSegment_id']),
      elementarySegmentId:
          serializer.fromJson<String>(json['elementarySegment_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'standardSegment_id': serializer.toJson<String>(standardSegmentId),
      'elementarySegment_id': serializer.toJson<String>(elementarySegmentId),
    };
  }

  NinStandardSegmentElementData copyWith(
          {String standardSegmentId, String elementarySegmentId}) =>
      NinStandardSegmentElementData(
        standardSegmentId: standardSegmentId ?? this.standardSegmentId,
        elementarySegmentId: elementarySegmentId ?? this.elementarySegmentId,
      );
  @override
  String toString() {
    return (StringBuffer('NinStandardSegmentElementData(')
          ..write('standardSegmentId: $standardSegmentId, ')
          ..write('elementarySegmentId: $elementarySegmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(standardSegmentId.hashCode, elementarySegmentId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinStandardSegmentElementData &&
          other.standardSegmentId == this.standardSegmentId &&
          other.elementarySegmentId == this.elementarySegmentId);
}

class NinStandardSegmentElementCompanion
    extends UpdateCompanion<NinStandardSegmentElementData> {
  final Value<String> standardSegmentId;
  final Value<String> elementarySegmentId;
  const NinStandardSegmentElementCompanion({
    this.standardSegmentId = const Value.absent(),
    this.elementarySegmentId = const Value.absent(),
  });
  NinStandardSegmentElementCompanion.insert({
    @required String standardSegmentId,
    @required String elementarySegmentId,
  })  : standardSegmentId = Value(standardSegmentId),
        elementarySegmentId = Value(elementarySegmentId);
  static Insertable<NinStandardSegmentElementData> custom({
    Expression<String> standardSegmentId,
    Expression<String> elementarySegmentId,
  }) {
    return RawValuesInsertable({
      if (standardSegmentId != null) 'standardSegment_id': standardSegmentId,
      if (elementarySegmentId != null)
        'elementarySegment_id': elementarySegmentId,
    });
  }

  NinStandardSegmentElementCompanion copyWith(
      {Value<String> standardSegmentId, Value<String> elementarySegmentId}) {
    return NinStandardSegmentElementCompanion(
      standardSegmentId: standardSegmentId ?? this.standardSegmentId,
      elementarySegmentId: elementarySegmentId ?? this.elementarySegmentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (standardSegmentId.present) {
      map['standardSegment_id'] = Variable<String>(standardSegmentId.value);
    }
    if (elementarySegmentId.present) {
      map['elementarySegment_id'] = Variable<String>(elementarySegmentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinStandardSegmentElementCompanion(')
          ..write('standardSegmentId: $standardSegmentId, ')
          ..write('elementarySegmentId: $elementarySegmentId')
          ..write(')'))
        .toString();
  }
}

class NinStandardSegmentElement extends Table
    with TableInfo<NinStandardSegmentElement, NinStandardSegmentElementData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinStandardSegmentElement(this._db, [this._alias]);
  final VerificationMeta _standardSegmentIdMeta =
      const VerificationMeta('standardSegmentId');
  GeneratedTextColumn _standardSegmentId;
  GeneratedTextColumn get standardSegmentId =>
      _standardSegmentId ??= _constructStandardSegmentId();
  GeneratedTextColumn _constructStandardSegmentId() {
    return GeneratedTextColumn('standardSegment_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _elementarySegmentIdMeta =
      const VerificationMeta('elementarySegmentId');
  GeneratedTextColumn _elementarySegmentId;
  GeneratedTextColumn get elementarySegmentId =>
      _elementarySegmentId ??= _constructElementarySegmentId();
  GeneratedTextColumn _constructElementarySegmentId() {
    return GeneratedTextColumn('elementarySegment_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [standardSegmentId, elementarySegmentId];
  @override
  NinStandardSegmentElement get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_StandardSegmentElement';
  @override
  final String actualTableName = 'nin_StandardSegmentElement';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinStandardSegmentElementData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('standardSegment_id')) {
      context.handle(
          _standardSegmentIdMeta,
          standardSegmentId.isAcceptableOrUnknown(
              data['standardSegment_id'], _standardSegmentIdMeta));
    } else if (isInserting) {
      context.missing(_standardSegmentIdMeta);
    }
    if (data.containsKey('elementarySegment_id')) {
      context.handle(
          _elementarySegmentIdMeta,
          elementarySegmentId.isAcceptableOrUnknown(
              data['elementarySegment_id'], _elementarySegmentIdMeta));
    } else if (isInserting) {
      context.missing(_elementarySegmentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey =>
      {standardSegmentId, elementarySegmentId};
  @override
  NinStandardSegmentElementData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinStandardSegmentElementData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  NinStandardSegmentElement createAlias(String alias) {
    return NinStandardSegmentElement(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY ("standardSegment_id", "elementarySegment_id")',
        'FOREIGN KEY("standardSegment_id") REFERENCES "nin_StandardSegment" (_id)',
        'FOREIGN KEY("elementarySegment_id") REFERENCES "nin_ElementarySegment" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinElementarySegmentCombinationData extends DataClass
    implements Insertable<NinElementarySegmentCombinationData> {
  final String id;
  final String elementarySegmentGroupId;
  final String majorTypeLECId;
  NinElementarySegmentCombinationData(
      {@required this.id,
      @required this.elementarySegmentGroupId,
      this.majorTypeLECId});
  factory NinElementarySegmentCombinationData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinElementarySegmentCombinationData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      elementarySegmentGroupId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}elementarySegmentGroup_id']),
      majorTypeLECId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorTypeLEC_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || elementarySegmentGroupId != null) {
      map['elementarySegmentGroup_id'] =
          Variable<String>(elementarySegmentGroupId);
    }
    if (!nullToAbsent || majorTypeLECId != null) {
      map['majorTypeLEC_id'] = Variable<String>(majorTypeLECId);
    }
    return map;
  }

  NinElementarySegmentCombinationCompanion toCompanion(bool nullToAbsent) {
    return NinElementarySegmentCombinationCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      elementarySegmentGroupId: elementarySegmentGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(elementarySegmentGroupId),
      majorTypeLECId: majorTypeLECId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeLECId),
    );
  }

  factory NinElementarySegmentCombinationData.fromJson(
      Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinElementarySegmentCombinationData(
      id: serializer.fromJson<String>(json['_id']),
      elementarySegmentGroupId:
          serializer.fromJson<String>(json['elementarySegmentGroup_id']),
      majorTypeLECId: serializer.fromJson<String>(json['majorTypeLEC_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'elementarySegmentGroup_id':
          serializer.toJson<String>(elementarySegmentGroupId),
      'majorTypeLEC_id': serializer.toJson<String>(majorTypeLECId),
    };
  }

  NinElementarySegmentCombinationData copyWith(
          {String id,
          String elementarySegmentGroupId,
          String majorTypeLECId}) =>
      NinElementarySegmentCombinationData(
        id: id ?? this.id,
        elementarySegmentGroupId:
            elementarySegmentGroupId ?? this.elementarySegmentGroupId,
        majorTypeLECId: majorTypeLECId ?? this.majorTypeLECId,
      );
  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentCombinationData(')
          ..write('id: $id, ')
          ..write('elementarySegmentGroupId: $elementarySegmentGroupId, ')
          ..write('majorTypeLECId: $majorTypeLECId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(elementarySegmentGroupId.hashCode, majorTypeLECId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinElementarySegmentCombinationData &&
          other.id == this.id &&
          other.elementarySegmentGroupId == this.elementarySegmentGroupId &&
          other.majorTypeLECId == this.majorTypeLECId);
}

class NinElementarySegmentCombinationCompanion
    extends UpdateCompanion<NinElementarySegmentCombinationData> {
  final Value<String> id;
  final Value<String> elementarySegmentGroupId;
  final Value<String> majorTypeLECId;
  const NinElementarySegmentCombinationCompanion({
    this.id = const Value.absent(),
    this.elementarySegmentGroupId = const Value.absent(),
    this.majorTypeLECId = const Value.absent(),
  });
  NinElementarySegmentCombinationCompanion.insert({
    @required String id,
    @required String elementarySegmentGroupId,
    this.majorTypeLECId = const Value.absent(),
  })  : id = Value(id),
        elementarySegmentGroupId = Value(elementarySegmentGroupId);
  static Insertable<NinElementarySegmentCombinationData> custom({
    Expression<String> id,
    Expression<String> elementarySegmentGroupId,
    Expression<String> majorTypeLECId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (elementarySegmentGroupId != null)
        'elementarySegmentGroup_id': elementarySegmentGroupId,
      if (majorTypeLECId != null) 'majorTypeLEC_id': majorTypeLECId,
    });
  }

  NinElementarySegmentCombinationCompanion copyWith(
      {Value<String> id,
      Value<String> elementarySegmentGroupId,
      Value<String> majorTypeLECId}) {
    return NinElementarySegmentCombinationCompanion(
      id: id ?? this.id,
      elementarySegmentGroupId:
          elementarySegmentGroupId ?? this.elementarySegmentGroupId,
      majorTypeLECId: majorTypeLECId ?? this.majorTypeLECId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (elementarySegmentGroupId.present) {
      map['elementarySegmentGroup_id'] =
          Variable<String>(elementarySegmentGroupId.value);
    }
    if (majorTypeLECId.present) {
      map['majorTypeLEC_id'] = Variable<String>(majorTypeLECId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentCombinationCompanion(')
          ..write('id: $id, ')
          ..write('elementarySegmentGroupId: $elementarySegmentGroupId, ')
          ..write('majorTypeLECId: $majorTypeLECId')
          ..write(')'))
        .toString();
  }
}

class NinElementarySegmentCombination extends Table
    with
        TableInfo<NinElementarySegmentCombination,
            NinElementarySegmentCombinationData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinElementarySegmentCombination(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _elementarySegmentGroupIdMeta =
      const VerificationMeta('elementarySegmentGroupId');
  GeneratedTextColumn _elementarySegmentGroupId;
  GeneratedTextColumn get elementarySegmentGroupId =>
      _elementarySegmentGroupId ??= _constructElementarySegmentGroupId();
  GeneratedTextColumn _constructElementarySegmentGroupId() {
    return GeneratedTextColumn('elementarySegmentGroup_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _majorTypeLECIdMeta =
      const VerificationMeta('majorTypeLECId');
  GeneratedTextColumn _majorTypeLECId;
  GeneratedTextColumn get majorTypeLECId =>
      _majorTypeLECId ??= _constructMajorTypeLECId();
  GeneratedTextColumn _constructMajorTypeLECId() {
    return GeneratedTextColumn('majorTypeLEC_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, elementarySegmentGroupId, majorTypeLECId];
  @override
  NinElementarySegmentCombination get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_ElementarySegmentCombination';
  @override
  final String actualTableName = 'nin_ElementarySegmentCombination';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinElementarySegmentCombinationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('elementarySegmentGroup_id')) {
      context.handle(
          _elementarySegmentGroupIdMeta,
          elementarySegmentGroupId.isAcceptableOrUnknown(
              data['elementarySegmentGroup_id'],
              _elementarySegmentGroupIdMeta));
    } else if (isInserting) {
      context.missing(_elementarySegmentGroupIdMeta);
    }
    if (data.containsKey('majorTypeLEC_id')) {
      context.handle(
          _majorTypeLECIdMeta,
          majorTypeLECId.isAcceptableOrUnknown(
              data['majorTypeLEC_id'], _majorTypeLECIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, elementarySegmentGroupId};
  @override
  NinElementarySegmentCombinationData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinElementarySegmentCombinationData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  NinElementarySegmentCombination createAlias(String alias) {
    return NinElementarySegmentCombination(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (_id, "elementarySegmentGroup_id")',
        'FOREIGN KEY("elementarySegmentGroup_id") REFERENCES "nin_ElementarySegmentGroup" (_id)',
        'FOREIGN KEY("majorTypeLEC_id") REFERENCES "nin_MajorTypeLEC" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinGadValueData extends DataClass implements Insertable<NinGadValueData> {
  final String elementarySegmentCombinationId;
  final int speciesId;
  final int majorTypeId;
  final int valueM7ScaleId;
  final int valueM3ScaleId;
  NinGadValueData(
      {@required this.elementarySegmentCombinationId,
      @required this.speciesId,
      this.majorTypeId,
      this.valueM7ScaleId,
      this.valueM3ScaleId});
  factory NinGadValueData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return NinGadValueData(
      elementarySegmentCombinationId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}elementarySegmentCombination_id']),
      speciesId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}species_id']),
      majorTypeId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorType_id']),
      valueM7ScaleId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}valueM7Scale_id']),
      valueM3ScaleId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}valueM3Scale_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || elementarySegmentCombinationId != null) {
      map['elementarySegmentCombination_id'] =
          Variable<String>(elementarySegmentCombinationId);
    }
    if (!nullToAbsent || speciesId != null) {
      map['species_id'] = Variable<int>(speciesId);
    }
    if (!nullToAbsent || majorTypeId != null) {
      map['majorType_id'] = Variable<int>(majorTypeId);
    }
    if (!nullToAbsent || valueM7ScaleId != null) {
      map['valueM7Scale_id'] = Variable<int>(valueM7ScaleId);
    }
    if (!nullToAbsent || valueM3ScaleId != null) {
      map['valueM3Scale_id'] = Variable<int>(valueM3ScaleId);
    }
    return map;
  }

  NinGadValueCompanion toCompanion(bool nullToAbsent) {
    return NinGadValueCompanion(
      elementarySegmentCombinationId:
          elementarySegmentCombinationId == null && nullToAbsent
              ? const Value.absent()
              : Value(elementarySegmentCombinationId),
      speciesId: speciesId == null && nullToAbsent
          ? const Value.absent()
          : Value(speciesId),
      majorTypeId: majorTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeId),
      valueM7ScaleId: valueM7ScaleId == null && nullToAbsent
          ? const Value.absent()
          : Value(valueM7ScaleId),
      valueM3ScaleId: valueM3ScaleId == null && nullToAbsent
          ? const Value.absent()
          : Value(valueM3ScaleId),
    );
  }

  factory NinGadValueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinGadValueData(
      elementarySegmentCombinationId:
          serializer.fromJson<String>(json['elementarySegmentCombination_id']),
      speciesId: serializer.fromJson<int>(json['species_id']),
      majorTypeId: serializer.fromJson<int>(json['majorType_id']),
      valueM7ScaleId: serializer.fromJson<int>(json['valueM7Scale_id']),
      valueM3ScaleId: serializer.fromJson<int>(json['valueM3Scale_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'elementarySegmentCombination_id':
          serializer.toJson<String>(elementarySegmentCombinationId),
      'species_id': serializer.toJson<int>(speciesId),
      'majorType_id': serializer.toJson<int>(majorTypeId),
      'valueM7Scale_id': serializer.toJson<int>(valueM7ScaleId),
      'valueM3Scale_id': serializer.toJson<int>(valueM3ScaleId),
    };
  }

  NinGadValueData copyWith(
          {String elementarySegmentCombinationId,
          int speciesId,
          int majorTypeId,
          int valueM7ScaleId,
          int valueM3ScaleId}) =>
      NinGadValueData(
        elementarySegmentCombinationId: elementarySegmentCombinationId ??
            this.elementarySegmentCombinationId,
        speciesId: speciesId ?? this.speciesId,
        majorTypeId: majorTypeId ?? this.majorTypeId,
        valueM7ScaleId: valueM7ScaleId ?? this.valueM7ScaleId,
        valueM3ScaleId: valueM3ScaleId ?? this.valueM3ScaleId,
      );
  @override
  String toString() {
    return (StringBuffer('NinGadValueData(')
          ..write(
              'elementarySegmentCombinationId: $elementarySegmentCombinationId, ')
          ..write('speciesId: $speciesId, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('valueM7ScaleId: $valueM7ScaleId, ')
          ..write('valueM3ScaleId: $valueM3ScaleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      elementarySegmentCombinationId.hashCode,
      $mrjc(
          speciesId.hashCode,
          $mrjc(majorTypeId.hashCode,
              $mrjc(valueM7ScaleId.hashCode, valueM3ScaleId.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinGadValueData &&
          other.elementarySegmentCombinationId ==
              this.elementarySegmentCombinationId &&
          other.speciesId == this.speciesId &&
          other.majorTypeId == this.majorTypeId &&
          other.valueM7ScaleId == this.valueM7ScaleId &&
          other.valueM3ScaleId == this.valueM3ScaleId);
}

class NinGadValueCompanion extends UpdateCompanion<NinGadValueData> {
  final Value<String> elementarySegmentCombinationId;
  final Value<int> speciesId;
  final Value<int> majorTypeId;
  final Value<int> valueM7ScaleId;
  final Value<int> valueM3ScaleId;
  const NinGadValueCompanion({
    this.elementarySegmentCombinationId = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.valueM7ScaleId = const Value.absent(),
    this.valueM3ScaleId = const Value.absent(),
  });
  NinGadValueCompanion.insert({
    @required String elementarySegmentCombinationId,
    @required int speciesId,
    this.majorTypeId = const Value.absent(),
    this.valueM7ScaleId = const Value.absent(),
    this.valueM3ScaleId = const Value.absent(),
  })  : elementarySegmentCombinationId = Value(elementarySegmentCombinationId),
        speciesId = Value(speciesId);
  static Insertable<NinGadValueData> custom({
    Expression<String> elementarySegmentCombinationId,
    Expression<int> speciesId,
    Expression<int> majorTypeId,
    Expression<int> valueM7ScaleId,
    Expression<int> valueM3ScaleId,
  }) {
    return RawValuesInsertable({
      if (elementarySegmentCombinationId != null)
        'elementarySegmentCombination_id': elementarySegmentCombinationId,
      if (speciesId != null) 'species_id': speciesId,
      if (majorTypeId != null) 'majorType_id': majorTypeId,
      if (valueM7ScaleId != null) 'valueM7Scale_id': valueM7ScaleId,
      if (valueM3ScaleId != null) 'valueM3Scale_id': valueM3ScaleId,
    });
  }

  NinGadValueCompanion copyWith(
      {Value<String> elementarySegmentCombinationId,
      Value<int> speciesId,
      Value<int> majorTypeId,
      Value<int> valueM7ScaleId,
      Value<int> valueM3ScaleId}) {
    return NinGadValueCompanion(
      elementarySegmentCombinationId:
          elementarySegmentCombinationId ?? this.elementarySegmentCombinationId,
      speciesId: speciesId ?? this.speciesId,
      majorTypeId: majorTypeId ?? this.majorTypeId,
      valueM7ScaleId: valueM7ScaleId ?? this.valueM7ScaleId,
      valueM3ScaleId: valueM3ScaleId ?? this.valueM3ScaleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (elementarySegmentCombinationId.present) {
      map['elementarySegmentCombination_id'] =
          Variable<String>(elementarySegmentCombinationId.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<int>(speciesId.value);
    }
    if (majorTypeId.present) {
      map['majorType_id'] = Variable<int>(majorTypeId.value);
    }
    if (valueM7ScaleId.present) {
      map['valueM7Scale_id'] = Variable<int>(valueM7ScaleId.value);
    }
    if (valueM3ScaleId.present) {
      map['valueM3Scale_id'] = Variable<int>(valueM3ScaleId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinGadValueCompanion(')
          ..write(
              'elementarySegmentCombinationId: $elementarySegmentCombinationId, ')
          ..write('speciesId: $speciesId, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('valueM7ScaleId: $valueM7ScaleId, ')
          ..write('valueM3ScaleId: $valueM3ScaleId')
          ..write(')'))
        .toString();
  }
}

class NinGadValue extends Table with TableInfo<NinGadValue, NinGadValueData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinGadValue(this._db, [this._alias]);
  final VerificationMeta _elementarySegmentCombinationIdMeta =
      const VerificationMeta('elementarySegmentCombinationId');
  GeneratedTextColumn _elementarySegmentCombinationId;
  GeneratedTextColumn get elementarySegmentCombinationId =>
      _elementarySegmentCombinationId ??=
          _constructElementarySegmentCombinationId();
  GeneratedTextColumn _constructElementarySegmentCombinationId() {
    return GeneratedTextColumn(
        'elementarySegmentCombination_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _speciesIdMeta = const VerificationMeta('speciesId');
  GeneratedIntColumn _speciesId;
  GeneratedIntColumn get speciesId => _speciesId ??= _constructSpeciesId();
  GeneratedIntColumn _constructSpeciesId() {
    return GeneratedIntColumn('species_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _majorTypeIdMeta =
      const VerificationMeta('majorTypeId');
  GeneratedIntColumn _majorTypeId;
  GeneratedIntColumn get majorTypeId =>
      _majorTypeId ??= _constructMajorTypeId();
  GeneratedIntColumn _constructMajorTypeId() {
    return GeneratedIntColumn('majorType_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _valueM7ScaleIdMeta =
      const VerificationMeta('valueM7ScaleId');
  GeneratedIntColumn _valueM7ScaleId;
  GeneratedIntColumn get valueM7ScaleId =>
      _valueM7ScaleId ??= _constructValueM7ScaleId();
  GeneratedIntColumn _constructValueM7ScaleId() {
    return GeneratedIntColumn('valueM7Scale_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _valueM3ScaleIdMeta =
      const VerificationMeta('valueM3ScaleId');
  GeneratedIntColumn _valueM3ScaleId;
  GeneratedIntColumn get valueM3ScaleId =>
      _valueM3ScaleId ??= _constructValueM3ScaleId();
  GeneratedIntColumn _constructValueM3ScaleId() {
    return GeneratedIntColumn('valueM3Scale_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [
        elementarySegmentCombinationId,
        speciesId,
        majorTypeId,
        valueM7ScaleId,
        valueM3ScaleId
      ];
  @override
  NinGadValue get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_GadValue';
  @override
  final String actualTableName = 'nin_GadValue';
  @override
  VerificationContext validateIntegrity(Insertable<NinGadValueData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('elementarySegmentCombination_id')) {
      context.handle(
          _elementarySegmentCombinationIdMeta,
          elementarySegmentCombinationId.isAcceptableOrUnknown(
              data['elementarySegmentCombination_id'],
              _elementarySegmentCombinationIdMeta));
    } else if (isInserting) {
      context.missing(_elementarySegmentCombinationIdMeta);
    }
    if (data.containsKey('species_id')) {
      context.handle(_speciesIdMeta,
          speciesId.isAcceptableOrUnknown(data['species_id'], _speciesIdMeta));
    } else if (isInserting) {
      context.missing(_speciesIdMeta);
    }
    if (data.containsKey('majorType_id')) {
      context.handle(
          _majorTypeIdMeta,
          majorTypeId.isAcceptableOrUnknown(
              data['majorType_id'], _majorTypeIdMeta));
    }
    if (data.containsKey('valueM7Scale_id')) {
      context.handle(
          _valueM7ScaleIdMeta,
          valueM7ScaleId.isAcceptableOrUnknown(
              data['valueM7Scale_id'], _valueM7ScaleIdMeta));
    }
    if (data.containsKey('valueM3Scale_id')) {
      context.handle(
          _valueM3ScaleIdMeta,
          valueM3ScaleId.isAcceptableOrUnknown(
              data['valueM3Scale_id'], _valueM3ScaleIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey =>
      {elementarySegmentCombinationId, speciesId};
  @override
  NinGadValueData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinGadValueData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinGadValue createAlias(String alias) {
    return NinGadValue(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY ("elementarySegmentCombination_id", species_id)',
        'FOREIGN KEY("elementarySegmentCombination_id") REFERENCES "nin_ElementarySegmentCombination" (_id)',
        'FOREIGN KEY(species_id) REFERENCES "nin_Species" ("scientificNameId")',
        'FOREIGN KEY("majorType_id") REFERENCES "nin_MajorType" (_id)',
        'FOREIGN KEY("valueM7Scale_id") REFERENCES "nin_GadScale" ("m7Scale")',
        'FOREIGN KEY("valueM3Scale_id") REFERENCES "nin_GadScale" ("m3Scale")'
      ];
  @override
  bool get dontWriteConstraints => true;
}

abstract class _$NiNDatabase extends GeneratedDatabase {
  _$NiNDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  NinLanguage _ninLanguage;
  NinLanguage get ninLanguage => _ninLanguage ??= NinLanguage(this);
  NinMappingScale _ninMappingScale;
  NinMappingScale get ninMappingScale =>
      _ninMappingScale ??= NinMappingScale(this);
  NinGadScale _ninGadScale;
  NinGadScale get ninGadScale => _ninGadScale ??= NinGadScale(this);
  NinSpecies _ninSpecies;
  NinSpecies get ninSpecies => _ninSpecies ??= NinSpecies(this);
  NinDetail _ninDetail;
  NinDetail get ninDetail => _ninDetail ??= NinDetail(this);
  NinMajorTypeGroup _ninMajorTypeGroup;
  NinMajorTypeGroup get ninMajorTypeGroup =>
      _ninMajorTypeGroup ??= NinMajorTypeGroup(this);
  NinStructuringProcess _ninStructuringProcess;
  NinStructuringProcess get ninStructuringProcess =>
      _ninStructuringProcess ??= NinStructuringProcess(this);
  NinPatternOfVariation _ninPatternOfVariation;
  NinPatternOfVariation get ninPatternOfVariation =>
      _ninPatternOfVariation ??= NinPatternOfVariation(this);
  NinLECType _ninLECType;
  NinLECType get ninLECType => _ninLECType ??= NinLECType(this);
  NinMajorType _ninMajorType;
  NinMajorType get ninMajorType => _ninMajorType ??= NinMajorType(this);
  NinLEC _ninLEC;
  NinLEC get ninLEC => _ninLEC ??= NinLEC(this);
  NinMinorType _ninMinorType;
  NinMinorType get ninMinorType => _ninMinorType ??= NinMinorType(this);
  NinMajorTypeLEC _ninMajorTypeLEC;
  NinMajorTypeLEC get ninMajorTypeLEC =>
      _ninMajorTypeLEC ??= NinMajorTypeLEC(this);
  NinElementarySegment _ninElementarySegment;
  NinElementarySegment get ninElementarySegment =>
      _ninElementarySegment ??= NinElementarySegment(this);
  NinMinorTypeScaled _ninMinorTypeScaled;
  NinMinorTypeScaled get ninMinorTypeScaled =>
      _ninMinorTypeScaled ??= NinMinorTypeScaled(this);
  NinElementarySegmentGroup _ninElementarySegmentGroup;
  NinElementarySegmentGroup get ninElementarySegmentGroup =>
      _ninElementarySegmentGroup ??= NinElementarySegmentGroup(this);
  NinStandardSegment _ninStandardSegment;
  NinStandardSegment get ninStandardSegment =>
      _ninStandardSegment ??= NinStandardSegment(this);
  NinGadModifier _ninGadModifier;
  NinGadModifier get ninGadModifier => _ninGadModifier ??= NinGadModifier(this);
  NinMinorTypeStandardSegment _ninMinorTypeStandardSegment;
  NinMinorTypeStandardSegment get ninMinorTypeStandardSegment =>
      _ninMinorTypeStandardSegment ??= NinMinorTypeStandardSegment(this);
  NinElementarySegmentGroupDetail _ninElementarySegmentGroupDetail;
  NinElementarySegmentGroupDetail get ninElementarySegmentGroupDetail =>
      _ninElementarySegmentGroupDetail ??=
          NinElementarySegmentGroupDetail(this);
  NinStandardSegmentElement _ninStandardSegmentElement;
  NinStandardSegmentElement get ninStandardSegmentElement =>
      _ninStandardSegmentElement ??= NinStandardSegmentElement(this);
  NinElementarySegmentCombination _ninElementarySegmentCombination;
  NinElementarySegmentCombination get ninElementarySegmentCombination =>
      _ninElementarySegmentCombination ??=
          NinElementarySegmentCombination(this);
  NinGadValue _ninGadValue;
  NinGadValue get ninGadValue => _ninGadValue ??= NinGadValue(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        ninLanguage,
        ninMappingScale,
        ninGadScale,
        ninSpecies,
        ninDetail,
        ninMajorTypeGroup,
        ninStructuringProcess,
        ninPatternOfVariation,
        ninLECType,
        ninMajorType,
        ninLEC,
        ninMinorType,
        ninMajorTypeLEC,
        ninElementarySegment,
        ninMinorTypeScaled,
        ninElementarySegmentGroup,
        ninStandardSegment,
        ninGadModifier,
        ninMinorTypeStandardSegment,
        ninElementarySegmentGroupDetail,
        ninStandardSegmentElement,
        ninElementarySegmentCombination,
        ninGadValue
      ];
}
