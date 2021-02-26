// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nin_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class NinLanguageData extends DataClass implements Insertable<NinLanguageData> {
  final int pid;
  final String id;
  final String name;
  NinLanguageData({@required this.pid, this.id, this.name});
  factory NinLanguageData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinLanguageData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory NinLanguageData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinLanguageData(
      pid: serializer.fromJson<int>(json['pid']),
      id: serializer.fromJson<String>(json['_id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  NinLanguageData copyWith({int pid, String id, String name}) =>
      NinLanguageData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('NinLanguageData(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(pid.hashCode, $mrjc(id.hashCode, name.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinLanguageData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.name == this.name);
}

class NinLanguageCompanion extends UpdateCompanion<NinLanguageData> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> name;
  const NinLanguageCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  NinLanguageCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<NinLanguageData> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (name != null) 'name': name,
    });
  }

  NinLanguageCompanion copyWith(
      {Value<int> pid, Value<String> id, Value<String> name}) {
    return NinLanguageCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [pid, id, name];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
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
  Set<GeneratedColumn> get $primaryKey => {pid};
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
  List<String> get customConstraints => const ['PRIMARY KEY (pid)'];
  @override
  bool get dontWriteConstraints => true;
}

class NinMappingScaleData extends DataClass
    implements Insertable<NinMappingScaleData> {
  final int pid;
  final int id;
  final String name;
  NinMappingScaleData({@required this.pid, this.id, this.name});
  factory NinMappingScaleData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinMappingScaleData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory NinMappingScaleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMappingScaleData(
      pid: serializer.fromJson<int>(json['pid']),
      id: serializer.fromJson<int>(json['_id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  NinMappingScaleData copyWith({int pid, int id, String name}) =>
      NinMappingScaleData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('NinMappingScaleData(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(pid.hashCode, $mrjc(id.hashCode, name.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMappingScaleData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.name == this.name);
}

class NinMappingScaleCompanion extends UpdateCompanion<NinMappingScaleData> {
  final Value<int> pid;
  final Value<int> id;
  final Value<String> name;
  const NinMappingScaleCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  NinMappingScaleCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<NinMappingScaleData> custom({
    Expression<int> pid,
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (name != null) 'name': name,
    });
  }

  NinMappingScaleCompanion copyWith(
      {Value<int> pid, Value<int> id, Value<String> name}) {
    return NinMappingScaleCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('_id', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [pid, id, name];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
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
  Set<GeneratedColumn> get $primaryKey => {pid};
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
  List<String> get customConstraints =>
      const ['PRIMARY KEY (pid)', 'UNIQUE (_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class NinGadScaleData extends DataClass implements Insertable<NinGadScaleData> {
  final int pid;
  final int m7Scale;
  final int m3Scale;
  final String constancy;
  NinGadScaleData(
      {@required this.pid, this.m7Scale, this.m3Scale, this.constancy});
  factory NinGadScaleData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinGadScaleData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
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
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
      m7Scale: serializer.fromJson<int>(json['m7Scale']),
      m3Scale: serializer.fromJson<int>(json['m3Scale']),
      constancy: serializer.fromJson<String>(json['Constancy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      'm7Scale': serializer.toJson<int>(m7Scale),
      'm3Scale': serializer.toJson<int>(m3Scale),
      'Constancy': serializer.toJson<String>(constancy),
    };
  }

  NinGadScaleData copyWith(
          {int pid, int m7Scale, int m3Scale, String constancy}) =>
      NinGadScaleData(
        pid: pid ?? this.pid,
        m7Scale: m7Scale ?? this.m7Scale,
        m3Scale: m3Scale ?? this.m3Scale,
        constancy: constancy ?? this.constancy,
      );
  @override
  String toString() {
    return (StringBuffer('NinGadScaleData(')
          ..write('pid: $pid, ')
          ..write('m7Scale: $m7Scale, ')
          ..write('m3Scale: $m3Scale, ')
          ..write('constancy: $constancy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(pid.hashCode,
      $mrjc(m7Scale.hashCode, $mrjc(m3Scale.hashCode, constancy.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinGadScaleData &&
          other.pid == this.pid &&
          other.m7Scale == this.m7Scale &&
          other.m3Scale == this.m3Scale &&
          other.constancy == this.constancy);
}

class NinGadScaleCompanion extends UpdateCompanion<NinGadScaleData> {
  final Value<int> pid;
  final Value<int> m7Scale;
  final Value<int> m3Scale;
  final Value<String> constancy;
  const NinGadScaleCompanion({
    this.pid = const Value.absent(),
    this.m7Scale = const Value.absent(),
    this.m3Scale = const Value.absent(),
    this.constancy = const Value.absent(),
  });
  NinGadScaleCompanion.insert({
    this.pid = const Value.absent(),
    this.m7Scale = const Value.absent(),
    this.m3Scale = const Value.absent(),
    this.constancy = const Value.absent(),
  });
  static Insertable<NinGadScaleData> custom({
    Expression<int> pid,
    Expression<int> m7Scale,
    Expression<int> m3Scale,
    Expression<String> constancy,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (m7Scale != null) 'm7Scale': m7Scale,
      if (m3Scale != null) 'm3Scale': m3Scale,
      if (constancy != null) 'Constancy': constancy,
    });
  }

  NinGadScaleCompanion copyWith(
      {Value<int> pid,
      Value<int> m7Scale,
      Value<int> m3Scale,
      Value<String> constancy}) {
    return NinGadScaleCompanion(
      pid: pid ?? this.pid,
      m7Scale: m7Scale ?? this.m7Scale,
      m3Scale: m3Scale ?? this.m3Scale,
      constancy: constancy ?? this.constancy,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _m7ScaleMeta = const VerificationMeta('m7Scale');
  GeneratedIntColumn _m7Scale;
  GeneratedIntColumn get m7Scale => _m7Scale ??= _constructM7Scale();
  GeneratedIntColumn _constructM7Scale() {
    return GeneratedIntColumn('m7Scale', $tableName, true,
        $customConstraints: '');
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
  List<GeneratedColumn> get $columns => [pid, m7Scale, m3Scale, constancy];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
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
  Set<GeneratedColumn> get $primaryKey => {pid};
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
  List<String> get customConstraints =>
      const ['PRIMARY KEY (pid)', 'UNIQUE ("m7Scale")'];
  @override
  bool get dontWriteConstraints => true;
}

class NinSpecie extends DataClass implements Insertable<NinSpecie> {
  final int pid;
  final int scientificNameId;
  final String scientificName;
  final String author;
  final String vernacularName;
  NinSpecie(
      {@required this.pid,
      this.scientificNameId,
      this.scientificName,
      this.author,
      this.vernacularName});
  factory NinSpecie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinSpecie(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
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
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
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
      'pid': serializer.toJson<int>(pid),
      'scientificNameId': serializer.toJson<int>(scientificNameId),
      'scientificName': serializer.toJson<String>(scientificName),
      'author': serializer.toJson<String>(author),
      'vernacularName': serializer.toJson<String>(vernacularName),
    };
  }

  NinSpecie copyWith(
          {int pid,
          int scientificNameId,
          String scientificName,
          String author,
          String vernacularName}) =>
      NinSpecie(
        pid: pid ?? this.pid,
        scientificNameId: scientificNameId ?? this.scientificNameId,
        scientificName: scientificName ?? this.scientificName,
        author: author ?? this.author,
        vernacularName: vernacularName ?? this.vernacularName,
      );
  @override
  String toString() {
    return (StringBuffer('NinSpecie(')
          ..write('pid: $pid, ')
          ..write('scientificNameId: $scientificNameId, ')
          ..write('scientificName: $scientificName, ')
          ..write('author: $author, ')
          ..write('vernacularName: $vernacularName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      pid.hashCode,
      $mrjc(
          scientificNameId.hashCode,
          $mrjc(scientificName.hashCode,
              $mrjc(author.hashCode, vernacularName.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinSpecie &&
          other.pid == this.pid &&
          other.scientificNameId == this.scientificNameId &&
          other.scientificName == this.scientificName &&
          other.author == this.author &&
          other.vernacularName == this.vernacularName);
}

class NinSpeciesCompanion extends UpdateCompanion<NinSpecie> {
  final Value<int> pid;
  final Value<int> scientificNameId;
  final Value<String> scientificName;
  final Value<String> author;
  final Value<String> vernacularName;
  const NinSpeciesCompanion({
    this.pid = const Value.absent(),
    this.scientificNameId = const Value.absent(),
    this.scientificName = const Value.absent(),
    this.author = const Value.absent(),
    this.vernacularName = const Value.absent(),
  });
  NinSpeciesCompanion.insert({
    this.pid = const Value.absent(),
    this.scientificNameId = const Value.absent(),
    this.scientificName = const Value.absent(),
    this.author = const Value.absent(),
    this.vernacularName = const Value.absent(),
  });
  static Insertable<NinSpecie> custom({
    Expression<int> pid,
    Expression<int> scientificNameId,
    Expression<String> scientificName,
    Expression<String> author,
    Expression<String> vernacularName,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (scientificNameId != null) 'scientificNameId': scientificNameId,
      if (scientificName != null) 'scientificName': scientificName,
      if (author != null) 'author': author,
      if (vernacularName != null) 'vernacularName': vernacularName,
    });
  }

  NinSpeciesCompanion copyWith(
      {Value<int> pid,
      Value<int> scientificNameId,
      Value<String> scientificName,
      Value<String> author,
      Value<String> vernacularName}) {
    return NinSpeciesCompanion(
      pid: pid ?? this.pid,
      scientificNameId: scientificNameId ?? this.scientificNameId,
      scientificName: scientificName ?? this.scientificName,
      author: author ?? this.author,
      vernacularName: vernacularName ?? this.vernacularName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _scientificNameIdMeta =
      const VerificationMeta('scientificNameId');
  GeneratedIntColumn _scientificNameId;
  GeneratedIntColumn get scientificNameId =>
      _scientificNameId ??= _constructScientificNameId();
  GeneratedIntColumn _constructScientificNameId() {
    return GeneratedIntColumn('scientificNameId', $tableName, true,
        $customConstraints: '');
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
      [pid, scientificNameId, scientificName, author, vernacularName];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
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
  Set<GeneratedColumn> get $primaryKey => {pid};
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
      const ['PRIMARY KEY (pid)', 'UNIQUE ("scientificNameId")'];
  @override
  bool get dontWriteConstraints => true;
}

class NinDetailData extends DataClass implements Insertable<NinDetailData> {
  final int pid;
  final String id;
  final String languageId;
  final String key;
  final String value;
  NinDetailData(
      {@required this.pid, this.id, this.languageId, this.key, this.value});
  factory NinDetailData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinDetailData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
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
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
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
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'language_id': serializer.toJson<String>(languageId),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  NinDetailData copyWith(
          {int pid, String id, String languageId, String key, String value}) =>
      NinDetailData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        languageId: languageId ?? this.languageId,
        key: key ?? this.key,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('NinDetailData(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('languageId: $languageId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      pid.hashCode,
      $mrjc(id.hashCode,
          $mrjc(languageId.hashCode, $mrjc(key.hashCode, value.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinDetailData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.languageId == this.languageId &&
          other.key == this.key &&
          other.value == this.value);
}

class NinDetailCompanion extends UpdateCompanion<NinDetailData> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> languageId;
  final Value<String> key;
  final Value<String> value;
  const NinDetailCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.languageId = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
  });
  NinDetailCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.languageId = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
  });
  static Insertable<NinDetailData> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> languageId,
    Expression<String> key,
    Expression<String> value,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (languageId != null) 'language_id': languageId,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    });
  }

  NinDetailCompanion copyWith(
      {Value<int> pid,
      Value<String> id,
      Value<String> languageId,
      Value<String> key,
      Value<String> value}) {
    return NinDetailCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      languageId: languageId ?? this.languageId,
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _languageIdMeta = const VerificationMeta('languageId');
  GeneratedTextColumn _languageId;
  GeneratedTextColumn get languageId => _languageId ??= _constructLanguageId();
  GeneratedTextColumn _constructLanguageId() {
    return GeneratedTextColumn('language_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _keyMeta = const VerificationMeta('key');
  GeneratedTextColumn _key;
  GeneratedTextColumn get key => _key ??= _constructKey();
  GeneratedTextColumn _constructKey() {
    return GeneratedTextColumn('key', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedTextColumn _value;
  GeneratedTextColumn get value => _value ??= _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn('value', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [pid, id, languageId, key, value];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    }
    if (data.containsKey('language_id')) {
      context.handle(
          _languageIdMeta,
          languageId.isAcceptableOrUnknown(
              data['language_id'], _languageIdMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key'], _keyMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'FOREIGN KEY(language_id) REFERENCES "nin_Language" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMajorTypeGroupData extends DataClass
    implements Insertable<NinMajorTypeGroupData> {
  final int pid;
  final String id;
  final String detailId;
  NinMajorTypeGroupData({@required this.pid, this.id, this.detailId});
  factory NinMajorTypeGroupData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinMajorTypeGroupData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
      id: serializer.fromJson<String>(json['_id']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinMajorTypeGroupData copyWith({int pid, String id, String detailId}) =>
      NinMajorTypeGroupData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinMajorTypeGroupData(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(pid.hashCode, $mrjc(id.hashCode, detailId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMajorTypeGroupData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.detailId == this.detailId);
}

class NinMajorTypeGroupCompanion
    extends UpdateCompanion<NinMajorTypeGroupData> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> detailId;
  const NinMajorTypeGroupCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinMajorTypeGroupCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  static Insertable<NinMajorTypeGroupData> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinMajorTypeGroupCompanion copyWith(
      {Value<int> pid, Value<String> id, Value<String> detailId}) {
    return NinMajorTypeGroupCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [pid, id, detailId];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'UNIQUE (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinStructuringProces extends DataClass
    implements Insertable<NinStructuringProces> {
  final int pid;
  final String id;
  final String detailId;
  NinStructuringProces({@required this.pid, this.id, this.detailId});
  factory NinStructuringProces.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinStructuringProces(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
      id: serializer.fromJson<String>(json['_id']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinStructuringProces copyWith({int pid, String id, String detailId}) =>
      NinStructuringProces(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinStructuringProces(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(pid.hashCode, $mrjc(id.hashCode, detailId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinStructuringProces &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.detailId == this.detailId);
}

class NinStructuringProcessCompanion
    extends UpdateCompanion<NinStructuringProces> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> detailId;
  const NinStructuringProcessCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinStructuringProcessCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  static Insertable<NinStructuringProces> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinStructuringProcessCompanion copyWith(
      {Value<int> pid, Value<String> id, Value<String> detailId}) {
    return NinStructuringProcessCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [pid, id, detailId];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'UNIQUE (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinPatternOfVariationData extends DataClass
    implements Insertable<NinPatternOfVariationData> {
  final int pid;
  final String id;
  final String detailId;
  NinPatternOfVariationData({@required this.pid, this.id, this.detailId});
  factory NinPatternOfVariationData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinPatternOfVariationData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
      id: serializer.fromJson<String>(json['_id']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinPatternOfVariationData copyWith({int pid, String id, String detailId}) =>
      NinPatternOfVariationData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinPatternOfVariationData(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(pid.hashCode, $mrjc(id.hashCode, detailId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinPatternOfVariationData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.detailId == this.detailId);
}

class NinPatternOfVariationCompanion
    extends UpdateCompanion<NinPatternOfVariationData> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> detailId;
  const NinPatternOfVariationCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinPatternOfVariationCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  static Insertable<NinPatternOfVariationData> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinPatternOfVariationCompanion copyWith(
      {Value<int> pid, Value<String> id, Value<String> detailId}) {
    return NinPatternOfVariationCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [pid, id, detailId];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'UNIQUE (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinLECTypeData extends DataClass implements Insertable<NinLECTypeData> {
  final int pid;
  final String id;
  final String detailId;
  NinLECTypeData({@required this.pid, this.id, this.detailId});
  factory NinLECTypeData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinLECTypeData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
      id: serializer.fromJson<String>(json['_id']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinLECTypeData copyWith({int pid, String id, String detailId}) =>
      NinLECTypeData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinLECTypeData(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(pid.hashCode, $mrjc(id.hashCode, detailId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinLECTypeData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.detailId == this.detailId);
}

class NinLECTypeCompanion extends UpdateCompanion<NinLECTypeData> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> detailId;
  const NinLECTypeCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinLECTypeCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  static Insertable<NinLECTypeData> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinLECTypeCompanion copyWith(
      {Value<int> pid, Value<String> id, Value<String> detailId}) {
    return NinLECTypeCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [pid, id, detailId];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'UNIQUE (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMajorTypeData extends DataClass
    implements Insertable<NinMajorTypeData> {
  final int pid;
  final String id;
  final String majorTypeGroupId;
  final int order;
  final String detailId;
  NinMajorTypeData(
      {@required this.pid,
      this.id,
      this.majorTypeGroupId,
      this.order,
      this.detailId});
  factory NinMajorTypeData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinMajorTypeData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
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
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
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
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'majorTypeGroup_id': serializer.toJson<String>(majorTypeGroupId),
      'order': serializer.toJson<int>(order),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinMajorTypeData copyWith(
          {int pid,
          String id,
          String majorTypeGroupId,
          int order,
          String detailId}) =>
      NinMajorTypeData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        majorTypeGroupId: majorTypeGroupId ?? this.majorTypeGroupId,
        order: order ?? this.order,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinMajorTypeData(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('majorTypeGroupId: $majorTypeGroupId, ')
          ..write('order: $order, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      pid.hashCode,
      $mrjc(
          id.hashCode,
          $mrjc(majorTypeGroupId.hashCode,
              $mrjc(order.hashCode, detailId.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMajorTypeData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.majorTypeGroupId == this.majorTypeGroupId &&
          other.order == this.order &&
          other.detailId == this.detailId);
}

class NinMajorTypeCompanion extends UpdateCompanion<NinMajorTypeData> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> majorTypeGroupId;
  final Value<int> order;
  final Value<String> detailId;
  const NinMajorTypeCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.majorTypeGroupId = const Value.absent(),
    this.order = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinMajorTypeCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.majorTypeGroupId = const Value.absent(),
    this.order = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  static Insertable<NinMajorTypeData> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> majorTypeGroupId,
    Expression<int> order,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (majorTypeGroupId != null) 'majorTypeGroup_id': majorTypeGroupId,
      if (order != null) 'order': order,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinMajorTypeCompanion copyWith(
      {Value<int> pid,
      Value<String> id,
      Value<String> majorTypeGroupId,
      Value<int> order,
      Value<String> detailId}) {
    return NinMajorTypeCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      majorTypeGroupId: majorTypeGroupId ?? this.majorTypeGroupId,
      order: order ?? this.order,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
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
  List<GeneratedColumn> get $columns =>
      [pid, id, majorTypeGroupId, order, detailId];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
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
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'UNIQUE (_id)',
        'FOREIGN KEY("majorTypeGroup_id") REFERENCES "nin_MajorTypeGroup" (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinLECData extends DataClass implements Insertable<NinLECData> {
  final int pid;
  final String id;
  final String parentLecId;
  final String structuringProcessId;
  final String patternOfVariationId;
  final int knowledgeBaseRelations;
  final int knowledgeBaseDivision;
  final int spatialScale;
  final String detailId;
  NinLECData(
      {@required this.pid,
      this.id,
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
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinLECData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
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
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
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
      'pid': serializer.toJson<int>(pid),
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
          {int pid,
          String id,
          String parentLecId,
          String structuringProcessId,
          String patternOfVariationId,
          int knowledgeBaseRelations,
          int knowledgeBaseDivision,
          int spatialScale,
          String detailId}) =>
      NinLECData(
        pid: pid ?? this.pid,
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
          ..write('pid: $pid, ')
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
      pid.hashCode,
      $mrjc(
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
                              $mrjc(spatialScale.hashCode,
                                  detailId.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinLECData &&
          other.pid == this.pid &&
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
  final Value<int> pid;
  final Value<String> id;
  final Value<String> parentLecId;
  final Value<String> structuringProcessId;
  final Value<String> patternOfVariationId;
  final Value<int> knowledgeBaseRelations;
  final Value<int> knowledgeBaseDivision;
  final Value<int> spatialScale;
  final Value<String> detailId;
  const NinLECCompanion({
    this.pid = const Value.absent(),
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
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.parentLecId = const Value.absent(),
    this.structuringProcessId = const Value.absent(),
    this.patternOfVariationId = const Value.absent(),
    this.knowledgeBaseRelations = const Value.absent(),
    this.knowledgeBaseDivision = const Value.absent(),
    this.spatialScale = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  static Insertable<NinLECData> custom({
    Expression<int> pid,
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
      if (pid != null) 'pid': pid,
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
      {Value<int> pid,
      Value<String> id,
      Value<String> parentLecId,
      Value<String> structuringProcessId,
      Value<String> patternOfVariationId,
      Value<int> knowledgeBaseRelations,
      Value<int> knowledgeBaseDivision,
      Value<int> spatialScale,
      Value<String> detailId}) {
    return NinLECCompanion(
      pid: pid ?? this.pid,
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
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
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
        pid,
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
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
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'UNIQUE (_id)',
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
  final int pid;
  final String id;
  final String majorTypeId;
  final String detailId;
  NinMinorTypeData(
      {@required this.pid, this.id, this.majorTypeId, this.detailId});
  factory NinMinorTypeData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinMinorTypeData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      majorTypeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorType_id']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
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
      pid: serializer.fromJson<int>(json['pid']),
      id: serializer.fromJson<String>(json['_id']),
      majorTypeId: serializer.fromJson<String>(json['majorType_id']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'majorType_id': serializer.toJson<String>(majorTypeId),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinMinorTypeData copyWith(
          {int pid, String id, String majorTypeId, String detailId}) =>
      NinMinorTypeData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        majorTypeId: majorTypeId ?? this.majorTypeId,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinMinorTypeData(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(pid.hashCode,
      $mrjc(id.hashCode, $mrjc(majorTypeId.hashCode, detailId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMinorTypeData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.majorTypeId == this.majorTypeId &&
          other.detailId == this.detailId);
}

class NinMinorTypeCompanion extends UpdateCompanion<NinMinorTypeData> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> majorTypeId;
  final Value<String> detailId;
  const NinMinorTypeCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinMinorTypeCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  static Insertable<NinMinorTypeData> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> majorTypeId,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (majorTypeId != null) 'majorType_id': majorTypeId,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinMinorTypeCompanion copyWith(
      {Value<int> pid,
      Value<String> id,
      Value<String> majorTypeId,
      Value<String> detailId}) {
    return NinMinorTypeCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      majorTypeId: majorTypeId ?? this.majorTypeId,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
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
          ..write('pid: $pid, ')
          ..write('id: $id, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
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
  List<GeneratedColumn> get $columns => [pid, id, majorTypeId, detailId];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
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
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'UNIQUE (_id)',
        'FOREIGN KEY("majorType_id") REFERENCES "nin_MajorType" (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMajorTypeLECData extends DataClass
    implements Insertable<NinMajorTypeLECData> {
  final int pid;
  final String id;
  final String lecId;
  final String majorTypeId;
  final String lecTypeId;
  final int axis;
  NinMajorTypeLECData(
      {@required this.pid,
      this.id,
      this.lecId,
      this.majorTypeId,
      this.lecTypeId,
      this.axis});
  factory NinMajorTypeLECData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinMajorTypeLECData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
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
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
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
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'lec_id': serializer.toJson<String>(lecId),
      'majorType_id': serializer.toJson<String>(majorTypeId),
      'lecType_id': serializer.toJson<String>(lecTypeId),
      'axis': serializer.toJson<int>(axis),
    };
  }

  NinMajorTypeLECData copyWith(
          {int pid,
          String id,
          String lecId,
          String majorTypeId,
          String lecTypeId,
          int axis}) =>
      NinMajorTypeLECData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        lecId: lecId ?? this.lecId,
        majorTypeId: majorTypeId ?? this.majorTypeId,
        lecTypeId: lecTypeId ?? this.lecTypeId,
        axis: axis ?? this.axis,
      );
  @override
  String toString() {
    return (StringBuffer('NinMajorTypeLECData(')
          ..write('pid: $pid, ')
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
      pid.hashCode,
      $mrjc(
          id.hashCode,
          $mrjc(
              lecId.hashCode,
              $mrjc(majorTypeId.hashCode,
                  $mrjc(lecTypeId.hashCode, axis.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMajorTypeLECData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.lecId == this.lecId &&
          other.majorTypeId == this.majorTypeId &&
          other.lecTypeId == this.lecTypeId &&
          other.axis == this.axis);
}

class NinMajorTypeLECCompanion extends UpdateCompanion<NinMajorTypeLECData> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> lecId;
  final Value<String> majorTypeId;
  final Value<String> lecTypeId;
  final Value<int> axis;
  const NinMajorTypeLECCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.lecId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.lecTypeId = const Value.absent(),
    this.axis = const Value.absent(),
  });
  NinMajorTypeLECCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.lecId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.lecTypeId = const Value.absent(),
    this.axis = const Value.absent(),
  });
  static Insertable<NinMajorTypeLECData> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> lecId,
    Expression<String> majorTypeId,
    Expression<String> lecTypeId,
    Expression<int> axis,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (lecId != null) 'lec_id': lecId,
      if (majorTypeId != null) 'majorType_id': majorTypeId,
      if (lecTypeId != null) 'lecType_id': lecTypeId,
      if (axis != null) 'axis': axis,
    });
  }

  NinMajorTypeLECCompanion copyWith(
      {Value<int> pid,
      Value<String> id,
      Value<String> lecId,
      Value<String> majorTypeId,
      Value<String> lecTypeId,
      Value<int> axis}) {
    return NinMajorTypeLECCompanion(
      pid: pid ?? this.pid,
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
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
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
      [pid, id, lecId, majorTypeId, lecTypeId, axis];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
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
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'UNIQUE (_id)',
        'FOREIGN KEY(lec_id) REFERENCES "nin_LEC" (_id)',
        'FOREIGN KEY("majorType_id") REFERENCES "nin_MajorType" (_id)',
        'FOREIGN KEY("lecType_id") REFERENCES "nin_LECType" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinElementarySegmentData extends DataClass
    implements Insertable<NinElementarySegmentData> {
  final int pid;
  final String id;
  final String lecId;
  final String value;
  final int order;
  NinElementarySegmentData(
      {@required this.pid, this.id, this.lecId, this.value, this.order});
  factory NinElementarySegmentData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinElementarySegmentData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
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
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
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
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'lec_id': serializer.toJson<String>(lecId),
      'value': serializer.toJson<String>(value),
      'order': serializer.toJson<int>(order),
    };
  }

  NinElementarySegmentData copyWith(
          {int pid, String id, String lecId, String value, int order}) =>
      NinElementarySegmentData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        lecId: lecId ?? this.lecId,
        value: value ?? this.value,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentData(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('lecId: $lecId, ')
          ..write('value: $value, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      pid.hashCode,
      $mrjc(id.hashCode,
          $mrjc(lecId.hashCode, $mrjc(value.hashCode, order.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinElementarySegmentData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.lecId == this.lecId &&
          other.value == this.value &&
          other.order == this.order);
}

class NinElementarySegmentCompanion
    extends UpdateCompanion<NinElementarySegmentData> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> lecId;
  final Value<String> value;
  final Value<int> order;
  const NinElementarySegmentCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.lecId = const Value.absent(),
    this.value = const Value.absent(),
    this.order = const Value.absent(),
  });
  NinElementarySegmentCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.lecId = const Value.absent(),
    this.value = const Value.absent(),
    this.order = const Value.absent(),
  });
  static Insertable<NinElementarySegmentData> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> lecId,
    Expression<String> value,
    Expression<int> order,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (lecId != null) 'lec_id': lecId,
      if (value != null) 'value': value,
      if (order != null) 'order': order,
    });
  }

  NinElementarySegmentCompanion copyWith(
      {Value<int> pid,
      Value<String> id,
      Value<String> lecId,
      Value<String> value,
      Value<int> order}) {
    return NinElementarySegmentCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      lecId: lecId ?? this.lecId,
      value: value ?? this.value,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
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

  final VerificationMeta _orderMeta = const VerificationMeta('order');
  GeneratedIntColumn _order;
  GeneratedIntColumn get order => _order ??= _constructOrder();
  GeneratedIntColumn _constructOrder() {
    return GeneratedIntColumn('order', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [pid, id, lecId, value, order];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    }
    if (data.containsKey('lec_id')) {
      context.handle(
          _lecIdMeta, lecId.isAcceptableOrUnknown(data['lec_id'], _lecIdMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order'], _orderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'UNIQUE (_id)',
        'FOREIGN KEY(lec_id) REFERENCES "nin_LEC" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMinorTypeScaledData extends DataClass
    implements Insertable<NinMinorTypeScaledData> {
  final int pid;
  final String id;
  final String minorTypeId;
  final int mappingScaleId;
  final String detailId;
  final int isImplemented;
  NinMinorTypeScaledData(
      {@required this.pid,
      this.id,
      this.minorTypeId,
      this.mappingScaleId,
      this.detailId,
      this.isImplemented});
  factory NinMinorTypeScaledData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinMinorTypeScaledData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      minorTypeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}minorType_id']),
      mappingScaleId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}mappingScale_id']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
      isImplemented: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_implemented']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || minorTypeId != null) {
      map['minorType_id'] = Variable<String>(minorTypeId);
    }
    if (!nullToAbsent || mappingScaleId != null) {
      map['mappingScale_id'] = Variable<int>(mappingScaleId);
    }
    if (!nullToAbsent || detailId != null) {
      map['detail_id'] = Variable<String>(detailId);
    }
    if (!nullToAbsent || isImplemented != null) {
      map['is_implemented'] = Variable<int>(isImplemented);
    }
    return map;
  }

  NinMinorTypeScaledCompanion toCompanion(bool nullToAbsent) {
    return NinMinorTypeScaledCompanion(
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      minorTypeId: minorTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(minorTypeId),
      mappingScaleId: mappingScaleId == null && nullToAbsent
          ? const Value.absent()
          : Value(mappingScaleId),
      detailId: detailId == null && nullToAbsent
          ? const Value.absent()
          : Value(detailId),
      isImplemented: isImplemented == null && nullToAbsent
          ? const Value.absent()
          : Value(isImplemented),
    );
  }

  factory NinMinorTypeScaledData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMinorTypeScaledData(
      pid: serializer.fromJson<int>(json['pid']),
      id: serializer.fromJson<String>(json['_id']),
      minorTypeId: serializer.fromJson<String>(json['minorType_id']),
      mappingScaleId: serializer.fromJson<int>(json['mappingScale_id']),
      detailId: serializer.fromJson<String>(json['detail_id']),
      isImplemented: serializer.fromJson<int>(json['is_implemented']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'minorType_id': serializer.toJson<String>(minorTypeId),
      'mappingScale_id': serializer.toJson<int>(mappingScaleId),
      'detail_id': serializer.toJson<String>(detailId),
      'is_implemented': serializer.toJson<int>(isImplemented),
    };
  }

  NinMinorTypeScaledData copyWith(
          {int pid,
          String id,
          String minorTypeId,
          int mappingScaleId,
          String detailId,
          int isImplemented}) =>
      NinMinorTypeScaledData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        minorTypeId: minorTypeId ?? this.minorTypeId,
        mappingScaleId: mappingScaleId ?? this.mappingScaleId,
        detailId: detailId ?? this.detailId,
        isImplemented: isImplemented ?? this.isImplemented,
      );
  @override
  String toString() {
    return (StringBuffer('NinMinorTypeScaledData(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('minorTypeId: $minorTypeId, ')
          ..write('mappingScaleId: $mappingScaleId, ')
          ..write('detailId: $detailId, ')
          ..write('isImplemented: $isImplemented')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      pid.hashCode,
      $mrjc(
          id.hashCode,
          $mrjc(
              minorTypeId.hashCode,
              $mrjc(mappingScaleId.hashCode,
                  $mrjc(detailId.hashCode, isImplemented.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMinorTypeScaledData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.minorTypeId == this.minorTypeId &&
          other.mappingScaleId == this.mappingScaleId &&
          other.detailId == this.detailId &&
          other.isImplemented == this.isImplemented);
}

class NinMinorTypeScaledCompanion
    extends UpdateCompanion<NinMinorTypeScaledData> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> minorTypeId;
  final Value<int> mappingScaleId;
  final Value<String> detailId;
  final Value<int> isImplemented;
  const NinMinorTypeScaledCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.minorTypeId = const Value.absent(),
    this.mappingScaleId = const Value.absent(),
    this.detailId = const Value.absent(),
    this.isImplemented = const Value.absent(),
  });
  NinMinorTypeScaledCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.minorTypeId = const Value.absent(),
    this.mappingScaleId = const Value.absent(),
    this.detailId = const Value.absent(),
    this.isImplemented = const Value.absent(),
  });
  static Insertable<NinMinorTypeScaledData> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> minorTypeId,
    Expression<int> mappingScaleId,
    Expression<String> detailId,
    Expression<int> isImplemented,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (minorTypeId != null) 'minorType_id': minorTypeId,
      if (mappingScaleId != null) 'mappingScale_id': mappingScaleId,
      if (detailId != null) 'detail_id': detailId,
      if (isImplemented != null) 'is_implemented': isImplemented,
    });
  }

  NinMinorTypeScaledCompanion copyWith(
      {Value<int> pid,
      Value<String> id,
      Value<String> minorTypeId,
      Value<int> mappingScaleId,
      Value<String> detailId,
      Value<int> isImplemented}) {
    return NinMinorTypeScaledCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      minorTypeId: minorTypeId ?? this.minorTypeId,
      mappingScaleId: mappingScaleId ?? this.mappingScaleId,
      detailId: detailId ?? this.detailId,
      isImplemented: isImplemented ?? this.isImplemented,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (minorTypeId.present) {
      map['minorType_id'] = Variable<String>(minorTypeId.value);
    }
    if (mappingScaleId.present) {
      map['mappingScale_id'] = Variable<int>(mappingScaleId.value);
    }
    if (detailId.present) {
      map['detail_id'] = Variable<String>(detailId.value);
    }
    if (isImplemented.present) {
      map['is_implemented'] = Variable<int>(isImplemented.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinMinorTypeScaledCompanion(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('minorTypeId: $minorTypeId, ')
          ..write('mappingScaleId: $mappingScaleId, ')
          ..write('detailId: $detailId, ')
          ..write('isImplemented: $isImplemented')
          ..write(')'))
        .toString();
  }
}

class NinMinorTypeScaled extends Table
    with TableInfo<NinMinorTypeScaled, NinMinorTypeScaledData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinMinorTypeScaled(this._db, [this._alias]);
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _minorTypeIdMeta =
      const VerificationMeta('minorTypeId');
  GeneratedTextColumn _minorTypeId;
  GeneratedTextColumn get minorTypeId =>
      _minorTypeId ??= _constructMinorTypeId();
  GeneratedTextColumn _constructMinorTypeId() {
    return GeneratedTextColumn('minorType_id', $tableName, true,
        $customConstraints: '');
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

  final VerificationMeta _detailIdMeta = const VerificationMeta('detailId');
  GeneratedTextColumn _detailId;
  GeneratedTextColumn get detailId => _detailId ??= _constructDetailId();
  GeneratedTextColumn _constructDetailId() {
    return GeneratedTextColumn('detail_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _isImplementedMeta =
      const VerificationMeta('isImplemented');
  GeneratedIntColumn _isImplemented;
  GeneratedIntColumn get isImplemented =>
      _isImplemented ??= _constructIsImplemented();
  GeneratedIntColumn _constructIsImplemented() {
    return GeneratedIntColumn('is_implemented', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [pid, id, minorTypeId, mappingScaleId, detailId, isImplemented];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    }
    if (data.containsKey('minorType_id')) {
      context.handle(
          _minorTypeIdMeta,
          minorTypeId.isAcceptableOrUnknown(
              data['minorType_id'], _minorTypeIdMeta));
    }
    if (data.containsKey('mappingScale_id')) {
      context.handle(
          _mappingScaleIdMeta,
          mappingScaleId.isAcceptableOrUnknown(
              data['mappingScale_id'], _mappingScaleIdMeta));
    }
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id'], _detailIdMeta));
    }
    if (data.containsKey('is_implemented')) {
      context.handle(
          _isImplementedMeta,
          isImplemented.isAcceptableOrUnknown(
              data['is_implemented'], _isImplementedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'FOREIGN KEY("minorType_id") REFERENCES "nin_MinorType" (_id)',
        'FOREIGN KEY("mappingScale_id") REFERENCES "nin_MappingScale" (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinElementarySegmentGroupData extends DataClass
    implements Insertable<NinElementarySegmentGroupData> {
  final int pid;
  final String id;
  final String elementarySegmentId;
  final String majorTypeId;
  final String lecId;
  NinElementarySegmentGroupData(
      {@required this.pid,
      this.id,
      this.elementarySegmentId,
      this.majorTypeId,
      this.lecId});
  factory NinElementarySegmentGroupData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinElementarySegmentGroupData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      elementarySegmentId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}elementarySegment_id']),
      majorTypeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorType_id']),
      lecId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}lec_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || elementarySegmentId != null) {
      map['elementarySegment_id'] = Variable<String>(elementarySegmentId);
    }
    if (!nullToAbsent || majorTypeId != null) {
      map['majorType_id'] = Variable<String>(majorTypeId);
    }
    if (!nullToAbsent || lecId != null) {
      map['lec_id'] = Variable<String>(lecId);
    }
    return map;
  }

  NinElementarySegmentGroupCompanion toCompanion(bool nullToAbsent) {
    return NinElementarySegmentGroupCompanion(
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      elementarySegmentId: elementarySegmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(elementarySegmentId),
      majorTypeId: majorTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeId),
      lecId:
          lecId == null && nullToAbsent ? const Value.absent() : Value(lecId),
    );
  }

  factory NinElementarySegmentGroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinElementarySegmentGroupData(
      pid: serializer.fromJson<int>(json['pid']),
      id: serializer.fromJson<String>(json['_id']),
      elementarySegmentId:
          serializer.fromJson<String>(json['elementarySegment_id']),
      majorTypeId: serializer.fromJson<String>(json['majorType_id']),
      lecId: serializer.fromJson<String>(json['lec_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'elementarySegment_id': serializer.toJson<String>(elementarySegmentId),
      'majorType_id': serializer.toJson<String>(majorTypeId),
      'lec_id': serializer.toJson<String>(lecId),
    };
  }

  NinElementarySegmentGroupData copyWith(
          {int pid,
          String id,
          String elementarySegmentId,
          String majorTypeId,
          String lecId}) =>
      NinElementarySegmentGroupData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        elementarySegmentId: elementarySegmentId ?? this.elementarySegmentId,
        majorTypeId: majorTypeId ?? this.majorTypeId,
        lecId: lecId ?? this.lecId,
      );
  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentGroupData(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('elementarySegmentId: $elementarySegmentId, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('lecId: $lecId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      pid.hashCode,
      $mrjc(
          id.hashCode,
          $mrjc(elementarySegmentId.hashCode,
              $mrjc(majorTypeId.hashCode, lecId.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinElementarySegmentGroupData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.elementarySegmentId == this.elementarySegmentId &&
          other.majorTypeId == this.majorTypeId &&
          other.lecId == this.lecId);
}

class NinElementarySegmentGroupCompanion
    extends UpdateCompanion<NinElementarySegmentGroupData> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> elementarySegmentId;
  final Value<String> majorTypeId;
  final Value<String> lecId;
  const NinElementarySegmentGroupCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.elementarySegmentId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.lecId = const Value.absent(),
  });
  NinElementarySegmentGroupCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.elementarySegmentId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.lecId = const Value.absent(),
  });
  static Insertable<NinElementarySegmentGroupData> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> elementarySegmentId,
    Expression<String> majorTypeId,
    Expression<String> lecId,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (elementarySegmentId != null)
        'elementarySegment_id': elementarySegmentId,
      if (majorTypeId != null) 'majorType_id': majorTypeId,
      if (lecId != null) 'lec_id': lecId,
    });
  }

  NinElementarySegmentGroupCompanion copyWith(
      {Value<int> pid,
      Value<String> id,
      Value<String> elementarySegmentId,
      Value<String> majorTypeId,
      Value<String> lecId}) {
    return NinElementarySegmentGroupCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      elementarySegmentId: elementarySegmentId ?? this.elementarySegmentId,
      majorTypeId: majorTypeId ?? this.majorTypeId,
      lecId: lecId ?? this.lecId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (elementarySegmentId.present) {
      map['elementarySegment_id'] = Variable<String>(elementarySegmentId.value);
    }
    if (majorTypeId.present) {
      map['majorType_id'] = Variable<String>(majorTypeId.value);
    }
    if (lecId.present) {
      map['lec_id'] = Variable<String>(lecId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentGroupCompanion(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('elementarySegmentId: $elementarySegmentId, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('lecId: $lecId')
          ..write(')'))
        .toString();
  }
}

class NinElementarySegmentGroup extends Table
    with TableInfo<NinElementarySegmentGroup, NinElementarySegmentGroupData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinElementarySegmentGroup(this._db, [this._alias]);
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _elementarySegmentIdMeta =
      const VerificationMeta('elementarySegmentId');
  GeneratedTextColumn _elementarySegmentId;
  GeneratedTextColumn get elementarySegmentId =>
      _elementarySegmentId ??= _constructElementarySegmentId();
  GeneratedTextColumn _constructElementarySegmentId() {
    return GeneratedTextColumn('elementarySegment_id', $tableName, true,
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

  final VerificationMeta _lecIdMeta = const VerificationMeta('lecId');
  GeneratedTextColumn _lecId;
  GeneratedTextColumn get lecId => _lecId ??= _constructLecId();
  GeneratedTextColumn _constructLecId() {
    return GeneratedTextColumn('lec_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [pid, id, elementarySegmentId, majorTypeId, lecId];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    }
    if (data.containsKey('elementarySegment_id')) {
      context.handle(
          _elementarySegmentIdMeta,
          elementarySegmentId.isAcceptableOrUnknown(
              data['elementarySegment_id'], _elementarySegmentIdMeta));
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'FOREIGN KEY("elementarySegment_id") REFERENCES "nin_ElementarySegment" (_id)',
        'FOREIGN KEY("majorType_id") REFERENCES "nin_MajorType" (_id)',
        'FOREIGN KEY(lec_id) REFERENCES "nin_LEC" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinStandardSegmentData extends DataClass
    implements Insertable<NinStandardSegmentData> {
  final int pid;
  final String id;
  final String majorTypeLECId;
  final int order;
  final String detailId;
  NinStandardSegmentData(
      {@required this.pid,
      this.id,
      this.majorTypeLECId,
      this.order,
      this.detailId});
  factory NinStandardSegmentData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinStandardSegmentData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      majorTypeLECId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorTypeLEC_id']),
      order: intType.mapFromDatabaseResponse(data['${effectivePrefix}order']),
      detailId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}detail_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || majorTypeLECId != null) {
      map['majorTypeLEC_id'] = Variable<String>(majorTypeLECId);
    }
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    if (!nullToAbsent || detailId != null) {
      map['detail_id'] = Variable<String>(detailId);
    }
    return map;
  }

  NinStandardSegmentCompanion toCompanion(bool nullToAbsent) {
    return NinStandardSegmentCompanion(
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      majorTypeLECId: majorTypeLECId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeLECId),
      order:
          order == null && nullToAbsent ? const Value.absent() : Value(order),
      detailId: detailId == null && nullToAbsent
          ? const Value.absent()
          : Value(detailId),
    );
  }

  factory NinStandardSegmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinStandardSegmentData(
      pid: serializer.fromJson<int>(json['pid']),
      id: serializer.fromJson<String>(json['_id']),
      majorTypeLECId: serializer.fromJson<String>(json['majorTypeLEC_id']),
      order: serializer.fromJson<int>(json['order']),
      detailId: serializer.fromJson<String>(json['detail_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'majorTypeLEC_id': serializer.toJson<String>(majorTypeLECId),
      'order': serializer.toJson<int>(order),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinStandardSegmentData copyWith(
          {int pid,
          String id,
          String majorTypeLECId,
          int order,
          String detailId}) =>
      NinStandardSegmentData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        majorTypeLECId: majorTypeLECId ?? this.majorTypeLECId,
        order: order ?? this.order,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinStandardSegmentData(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('majorTypeLECId: $majorTypeLECId, ')
          ..write('order: $order, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      pid.hashCode,
      $mrjc(
          id.hashCode,
          $mrjc(majorTypeLECId.hashCode,
              $mrjc(order.hashCode, detailId.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinStandardSegmentData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.majorTypeLECId == this.majorTypeLECId &&
          other.order == this.order &&
          other.detailId == this.detailId);
}

class NinStandardSegmentCompanion
    extends UpdateCompanion<NinStandardSegmentData> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> majorTypeLECId;
  final Value<int> order;
  final Value<String> detailId;
  const NinStandardSegmentCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.majorTypeLECId = const Value.absent(),
    this.order = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinStandardSegmentCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.majorTypeLECId = const Value.absent(),
    this.order = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  static Insertable<NinStandardSegmentData> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> majorTypeLECId,
    Expression<int> order,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (majorTypeLECId != null) 'majorTypeLEC_id': majorTypeLECId,
      if (order != null) 'order': order,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinStandardSegmentCompanion copyWith(
      {Value<int> pid,
      Value<String> id,
      Value<String> majorTypeLECId,
      Value<int> order,
      Value<String> detailId}) {
    return NinStandardSegmentCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      majorTypeLECId: majorTypeLECId ?? this.majorTypeLECId,
      order: order ?? this.order,
      detailId: detailId ?? this.detailId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (majorTypeLECId.present) {
      map['majorTypeLEC_id'] = Variable<String>(majorTypeLECId.value);
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
    return (StringBuffer('NinStandardSegmentCompanion(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('majorTypeLECId: $majorTypeLECId, ')
          ..write('order: $order, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
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
  List<GeneratedColumn> get $columns =>
      [pid, id, majorTypeLECId, order, detailId];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    }
    if (data.containsKey('majorTypeLEC_id')) {
      context.handle(
          _majorTypeLECIdMeta,
          majorTypeLECId.isAcceptableOrUnknown(
              data['majorTypeLEC_id'], _majorTypeLECIdMeta));
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
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'UNIQUE (_id)',
        'FOREIGN KEY("majorTypeLEC_id") REFERENCES "nin_MajorTypeLEC" (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinGadModifierData extends DataClass
    implements Insertable<NinGadModifierData> {
  final int pid;
  final String majorTypeLECId;
  final String majorTypeId;
  final String lecId;
  final int speciesId;
  final int value;
  NinGadModifierData(
      {@required this.pid,
      this.majorTypeLECId,
      this.majorTypeId,
      this.lecId,
      this.speciesId,
      this.value});
  factory NinGadModifierData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinGadModifierData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
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
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
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
      'pid': serializer.toJson<int>(pid),
      'majorTypeLEC_id': serializer.toJson<String>(majorTypeLECId),
      'majorType_id': serializer.toJson<String>(majorTypeId),
      'lec_id': serializer.toJson<String>(lecId),
      'species_id': serializer.toJson<int>(speciesId),
      'value': serializer.toJson<int>(value),
    };
  }

  NinGadModifierData copyWith(
          {int pid,
          String majorTypeLECId,
          String majorTypeId,
          String lecId,
          int speciesId,
          int value}) =>
      NinGadModifierData(
        pid: pid ?? this.pid,
        majorTypeLECId: majorTypeLECId ?? this.majorTypeLECId,
        majorTypeId: majorTypeId ?? this.majorTypeId,
        lecId: lecId ?? this.lecId,
        speciesId: speciesId ?? this.speciesId,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('NinGadModifierData(')
          ..write('pid: $pid, ')
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
      pid.hashCode,
      $mrjc(
          majorTypeLECId.hashCode,
          $mrjc(
              majorTypeId.hashCode,
              $mrjc(lecId.hashCode,
                  $mrjc(speciesId.hashCode, value.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinGadModifierData &&
          other.pid == this.pid &&
          other.majorTypeLECId == this.majorTypeLECId &&
          other.majorTypeId == this.majorTypeId &&
          other.lecId == this.lecId &&
          other.speciesId == this.speciesId &&
          other.value == this.value);
}

class NinGadModifierCompanion extends UpdateCompanion<NinGadModifierData> {
  final Value<int> pid;
  final Value<String> majorTypeLECId;
  final Value<String> majorTypeId;
  final Value<String> lecId;
  final Value<int> speciesId;
  final Value<int> value;
  const NinGadModifierCompanion({
    this.pid = const Value.absent(),
    this.majorTypeLECId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.lecId = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.value = const Value.absent(),
  });
  NinGadModifierCompanion.insert({
    this.pid = const Value.absent(),
    this.majorTypeLECId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.lecId = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.value = const Value.absent(),
  });
  static Insertable<NinGadModifierData> custom({
    Expression<int> pid,
    Expression<String> majorTypeLECId,
    Expression<String> majorTypeId,
    Expression<String> lecId,
    Expression<int> speciesId,
    Expression<int> value,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (majorTypeLECId != null) 'majorTypeLEC_id': majorTypeLECId,
      if (majorTypeId != null) 'majorType_id': majorTypeId,
      if (lecId != null) 'lec_id': lecId,
      if (speciesId != null) 'species_id': speciesId,
      if (value != null) 'value': value,
    });
  }

  NinGadModifierCompanion copyWith(
      {Value<int> pid,
      Value<String> majorTypeLECId,
      Value<String> majorTypeId,
      Value<String> lecId,
      Value<int> speciesId,
      Value<int> value}) {
    return NinGadModifierCompanion(
      pid: pid ?? this.pid,
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
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
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
    return GeneratedIntColumn('species_id', $tableName, true,
        $customConstraints: '');
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
      [pid, majorTypeLECId, majorTypeId, lecId, speciesId, value];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('majorTypeLEC_id')) {
      context.handle(
          _majorTypeLECIdMeta,
          majorTypeLECId.isAcceptableOrUnknown(
              data['majorTypeLEC_id'], _majorTypeLECIdMeta));
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
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
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
  final int pid;
  final String minorTypeId;
  final String standardSegmentId;
  NinMinorTypeStandardSegmentData(
      {@required this.pid, this.minorTypeId, this.standardSegmentId});
  factory NinMinorTypeStandardSegmentData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinMinorTypeStandardSegmentData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      minorTypeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}minorType_id']),
      standardSegmentId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}standardSegment_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
      minorTypeId: serializer.fromJson<String>(json['minorType_id']),
      standardSegmentId:
          serializer.fromJson<String>(json['standardSegment_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      'minorType_id': serializer.toJson<String>(minorTypeId),
      'standardSegment_id': serializer.toJson<String>(standardSegmentId),
    };
  }

  NinMinorTypeStandardSegmentData copyWith(
          {int pid, String minorTypeId, String standardSegmentId}) =>
      NinMinorTypeStandardSegmentData(
        pid: pid ?? this.pid,
        minorTypeId: minorTypeId ?? this.minorTypeId,
        standardSegmentId: standardSegmentId ?? this.standardSegmentId,
      );
  @override
  String toString() {
    return (StringBuffer('NinMinorTypeStandardSegmentData(')
          ..write('pid: $pid, ')
          ..write('minorTypeId: $minorTypeId, ')
          ..write('standardSegmentId: $standardSegmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      pid.hashCode, $mrjc(minorTypeId.hashCode, standardSegmentId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMinorTypeStandardSegmentData &&
          other.pid == this.pid &&
          other.minorTypeId == this.minorTypeId &&
          other.standardSegmentId == this.standardSegmentId);
}

class NinMinorTypeStandardSegmentCompanion
    extends UpdateCompanion<NinMinorTypeStandardSegmentData> {
  final Value<int> pid;
  final Value<String> minorTypeId;
  final Value<String> standardSegmentId;
  const NinMinorTypeStandardSegmentCompanion({
    this.pid = const Value.absent(),
    this.minorTypeId = const Value.absent(),
    this.standardSegmentId = const Value.absent(),
  });
  NinMinorTypeStandardSegmentCompanion.insert({
    this.pid = const Value.absent(),
    this.minorTypeId = const Value.absent(),
    this.standardSegmentId = const Value.absent(),
  });
  static Insertable<NinMinorTypeStandardSegmentData> custom({
    Expression<int> pid,
    Expression<String> minorTypeId,
    Expression<String> standardSegmentId,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (minorTypeId != null) 'minorType_id': minorTypeId,
      if (standardSegmentId != null) 'standardSegment_id': standardSegmentId,
    });
  }

  NinMinorTypeStandardSegmentCompanion copyWith(
      {Value<int> pid,
      Value<String> minorTypeId,
      Value<String> standardSegmentId}) {
    return NinMinorTypeStandardSegmentCompanion(
      pid: pid ?? this.pid,
      minorTypeId: minorTypeId ?? this.minorTypeId,
      standardSegmentId: standardSegmentId ?? this.standardSegmentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _minorTypeIdMeta =
      const VerificationMeta('minorTypeId');
  GeneratedTextColumn _minorTypeId;
  GeneratedTextColumn get minorTypeId =>
      _minorTypeId ??= _constructMinorTypeId();
  GeneratedTextColumn _constructMinorTypeId() {
    return GeneratedTextColumn('minorType_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _standardSegmentIdMeta =
      const VerificationMeta('standardSegmentId');
  GeneratedTextColumn _standardSegmentId;
  GeneratedTextColumn get standardSegmentId =>
      _standardSegmentId ??= _constructStandardSegmentId();
  GeneratedTextColumn _constructStandardSegmentId() {
    return GeneratedTextColumn('standardSegment_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [pid, minorTypeId, standardSegmentId];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('minorType_id')) {
      context.handle(
          _minorTypeIdMeta,
          minorTypeId.isAcceptableOrUnknown(
              data['minorType_id'], _minorTypeIdMeta));
    }
    if (data.containsKey('standardSegment_id')) {
      context.handle(
          _standardSegmentIdMeta,
          standardSegmentId.isAcceptableOrUnknown(
              data['standardSegment_id'], _standardSegmentIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'FOREIGN KEY("minorType_id") REFERENCES "nin_MinorType" (_id)',
        'FOREIGN KEY("standardSegment_id") REFERENCES "nin_StandardSegment" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinElementarySegmentGroupDetailData extends DataClass
    implements Insertable<NinElementarySegmentGroupDetailData> {
  final int pid;
  final String elementarySegmentGroupId;
  final String lecId;
  final String value;
  final String detailId;
  NinElementarySegmentGroupDetailData(
      {@required this.pid,
      this.elementarySegmentGroupId,
      this.lecId,
      this.value,
      this.detailId});
  factory NinElementarySegmentGroupDetailData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinElementarySegmentGroupDetailData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
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
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
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
      'pid': serializer.toJson<int>(pid),
      'elementarySegmentGroup_id':
          serializer.toJson<String>(elementarySegmentGroupId),
      'lec_id': serializer.toJson<String>(lecId),
      'value': serializer.toJson<String>(value),
      'detail_id': serializer.toJson<String>(detailId),
    };
  }

  NinElementarySegmentGroupDetailData copyWith(
          {int pid,
          String elementarySegmentGroupId,
          String lecId,
          String value,
          String detailId}) =>
      NinElementarySegmentGroupDetailData(
        pid: pid ?? this.pid,
        elementarySegmentGroupId:
            elementarySegmentGroupId ?? this.elementarySegmentGroupId,
        lecId: lecId ?? this.lecId,
        value: value ?? this.value,
        detailId: detailId ?? this.detailId,
      );
  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentGroupDetailData(')
          ..write('pid: $pid, ')
          ..write('elementarySegmentGroupId: $elementarySegmentGroupId, ')
          ..write('lecId: $lecId, ')
          ..write('value: $value, ')
          ..write('detailId: $detailId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      pid.hashCode,
      $mrjc(elementarySegmentGroupId.hashCode,
          $mrjc(lecId.hashCode, $mrjc(value.hashCode, detailId.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinElementarySegmentGroupDetailData &&
          other.pid == this.pid &&
          other.elementarySegmentGroupId == this.elementarySegmentGroupId &&
          other.lecId == this.lecId &&
          other.value == this.value &&
          other.detailId == this.detailId);
}

class NinElementarySegmentGroupDetailCompanion
    extends UpdateCompanion<NinElementarySegmentGroupDetailData> {
  final Value<int> pid;
  final Value<String> elementarySegmentGroupId;
  final Value<String> lecId;
  final Value<String> value;
  final Value<String> detailId;
  const NinElementarySegmentGroupDetailCompanion({
    this.pid = const Value.absent(),
    this.elementarySegmentGroupId = const Value.absent(),
    this.lecId = const Value.absent(),
    this.value = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  NinElementarySegmentGroupDetailCompanion.insert({
    this.pid = const Value.absent(),
    this.elementarySegmentGroupId = const Value.absent(),
    this.lecId = const Value.absent(),
    this.value = const Value.absent(),
    this.detailId = const Value.absent(),
  });
  static Insertable<NinElementarySegmentGroupDetailData> custom({
    Expression<int> pid,
    Expression<String> elementarySegmentGroupId,
    Expression<String> lecId,
    Expression<String> value,
    Expression<String> detailId,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (elementarySegmentGroupId != null)
        'elementarySegmentGroup_id': elementarySegmentGroupId,
      if (lecId != null) 'lec_id': lecId,
      if (value != null) 'value': value,
      if (detailId != null) 'detail_id': detailId,
    });
  }

  NinElementarySegmentGroupDetailCompanion copyWith(
      {Value<int> pid,
      Value<String> elementarySegmentGroupId,
      Value<String> lecId,
      Value<String> value,
      Value<String> detailId}) {
    return NinElementarySegmentGroupDetailCompanion(
      pid: pid ?? this.pid,
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
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _elementarySegmentGroupIdMeta =
      const VerificationMeta('elementarySegmentGroupId');
  GeneratedTextColumn _elementarySegmentGroupId;
  GeneratedTextColumn get elementarySegmentGroupId =>
      _elementarySegmentGroupId ??= _constructElementarySegmentGroupId();
  GeneratedTextColumn _constructElementarySegmentGroupId() {
    return GeneratedTextColumn('elementarySegmentGroup_id', $tableName, true,
        $customConstraints: '');
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
      [pid, elementarySegmentGroupId, lecId, value, detailId];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('elementarySegmentGroup_id')) {
      context.handle(
          _elementarySegmentGroupIdMeta,
          elementarySegmentGroupId.isAcceptableOrUnknown(
              data['elementarySegmentGroup_id'],
              _elementarySegmentGroupIdMeta));
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
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'UNIQUE ("elementarySegmentGroup_id")',
        'FOREIGN KEY("elementarySegmentGroup_id") REFERENCES "nin_ElementarySegmentGroup" ("elementarySegment_id")',
        'FOREIGN KEY(lec_id) REFERENCES "nin_LEC" (_id)',
        'FOREIGN KEY(detail_id) REFERENCES "nin_Detail" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinStandardSegmentElementData extends DataClass
    implements Insertable<NinStandardSegmentElementData> {
  final int pid;
  final String standardSegmentId;
  final String elementarySegmentId;
  NinStandardSegmentElementData(
      {@required this.pid, this.standardSegmentId, this.elementarySegmentId});
  factory NinStandardSegmentElementData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinStandardSegmentElementData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      standardSegmentId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}standardSegment_id']),
      elementarySegmentId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}elementarySegment_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
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
      'pid': serializer.toJson<int>(pid),
      'standardSegment_id': serializer.toJson<String>(standardSegmentId),
      'elementarySegment_id': serializer.toJson<String>(elementarySegmentId),
    };
  }

  NinStandardSegmentElementData copyWith(
          {int pid, String standardSegmentId, String elementarySegmentId}) =>
      NinStandardSegmentElementData(
        pid: pid ?? this.pid,
        standardSegmentId: standardSegmentId ?? this.standardSegmentId,
        elementarySegmentId: elementarySegmentId ?? this.elementarySegmentId,
      );
  @override
  String toString() {
    return (StringBuffer('NinStandardSegmentElementData(')
          ..write('pid: $pid, ')
          ..write('standardSegmentId: $standardSegmentId, ')
          ..write('elementarySegmentId: $elementarySegmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(pid.hashCode,
      $mrjc(standardSegmentId.hashCode, elementarySegmentId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinStandardSegmentElementData &&
          other.pid == this.pid &&
          other.standardSegmentId == this.standardSegmentId &&
          other.elementarySegmentId == this.elementarySegmentId);
}

class NinStandardSegmentElementCompanion
    extends UpdateCompanion<NinStandardSegmentElementData> {
  final Value<int> pid;
  final Value<String> standardSegmentId;
  final Value<String> elementarySegmentId;
  const NinStandardSegmentElementCompanion({
    this.pid = const Value.absent(),
    this.standardSegmentId = const Value.absent(),
    this.elementarySegmentId = const Value.absent(),
  });
  NinStandardSegmentElementCompanion.insert({
    this.pid = const Value.absent(),
    this.standardSegmentId = const Value.absent(),
    this.elementarySegmentId = const Value.absent(),
  });
  static Insertable<NinStandardSegmentElementData> custom({
    Expression<int> pid,
    Expression<String> standardSegmentId,
    Expression<String> elementarySegmentId,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (standardSegmentId != null) 'standardSegment_id': standardSegmentId,
      if (elementarySegmentId != null)
        'elementarySegment_id': elementarySegmentId,
    });
  }

  NinStandardSegmentElementCompanion copyWith(
      {Value<int> pid,
      Value<String> standardSegmentId,
      Value<String> elementarySegmentId}) {
    return NinStandardSegmentElementCompanion(
      pid: pid ?? this.pid,
      standardSegmentId: standardSegmentId ?? this.standardSegmentId,
      elementarySegmentId: elementarySegmentId ?? this.elementarySegmentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _standardSegmentIdMeta =
      const VerificationMeta('standardSegmentId');
  GeneratedTextColumn _standardSegmentId;
  GeneratedTextColumn get standardSegmentId =>
      _standardSegmentId ??= _constructStandardSegmentId();
  GeneratedTextColumn _constructStandardSegmentId() {
    return GeneratedTextColumn('standardSegment_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _elementarySegmentIdMeta =
      const VerificationMeta('elementarySegmentId');
  GeneratedTextColumn _elementarySegmentId;
  GeneratedTextColumn get elementarySegmentId =>
      _elementarySegmentId ??= _constructElementarySegmentId();
  GeneratedTextColumn _constructElementarySegmentId() {
    return GeneratedTextColumn('elementarySegment_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [pid, standardSegmentId, elementarySegmentId];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('standardSegment_id')) {
      context.handle(
          _standardSegmentIdMeta,
          standardSegmentId.isAcceptableOrUnknown(
              data['standardSegment_id'], _standardSegmentIdMeta));
    }
    if (data.containsKey('elementarySegment_id')) {
      context.handle(
          _elementarySegmentIdMeta,
          elementarySegmentId.isAcceptableOrUnknown(
              data['elementarySegment_id'], _elementarySegmentIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'FOREIGN KEY("standardSegment_id") REFERENCES "nin_StandardSegment" (_id)',
        'FOREIGN KEY("elementarySegment_id") REFERENCES "nin_ElementarySegment" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinElementarySegmentCombinationData extends DataClass
    implements Insertable<NinElementarySegmentCombinationData> {
  final int pid;
  final String id;
  final String elementarySegmentGroupId;
  final String majorTypeLECId;
  NinElementarySegmentCombinationData(
      {@required this.pid,
      this.id,
      this.elementarySegmentGroupId,
      this.majorTypeLECId});
  factory NinElementarySegmentCombinationData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinElementarySegmentCombinationData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
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
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
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
      'pid': serializer.toJson<int>(pid),
      '_id': serializer.toJson<String>(id),
      'elementarySegmentGroup_id':
          serializer.toJson<String>(elementarySegmentGroupId),
      'majorTypeLEC_id': serializer.toJson<String>(majorTypeLECId),
    };
  }

  NinElementarySegmentCombinationData copyWith(
          {int pid,
          String id,
          String elementarySegmentGroupId,
          String majorTypeLECId}) =>
      NinElementarySegmentCombinationData(
        pid: pid ?? this.pid,
        id: id ?? this.id,
        elementarySegmentGroupId:
            elementarySegmentGroupId ?? this.elementarySegmentGroupId,
        majorTypeLECId: majorTypeLECId ?? this.majorTypeLECId,
      );
  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentCombinationData(')
          ..write('pid: $pid, ')
          ..write('id: $id, ')
          ..write('elementarySegmentGroupId: $elementarySegmentGroupId, ')
          ..write('majorTypeLECId: $majorTypeLECId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      pid.hashCode,
      $mrjc(id.hashCode,
          $mrjc(elementarySegmentGroupId.hashCode, majorTypeLECId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinElementarySegmentCombinationData &&
          other.pid == this.pid &&
          other.id == this.id &&
          other.elementarySegmentGroupId == this.elementarySegmentGroupId &&
          other.majorTypeLECId == this.majorTypeLECId);
}

class NinElementarySegmentCombinationCompanion
    extends UpdateCompanion<NinElementarySegmentCombinationData> {
  final Value<int> pid;
  final Value<String> id;
  final Value<String> elementarySegmentGroupId;
  final Value<String> majorTypeLECId;
  const NinElementarySegmentCombinationCompanion({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.elementarySegmentGroupId = const Value.absent(),
    this.majorTypeLECId = const Value.absent(),
  });
  NinElementarySegmentCombinationCompanion.insert({
    this.pid = const Value.absent(),
    this.id = const Value.absent(),
    this.elementarySegmentGroupId = const Value.absent(),
    this.majorTypeLECId = const Value.absent(),
  });
  static Insertable<NinElementarySegmentCombinationData> custom({
    Expression<int> pid,
    Expression<String> id,
    Expression<String> elementarySegmentGroupId,
    Expression<String> majorTypeLECId,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (id != null) '_id': id,
      if (elementarySegmentGroupId != null)
        'elementarySegmentGroup_id': elementarySegmentGroupId,
      if (majorTypeLECId != null) 'majorTypeLEC_id': majorTypeLECId,
    });
  }

  NinElementarySegmentCombinationCompanion copyWith(
      {Value<int> pid,
      Value<String> id,
      Value<String> elementarySegmentGroupId,
      Value<String> majorTypeLECId}) {
    return NinElementarySegmentCombinationCompanion(
      pid: pid ?? this.pid,
      id: id ?? this.id,
      elementarySegmentGroupId:
          elementarySegmentGroupId ?? this.elementarySegmentGroupId,
      majorTypeLECId: majorTypeLECId ?? this.majorTypeLECId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('_id', $tableName, true, $customConstraints: '');
  }

  final VerificationMeta _elementarySegmentGroupIdMeta =
      const VerificationMeta('elementarySegmentGroupId');
  GeneratedTextColumn _elementarySegmentGroupId;
  GeneratedTextColumn get elementarySegmentGroupId =>
      _elementarySegmentGroupId ??= _constructElementarySegmentGroupId();
  GeneratedTextColumn _constructElementarySegmentGroupId() {
    return GeneratedTextColumn('elementarySegmentGroup_id', $tableName, true,
        $customConstraints: '');
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
      [pid, id, elementarySegmentGroupId, majorTypeLECId];
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    }
    if (data.containsKey('elementarySegmentGroup_id')) {
      context.handle(
          _elementarySegmentGroupIdMeta,
          elementarySegmentGroupId.isAcceptableOrUnknown(
              data['elementarySegmentGroup_id'],
              _elementarySegmentGroupIdMeta));
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
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
        'FOREIGN KEY("elementarySegmentGroup_id") REFERENCES "nin_ElementarySegmentGroup" (_id)',
        'FOREIGN KEY("majorTypeLEC_id") REFERENCES "nin_MajorTypeLEC" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinGadValueData extends DataClass implements Insertable<NinGadValueData> {
  final int pid;
  final String elementarySegmentCombinationId;
  final int speciesId;
  final String majorTypeId;
  final int valueM7ScaleId;
  final int valueM3ScaleId;
  NinGadValueData(
      {@required this.pid,
      this.elementarySegmentCombinationId,
      this.speciesId,
      this.majorTypeId,
      this.valueM7ScaleId,
      this.valueM3ScaleId});
  factory NinGadValueData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinGadValueData(
      pid: intType.mapFromDatabaseResponse(data['${effectivePrefix}pid']),
      elementarySegmentCombinationId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}elementarySegmentCombination_id']),
      speciesId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}species_id']),
      majorTypeId: stringType
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
    if (!nullToAbsent || pid != null) {
      map['pid'] = Variable<int>(pid);
    }
    if (!nullToAbsent || elementarySegmentCombinationId != null) {
      map['elementarySegmentCombination_id'] =
          Variable<String>(elementarySegmentCombinationId);
    }
    if (!nullToAbsent || speciesId != null) {
      map['species_id'] = Variable<int>(speciesId);
    }
    if (!nullToAbsent || majorTypeId != null) {
      map['majorType_id'] = Variable<String>(majorTypeId);
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
      pid: pid == null && nullToAbsent ? const Value.absent() : Value(pid),
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
      pid: serializer.fromJson<int>(json['pid']),
      elementarySegmentCombinationId:
          serializer.fromJson<String>(json['elementarySegmentCombination_id']),
      speciesId: serializer.fromJson<int>(json['species_id']),
      majorTypeId: serializer.fromJson<String>(json['majorType_id']),
      valueM7ScaleId: serializer.fromJson<int>(json['valueM7Scale_id']),
      valueM3ScaleId: serializer.fromJson<int>(json['valueM3Scale_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      'elementarySegmentCombination_id':
          serializer.toJson<String>(elementarySegmentCombinationId),
      'species_id': serializer.toJson<int>(speciesId),
      'majorType_id': serializer.toJson<String>(majorTypeId),
      'valueM7Scale_id': serializer.toJson<int>(valueM7ScaleId),
      'valueM3Scale_id': serializer.toJson<int>(valueM3ScaleId),
    };
  }

  NinGadValueData copyWith(
          {int pid,
          String elementarySegmentCombinationId,
          int speciesId,
          String majorTypeId,
          int valueM7ScaleId,
          int valueM3ScaleId}) =>
      NinGadValueData(
        pid: pid ?? this.pid,
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
          ..write('pid: $pid, ')
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
      pid.hashCode,
      $mrjc(
          elementarySegmentCombinationId.hashCode,
          $mrjc(
              speciesId.hashCode,
              $mrjc(majorTypeId.hashCode,
                  $mrjc(valueM7ScaleId.hashCode, valueM3ScaleId.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinGadValueData &&
          other.pid == this.pid &&
          other.elementarySegmentCombinationId ==
              this.elementarySegmentCombinationId &&
          other.speciesId == this.speciesId &&
          other.majorTypeId == this.majorTypeId &&
          other.valueM7ScaleId == this.valueM7ScaleId &&
          other.valueM3ScaleId == this.valueM3ScaleId);
}

class NinGadValueCompanion extends UpdateCompanion<NinGadValueData> {
  final Value<int> pid;
  final Value<String> elementarySegmentCombinationId;
  final Value<int> speciesId;
  final Value<String> majorTypeId;
  final Value<int> valueM7ScaleId;
  final Value<int> valueM3ScaleId;
  const NinGadValueCompanion({
    this.pid = const Value.absent(),
    this.elementarySegmentCombinationId = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.valueM7ScaleId = const Value.absent(),
    this.valueM3ScaleId = const Value.absent(),
  });
  NinGadValueCompanion.insert({
    this.pid = const Value.absent(),
    this.elementarySegmentCombinationId = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.valueM7ScaleId = const Value.absent(),
    this.valueM3ScaleId = const Value.absent(),
  });
  static Insertable<NinGadValueData> custom({
    Expression<int> pid,
    Expression<String> elementarySegmentCombinationId,
    Expression<int> speciesId,
    Expression<String> majorTypeId,
    Expression<int> valueM7ScaleId,
    Expression<int> valueM3ScaleId,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (elementarySegmentCombinationId != null)
        'elementarySegmentCombination_id': elementarySegmentCombinationId,
      if (speciesId != null) 'species_id': speciesId,
      if (majorTypeId != null) 'majorType_id': majorTypeId,
      if (valueM7ScaleId != null) 'valueM7Scale_id': valueM7ScaleId,
      if (valueM3ScaleId != null) 'valueM3Scale_id': valueM3ScaleId,
    });
  }

  NinGadValueCompanion copyWith(
      {Value<int> pid,
      Value<String> elementarySegmentCombinationId,
      Value<int> speciesId,
      Value<String> majorTypeId,
      Value<int> valueM7ScaleId,
      Value<int> valueM3ScaleId}) {
    return NinGadValueCompanion(
      pid: pid ?? this.pid,
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
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
    if (elementarySegmentCombinationId.present) {
      map['elementarySegmentCombination_id'] =
          Variable<String>(elementarySegmentCombinationId.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<int>(speciesId.value);
    }
    if (majorTypeId.present) {
      map['majorType_id'] = Variable<String>(majorTypeId.value);
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
          ..write('pid: $pid, ')
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
  final VerificationMeta _pidMeta = const VerificationMeta('pid');
  GeneratedIntColumn _pid;
  GeneratedIntColumn get pid => _pid ??= _constructPid();
  GeneratedIntColumn _constructPid() {
    return GeneratedIntColumn('pid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _elementarySegmentCombinationIdMeta =
      const VerificationMeta('elementarySegmentCombinationId');
  GeneratedTextColumn _elementarySegmentCombinationId;
  GeneratedTextColumn get elementarySegmentCombinationId =>
      _elementarySegmentCombinationId ??=
          _constructElementarySegmentCombinationId();
  GeneratedTextColumn _constructElementarySegmentCombinationId() {
    return GeneratedTextColumn(
        'elementarySegmentCombination_id', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _speciesIdMeta = const VerificationMeta('speciesId');
  GeneratedIntColumn _speciesId;
  GeneratedIntColumn get speciesId => _speciesId ??= _constructSpeciesId();
  GeneratedIntColumn _constructSpeciesId() {
    return GeneratedIntColumn('species_id', $tableName, true,
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
        pid,
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
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid'], _pidMeta));
    }
    if (data.containsKey('elementarySegmentCombination_id')) {
      context.handle(
          _elementarySegmentCombinationIdMeta,
          elementarySegmentCombinationId.isAcceptableOrUnknown(
              data['elementarySegmentCombination_id'],
              _elementarySegmentCombinationIdMeta));
    }
    if (data.containsKey('species_id')) {
      context.handle(_speciesIdMeta,
          speciesId.isAcceptableOrUnknown(data['species_id'], _speciesIdMeta));
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
  Set<GeneratedColumn> get $primaryKey => {pid};
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
        'PRIMARY KEY (pid)',
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
