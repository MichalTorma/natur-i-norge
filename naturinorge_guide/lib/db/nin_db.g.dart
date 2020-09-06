// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nin_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class NinLanguageData extends DataClass implements Insertable<NinLanguageData> {
  final int id;
  final String name;
  NinLanguageData({@required this.id, this.name});
  factory NinLanguageData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinLanguageData(
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

  NinLanguageData copyWith({int id, String name}) => NinLanguageData(
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
  final Value<int> id;
  final Value<String> name;
  const NinLanguageCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  NinLanguageCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<NinLanguageData> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (name != null) 'name': name,
    });
  }

  NinLanguageCompanion copyWith({Value<int> id, Value<String> name}) {
    return NinLanguageCompanion(
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

class NinMajorTypeGroupData extends DataClass
    implements Insertable<NinMajorTypeGroupData> {
  final String id;
  NinMajorTypeGroupData({@required this.id});
  factory NinMajorTypeGroupData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinMajorTypeGroupData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    return map;
  }

  NinMajorTypeGroupCompanion toCompanion(bool nullToAbsent) {
    return NinMajorTypeGroupCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
    );
  }

  factory NinMajorTypeGroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMajorTypeGroupData(
      id: serializer.fromJson<String>(json['_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
    };
  }

  NinMajorTypeGroupData copyWith({String id}) => NinMajorTypeGroupData(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('NinMajorTypeGroupData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(id.hashCode);
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMajorTypeGroupData && other.id == this.id);
}

class NinMajorTypeGroupCompanion
    extends UpdateCompanion<NinMajorTypeGroupData> {
  final Value<String> id;
  const NinMajorTypeGroupCompanion({
    this.id = const Value.absent(),
  });
  NinMajorTypeGroupCompanion.insert({
    @required String id,
  }) : id = Value(id);
  static Insertable<NinMajorTypeGroupData> custom({
    Expression<String> id,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
    });
  }

  NinMajorTypeGroupCompanion copyWith({Value<String> id}) {
    return NinMajorTypeGroupCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinMajorTypeGroupCompanion(')
          ..write('id: $id')
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

  @override
  List<GeneratedColumn> get $columns => [id];
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

class NinStructuringProces extends DataClass
    implements Insertable<NinStructuringProces> {
  final String id;
  NinStructuringProces({@required this.id});
  factory NinStructuringProces.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinStructuringProces(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    return map;
  }

  NinStructuringProcessCompanion toCompanion(bool nullToAbsent) {
    return NinStructuringProcessCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
    );
  }

  factory NinStructuringProces.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinStructuringProces(
      id: serializer.fromJson<String>(json['_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
    };
  }

  NinStructuringProces copyWith({String id}) => NinStructuringProces(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('NinStructuringProces(')..write('id: $id')..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(id.hashCode);
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinStructuringProces && other.id == this.id);
}

class NinStructuringProcessCompanion
    extends UpdateCompanion<NinStructuringProces> {
  final Value<String> id;
  const NinStructuringProcessCompanion({
    this.id = const Value.absent(),
  });
  NinStructuringProcessCompanion.insert({
    @required String id,
  }) : id = Value(id);
  static Insertable<NinStructuringProces> custom({
    Expression<String> id,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
    });
  }

  NinStructuringProcessCompanion copyWith({Value<String> id}) {
    return NinStructuringProcessCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinStructuringProcessCompanion(')
          ..write('id: $id')
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

  @override
  List<GeneratedColumn> get $columns => [id];
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
  List<String> get customConstraints => const ['PRIMARY KEY (_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class NinPatternOfVariationData extends DataClass
    implements Insertable<NinPatternOfVariationData> {
  final String id;
  NinPatternOfVariationData({@required this.id});
  factory NinPatternOfVariationData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinPatternOfVariationData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    return map;
  }

  NinPatternOfVariationCompanion toCompanion(bool nullToAbsent) {
    return NinPatternOfVariationCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
    );
  }

  factory NinPatternOfVariationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinPatternOfVariationData(
      id: serializer.fromJson<String>(json['_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
    };
  }

  NinPatternOfVariationData copyWith({String id}) => NinPatternOfVariationData(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('NinPatternOfVariationData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(id.hashCode);
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinPatternOfVariationData && other.id == this.id);
}

class NinPatternOfVariationCompanion
    extends UpdateCompanion<NinPatternOfVariationData> {
  final Value<String> id;
  const NinPatternOfVariationCompanion({
    this.id = const Value.absent(),
  });
  NinPatternOfVariationCompanion.insert({
    @required String id,
  }) : id = Value(id);
  static Insertable<NinPatternOfVariationData> custom({
    Expression<String> id,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
    });
  }

  NinPatternOfVariationCompanion copyWith({Value<String> id}) {
    return NinPatternOfVariationCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinPatternOfVariationCompanion(')
          ..write('id: $id')
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

  @override
  List<GeneratedColumn> get $columns => [id];
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
  List<String> get customConstraints => const ['PRIMARY KEY (_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class NinLECTypeData extends DataClass implements Insertable<NinLECTypeData> {
  final String id;
  NinLECTypeData({@required this.id});
  factory NinLECTypeData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinLECTypeData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    return map;
  }

  NinLECTypeCompanion toCompanion(bool nullToAbsent) {
    return NinLECTypeCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
    );
  }

  factory NinLECTypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinLECTypeData(
      id: serializer.fromJson<String>(json['_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
    };
  }

  NinLECTypeData copyWith({String id}) => NinLECTypeData(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('NinLECTypeData(')..write('id: $id')..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(id.hashCode);
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinLECTypeData && other.id == this.id);
}

class NinLECTypeCompanion extends UpdateCompanion<NinLECTypeData> {
  final Value<String> id;
  const NinLECTypeCompanion({
    this.id = const Value.absent(),
  });
  NinLECTypeCompanion.insert({
    @required String id,
  }) : id = Value(id);
  static Insertable<NinLECTypeData> custom({
    Expression<String> id,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
    });
  }

  NinLECTypeCompanion copyWith({Value<String> id}) {
    return NinLECTypeCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinLECTypeCompanion(')..write('id: $id')..write(')'))
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

  @override
  List<GeneratedColumn> get $columns => [id];
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

class NinGADData extends DataClass implements Insertable<NinGADData> {
  final String artsKode;
  final String norskNavn;
  final String latinName;
  NinGADData({@required this.artsKode, this.norskNavn, this.latinName});
  factory NinGADData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinGADData(
      artsKode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}artsKode']),
      norskNavn: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}norskNavn']),
      latinName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}latinName']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || artsKode != null) {
      map['artsKode'] = Variable<String>(artsKode);
    }
    if (!nullToAbsent || norskNavn != null) {
      map['norskNavn'] = Variable<String>(norskNavn);
    }
    if (!nullToAbsent || latinName != null) {
      map['latinName'] = Variable<String>(latinName);
    }
    return map;
  }

  NinGADCompanion toCompanion(bool nullToAbsent) {
    return NinGADCompanion(
      artsKode: artsKode == null && nullToAbsent
          ? const Value.absent()
          : Value(artsKode),
      norskNavn: norskNavn == null && nullToAbsent
          ? const Value.absent()
          : Value(norskNavn),
      latinName: latinName == null && nullToAbsent
          ? const Value.absent()
          : Value(latinName),
    );
  }

  factory NinGADData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinGADData(
      artsKode: serializer.fromJson<String>(json['artsKode']),
      norskNavn: serializer.fromJson<String>(json['norskNavn']),
      latinName: serializer.fromJson<String>(json['latinName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'artsKode': serializer.toJson<String>(artsKode),
      'norskNavn': serializer.toJson<String>(norskNavn),
      'latinName': serializer.toJson<String>(latinName),
    };
  }

  NinGADData copyWith({String artsKode, String norskNavn, String latinName}) =>
      NinGADData(
        artsKode: artsKode ?? this.artsKode,
        norskNavn: norskNavn ?? this.norskNavn,
        latinName: latinName ?? this.latinName,
      );
  @override
  String toString() {
    return (StringBuffer('NinGADData(')
          ..write('artsKode: $artsKode, ')
          ..write('norskNavn: $norskNavn, ')
          ..write('latinName: $latinName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(artsKode.hashCode, $mrjc(norskNavn.hashCode, latinName.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinGADData &&
          other.artsKode == this.artsKode &&
          other.norskNavn == this.norskNavn &&
          other.latinName == this.latinName);
}

class NinGADCompanion extends UpdateCompanion<NinGADData> {
  final Value<String> artsKode;
  final Value<String> norskNavn;
  final Value<String> latinName;
  const NinGADCompanion({
    this.artsKode = const Value.absent(),
    this.norskNavn = const Value.absent(),
    this.latinName = const Value.absent(),
  });
  NinGADCompanion.insert({
    @required String artsKode,
    this.norskNavn = const Value.absent(),
    this.latinName = const Value.absent(),
  }) : artsKode = Value(artsKode);
  static Insertable<NinGADData> custom({
    Expression<String> artsKode,
    Expression<String> norskNavn,
    Expression<String> latinName,
  }) {
    return RawValuesInsertable({
      if (artsKode != null) 'artsKode': artsKode,
      if (norskNavn != null) 'norskNavn': norskNavn,
      if (latinName != null) 'latinName': latinName,
    });
  }

  NinGADCompanion copyWith(
      {Value<String> artsKode,
      Value<String> norskNavn,
      Value<String> latinName}) {
    return NinGADCompanion(
      artsKode: artsKode ?? this.artsKode,
      norskNavn: norskNavn ?? this.norskNavn,
      latinName: latinName ?? this.latinName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (artsKode.present) {
      map['artsKode'] = Variable<String>(artsKode.value);
    }
    if (norskNavn.present) {
      map['norskNavn'] = Variable<String>(norskNavn.value);
    }
    if (latinName.present) {
      map['latinName'] = Variable<String>(latinName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinGADCompanion(')
          ..write('artsKode: $artsKode, ')
          ..write('norskNavn: $norskNavn, ')
          ..write('latinName: $latinName')
          ..write(')'))
        .toString();
  }
}

class NinGAD extends Table with TableInfo<NinGAD, NinGADData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinGAD(this._db, [this._alias]);
  final VerificationMeta _artsKodeMeta = const VerificationMeta('artsKode');
  GeneratedTextColumn _artsKode;
  GeneratedTextColumn get artsKode => _artsKode ??= _constructArtsKode();
  GeneratedTextColumn _constructArtsKode() {
    return GeneratedTextColumn('artsKode', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _norskNavnMeta = const VerificationMeta('norskNavn');
  GeneratedTextColumn _norskNavn;
  GeneratedTextColumn get norskNavn => _norskNavn ??= _constructNorskNavn();
  GeneratedTextColumn _constructNorskNavn() {
    return GeneratedTextColumn('norskNavn', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _latinNameMeta = const VerificationMeta('latinName');
  GeneratedTextColumn _latinName;
  GeneratedTextColumn get latinName => _latinName ??= _constructLatinName();
  GeneratedTextColumn _constructLatinName() {
    return GeneratedTextColumn('latinName', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [artsKode, norskNavn, latinName];
  @override
  NinGAD get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_GAD';
  @override
  final String actualTableName = 'nin_GAD';
  @override
  VerificationContext validateIntegrity(Insertable<NinGADData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('artsKode')) {
      context.handle(_artsKodeMeta,
          artsKode.isAcceptableOrUnknown(data['artsKode'], _artsKodeMeta));
    } else if (isInserting) {
      context.missing(_artsKodeMeta);
    }
    if (data.containsKey('norskNavn')) {
      context.handle(_norskNavnMeta,
          norskNavn.isAcceptableOrUnknown(data['norskNavn'], _norskNavnMeta));
    }
    if (data.containsKey('latinName')) {
      context.handle(_latinNameMeta,
          latinName.isAcceptableOrUnknown(data['latinName'], _latinNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {artsKode};
  @override
  NinGADData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinGADData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinGAD createAlias(String alias) {
    return NinGAD(_db, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY ("artsKode")'];
  @override
  bool get dontWriteConstraints => true;
}

class NinMajorTypeGroupInfoData extends DataClass
    implements Insertable<NinMajorTypeGroupInfoData> {
  final String majorTypeGroupId;
  final int languageId;
  final String name;
  final String description;
  NinMajorTypeGroupInfoData(
      {@required this.majorTypeGroupId,
      @required this.languageId,
      this.name,
      this.description});
  factory NinMajorTypeGroupInfoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return NinMajorTypeGroupInfoData(
      majorTypeGroupId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorTypeGroup_id']),
      languageId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}language_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || majorTypeGroupId != null) {
      map['majorTypeGroup_id'] = Variable<String>(majorTypeGroupId);
    }
    if (!nullToAbsent || languageId != null) {
      map['language_id'] = Variable<int>(languageId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  NinMajorTypeGroupInfoCompanion toCompanion(bool nullToAbsent) {
    return NinMajorTypeGroupInfoCompanion(
      majorTypeGroupId: majorTypeGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeGroupId),
      languageId: languageId == null && nullToAbsent
          ? const Value.absent()
          : Value(languageId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory NinMajorTypeGroupInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMajorTypeGroupInfoData(
      majorTypeGroupId: serializer.fromJson<String>(json['majorTypeGroup_id']),
      languageId: serializer.fromJson<int>(json['language_id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'majorTypeGroup_id': serializer.toJson<String>(majorTypeGroupId),
      'language_id': serializer.toJson<int>(languageId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  NinMajorTypeGroupInfoData copyWith(
          {String majorTypeGroupId,
          int languageId,
          String name,
          String description}) =>
      NinMajorTypeGroupInfoData(
        majorTypeGroupId: majorTypeGroupId ?? this.majorTypeGroupId,
        languageId: languageId ?? this.languageId,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('NinMajorTypeGroupInfoData(')
          ..write('majorTypeGroupId: $majorTypeGroupId, ')
          ..write('languageId: $languageId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(majorTypeGroupId.hashCode,
      $mrjc(languageId.hashCode, $mrjc(name.hashCode, description.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMajorTypeGroupInfoData &&
          other.majorTypeGroupId == this.majorTypeGroupId &&
          other.languageId == this.languageId &&
          other.name == this.name &&
          other.description == this.description);
}

class NinMajorTypeGroupInfoCompanion
    extends UpdateCompanion<NinMajorTypeGroupInfoData> {
  final Value<String> majorTypeGroupId;
  final Value<int> languageId;
  final Value<String> name;
  final Value<String> description;
  const NinMajorTypeGroupInfoCompanion({
    this.majorTypeGroupId = const Value.absent(),
    this.languageId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  NinMajorTypeGroupInfoCompanion.insert({
    @required String majorTypeGroupId,
    @required int languageId,
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  })  : majorTypeGroupId = Value(majorTypeGroupId),
        languageId = Value(languageId);
  static Insertable<NinMajorTypeGroupInfoData> custom({
    Expression<String> majorTypeGroupId,
    Expression<int> languageId,
    Expression<String> name,
    Expression<String> description,
  }) {
    return RawValuesInsertable({
      if (majorTypeGroupId != null) 'majorTypeGroup_id': majorTypeGroupId,
      if (languageId != null) 'language_id': languageId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  NinMajorTypeGroupInfoCompanion copyWith(
      {Value<String> majorTypeGroupId,
      Value<int> languageId,
      Value<String> name,
      Value<String> description}) {
    return NinMajorTypeGroupInfoCompanion(
      majorTypeGroupId: majorTypeGroupId ?? this.majorTypeGroupId,
      languageId: languageId ?? this.languageId,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (majorTypeGroupId.present) {
      map['majorTypeGroup_id'] = Variable<String>(majorTypeGroupId.value);
    }
    if (languageId.present) {
      map['language_id'] = Variable<int>(languageId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinMajorTypeGroupInfoCompanion(')
          ..write('majorTypeGroupId: $majorTypeGroupId, ')
          ..write('languageId: $languageId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class NinMajorTypeGroupInfo extends Table
    with TableInfo<NinMajorTypeGroupInfo, NinMajorTypeGroupInfoData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinMajorTypeGroupInfo(this._db, [this._alias]);
  final VerificationMeta _majorTypeGroupIdMeta =
      const VerificationMeta('majorTypeGroupId');
  GeneratedTextColumn _majorTypeGroupId;
  GeneratedTextColumn get majorTypeGroupId =>
      _majorTypeGroupId ??= _constructMajorTypeGroupId();
  GeneratedTextColumn _constructMajorTypeGroupId() {
    return GeneratedTextColumn('majorTypeGroup_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _languageIdMeta = const VerificationMeta('languageId');
  GeneratedIntColumn _languageId;
  GeneratedIntColumn get languageId => _languageId ??= _constructLanguageId();
  GeneratedIntColumn _constructLanguageId() {
    return GeneratedIntColumn('language_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [majorTypeGroupId, languageId, name, description];
  @override
  NinMajorTypeGroupInfo get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_MajorTypeGroupInfo';
  @override
  final String actualTableName = 'nin_MajorTypeGroupInfo';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinMajorTypeGroupInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('majorTypeGroup_id')) {
      context.handle(
          _majorTypeGroupIdMeta,
          majorTypeGroupId.isAcceptableOrUnknown(
              data['majorTypeGroup_id'], _majorTypeGroupIdMeta));
    } else if (isInserting) {
      context.missing(_majorTypeGroupIdMeta);
    }
    if (data.containsKey('language_id')) {
      context.handle(
          _languageIdMeta,
          languageId.isAcceptableOrUnknown(
              data['language_id'], _languageIdMeta));
    } else if (isInserting) {
      context.missing(_languageIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {majorTypeGroupId, languageId};
  @override
  NinMajorTypeGroupInfoData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinMajorTypeGroupInfoData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  NinMajorTypeGroupInfo createAlias(String alias) {
    return NinMajorTypeGroupInfo(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY ("majorTypeGroup_id", language_id)',
        'FOREIGN KEY("majorTypeGroup_id") REFERENCES "nin_MajorTypeGroup" (_id)',
        'FOREIGN KEY(language_id) REFERENCES "nin_Language" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMajorTypeData extends DataClass
    implements Insertable<NinMajorTypeData> {
  final String id;
  final String majorTypeGroupId;
  NinMajorTypeData({@required this.id, this.majorTypeGroupId});
  factory NinMajorTypeData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinMajorTypeData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      majorTypeGroupId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorTypeGroup_id']),
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
    return map;
  }

  NinMajorTypeCompanion toCompanion(bool nullToAbsent) {
    return NinMajorTypeCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      majorTypeGroupId: majorTypeGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeGroupId),
    );
  }

  factory NinMajorTypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMajorTypeData(
      id: serializer.fromJson<String>(json['_id']),
      majorTypeGroupId: serializer.fromJson<String>(json['majorTypeGroup_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'majorTypeGroup_id': serializer.toJson<String>(majorTypeGroupId),
    };
  }

  NinMajorTypeData copyWith({String id, String majorTypeGroupId}) =>
      NinMajorTypeData(
        id: id ?? this.id,
        majorTypeGroupId: majorTypeGroupId ?? this.majorTypeGroupId,
      );
  @override
  String toString() {
    return (StringBuffer('NinMajorTypeData(')
          ..write('id: $id, ')
          ..write('majorTypeGroupId: $majorTypeGroupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, majorTypeGroupId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMajorTypeData &&
          other.id == this.id &&
          other.majorTypeGroupId == this.majorTypeGroupId);
}

class NinMajorTypeCompanion extends UpdateCompanion<NinMajorTypeData> {
  final Value<String> id;
  final Value<String> majorTypeGroupId;
  const NinMajorTypeCompanion({
    this.id = const Value.absent(),
    this.majorTypeGroupId = const Value.absent(),
  });
  NinMajorTypeCompanion.insert({
    @required String id,
    this.majorTypeGroupId = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinMajorTypeData> custom({
    Expression<String> id,
    Expression<String> majorTypeGroupId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (majorTypeGroupId != null) 'majorTypeGroup_id': majorTypeGroupId,
    });
  }

  NinMajorTypeCompanion copyWith(
      {Value<String> id, Value<String> majorTypeGroupId}) {
    return NinMajorTypeCompanion(
      id: id ?? this.id,
      majorTypeGroupId: majorTypeGroupId ?? this.majorTypeGroupId,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinMajorTypeCompanion(')
          ..write('id: $id, ')
          ..write('majorTypeGroupId: $majorTypeGroupId')
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

  @override
  List<GeneratedColumn> get $columns => [id, majorTypeGroupId];
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
        'FOREIGN KEY("majorTypeGroup_id") REFERENCES "nin_MajorTypeGroup" (_id)'
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
  NinLECData(
      {@required this.id,
      this.parentLecId,
      this.structuringProcessId,
      this.patternOfVariationId,
      this.knowledgeBaseRelations,
      this.knowledgeBaseDivision,
      this.spatialScale});
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
    };
  }

  NinLECData copyWith(
          {String id,
          String parentLecId,
          String structuringProcessId,
          String patternOfVariationId,
          int knowledgeBaseRelations,
          int knowledgeBaseDivision,
          int spatialScale}) =>
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
          ..write('spatialScale: $spatialScale')
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
                      $mrjc(knowledgeBaseDivision.hashCode,
                          spatialScale.hashCode)))))));
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
          other.spatialScale == this.spatialScale);
}

class NinLECCompanion extends UpdateCompanion<NinLECData> {
  final Value<String> id;
  final Value<String> parentLecId;
  final Value<String> structuringProcessId;
  final Value<String> patternOfVariationId;
  final Value<int> knowledgeBaseRelations;
  final Value<int> knowledgeBaseDivision;
  final Value<int> spatialScale;
  const NinLECCompanion({
    this.id = const Value.absent(),
    this.parentLecId = const Value.absent(),
    this.structuringProcessId = const Value.absent(),
    this.patternOfVariationId = const Value.absent(),
    this.knowledgeBaseRelations = const Value.absent(),
    this.knowledgeBaseDivision = const Value.absent(),
    this.spatialScale = const Value.absent(),
  });
  NinLECCompanion.insert({
    @required String id,
    this.parentLecId = const Value.absent(),
    this.structuringProcessId = const Value.absent(),
    this.patternOfVariationId = const Value.absent(),
    this.knowledgeBaseRelations = const Value.absent(),
    this.knowledgeBaseDivision = const Value.absent(),
    this.spatialScale = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinLECData> custom({
    Expression<String> id,
    Expression<String> parentLecId,
    Expression<String> structuringProcessId,
    Expression<String> patternOfVariationId,
    Expression<int> knowledgeBaseRelations,
    Expression<int> knowledgeBaseDivision,
    Expression<int> spatialScale,
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
    });
  }

  NinLECCompanion copyWith(
      {Value<String> id,
      Value<String> parentLecId,
      Value<String> structuringProcessId,
      Value<String> patternOfVariationId,
      Value<int> knowledgeBaseRelations,
      Value<int> knowledgeBaseDivision,
      Value<int> spatialScale}) {
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
          ..write('spatialScale: $spatialScale')
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

  @override
  List<GeneratedColumn> get $columns => [
        id,
        parentLecId,
        structuringProcessId,
        patternOfVariationId,
        knowledgeBaseRelations,
        knowledgeBaseDivision,
        spatialScale
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
        'FOREIGN KEY("patternOfVariation_id") REFERENCES "nin_PatternOfVariation" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinStructuringProcessInfoData extends DataClass
    implements Insertable<NinStructuringProcessInfoData> {
  final int languageId;
  final String structuringProcessId;
  final String name;
  final String description;
  NinStructuringProcessInfoData(
      {@required this.languageId,
      @required this.structuringProcessId,
      this.name,
      this.description});
  factory NinStructuringProcessInfoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinStructuringProcessInfoData(
      languageId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}language_id']),
      structuringProcessId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}structuringProcess_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || languageId != null) {
      map['language_id'] = Variable<int>(languageId);
    }
    if (!nullToAbsent || structuringProcessId != null) {
      map['structuringProcess_id'] = Variable<String>(structuringProcessId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  NinStructuringProcessInfoCompanion toCompanion(bool nullToAbsent) {
    return NinStructuringProcessInfoCompanion(
      languageId: languageId == null && nullToAbsent
          ? const Value.absent()
          : Value(languageId),
      structuringProcessId: structuringProcessId == null && nullToAbsent
          ? const Value.absent()
          : Value(structuringProcessId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory NinStructuringProcessInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinStructuringProcessInfoData(
      languageId: serializer.fromJson<int>(json['language_id']),
      structuringProcessId:
          serializer.fromJson<String>(json['structuringProcess_id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'language_id': serializer.toJson<int>(languageId),
      'structuringProcess_id': serializer.toJson<String>(structuringProcessId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  NinStructuringProcessInfoData copyWith(
          {int languageId,
          String structuringProcessId,
          String name,
          String description}) =>
      NinStructuringProcessInfoData(
        languageId: languageId ?? this.languageId,
        structuringProcessId: structuringProcessId ?? this.structuringProcessId,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('NinStructuringProcessInfoData(')
          ..write('languageId: $languageId, ')
          ..write('structuringProcessId: $structuringProcessId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      languageId.hashCode,
      $mrjc(structuringProcessId.hashCode,
          $mrjc(name.hashCode, description.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinStructuringProcessInfoData &&
          other.languageId == this.languageId &&
          other.structuringProcessId == this.structuringProcessId &&
          other.name == this.name &&
          other.description == this.description);
}

class NinStructuringProcessInfoCompanion
    extends UpdateCompanion<NinStructuringProcessInfoData> {
  final Value<int> languageId;
  final Value<String> structuringProcessId;
  final Value<String> name;
  final Value<String> description;
  const NinStructuringProcessInfoCompanion({
    this.languageId = const Value.absent(),
    this.structuringProcessId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  NinStructuringProcessInfoCompanion.insert({
    @required int languageId,
    @required String structuringProcessId,
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  })  : languageId = Value(languageId),
        structuringProcessId = Value(structuringProcessId);
  static Insertable<NinStructuringProcessInfoData> custom({
    Expression<int> languageId,
    Expression<String> structuringProcessId,
    Expression<String> name,
    Expression<String> description,
  }) {
    return RawValuesInsertable({
      if (languageId != null) 'language_id': languageId,
      if (structuringProcessId != null)
        'structuringProcess_id': structuringProcessId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  NinStructuringProcessInfoCompanion copyWith(
      {Value<int> languageId,
      Value<String> structuringProcessId,
      Value<String> name,
      Value<String> description}) {
    return NinStructuringProcessInfoCompanion(
      languageId: languageId ?? this.languageId,
      structuringProcessId: structuringProcessId ?? this.structuringProcessId,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (languageId.present) {
      map['language_id'] = Variable<int>(languageId.value);
    }
    if (structuringProcessId.present) {
      map['structuringProcess_id'] =
          Variable<String>(structuringProcessId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinStructuringProcessInfoCompanion(')
          ..write('languageId: $languageId, ')
          ..write('structuringProcessId: $structuringProcessId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class NinStructuringProcessInfo extends Table
    with TableInfo<NinStructuringProcessInfo, NinStructuringProcessInfoData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinStructuringProcessInfo(this._db, [this._alias]);
  final VerificationMeta _languageIdMeta = const VerificationMeta('languageId');
  GeneratedIntColumn _languageId;
  GeneratedIntColumn get languageId => _languageId ??= _constructLanguageId();
  GeneratedIntColumn _constructLanguageId() {
    return GeneratedIntColumn('language_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _structuringProcessIdMeta =
      const VerificationMeta('structuringProcessId');
  GeneratedTextColumn _structuringProcessId;
  GeneratedTextColumn get structuringProcessId =>
      _structuringProcessId ??= _constructStructuringProcessId();
  GeneratedTextColumn _constructStructuringProcessId() {
    return GeneratedTextColumn('structuringProcess_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [languageId, structuringProcessId, name, description];
  @override
  NinStructuringProcessInfo get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_StructuringProcessInfo';
  @override
  final String actualTableName = 'nin_StructuringProcessInfo';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinStructuringProcessInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('language_id')) {
      context.handle(
          _languageIdMeta,
          languageId.isAcceptableOrUnknown(
              data['language_id'], _languageIdMeta));
    } else if (isInserting) {
      context.missing(_languageIdMeta);
    }
    if (data.containsKey('structuringProcess_id')) {
      context.handle(
          _structuringProcessIdMeta,
          structuringProcessId.isAcceptableOrUnknown(
              data['structuringProcess_id'], _structuringProcessIdMeta));
    } else if (isInserting) {
      context.missing(_structuringProcessIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {languageId, structuringProcessId};
  @override
  NinStructuringProcessInfoData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinStructuringProcessInfoData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  NinStructuringProcessInfo createAlias(String alias) {
    return NinStructuringProcessInfo(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (language_id, "structuringProcess_id")',
        'FOREIGN KEY(language_id) REFERENCES "nin_Language" (_id)',
        'FOREIGN KEY("structuringProcess_id") REFERENCES "nin_StructuringProcess" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinPatternOfVariationInfoData extends DataClass
    implements Insertable<NinPatternOfVariationInfoData> {
  final int languageId;
  final String patternOfVariationId;
  final String name;
  final String description;
  NinPatternOfVariationInfoData(
      {@required this.languageId,
      @required this.patternOfVariationId,
      this.name,
      this.description});
  factory NinPatternOfVariationInfoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinPatternOfVariationInfoData(
      languageId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}language_id']),
      patternOfVariationId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}patternOfVariation_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || languageId != null) {
      map['language_id'] = Variable<int>(languageId);
    }
    if (!nullToAbsent || patternOfVariationId != null) {
      map['patternOfVariation_id'] = Variable<String>(patternOfVariationId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  NinPatternOfVariationInfoCompanion toCompanion(bool nullToAbsent) {
    return NinPatternOfVariationInfoCompanion(
      languageId: languageId == null && nullToAbsent
          ? const Value.absent()
          : Value(languageId),
      patternOfVariationId: patternOfVariationId == null && nullToAbsent
          ? const Value.absent()
          : Value(patternOfVariationId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory NinPatternOfVariationInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinPatternOfVariationInfoData(
      languageId: serializer.fromJson<int>(json['language_id']),
      patternOfVariationId:
          serializer.fromJson<String>(json['patternOfVariation_id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'language_id': serializer.toJson<int>(languageId),
      'patternOfVariation_id': serializer.toJson<String>(patternOfVariationId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  NinPatternOfVariationInfoData copyWith(
          {int languageId,
          String patternOfVariationId,
          String name,
          String description}) =>
      NinPatternOfVariationInfoData(
        languageId: languageId ?? this.languageId,
        patternOfVariationId: patternOfVariationId ?? this.patternOfVariationId,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('NinPatternOfVariationInfoData(')
          ..write('languageId: $languageId, ')
          ..write('patternOfVariationId: $patternOfVariationId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      languageId.hashCode,
      $mrjc(patternOfVariationId.hashCode,
          $mrjc(name.hashCode, description.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinPatternOfVariationInfoData &&
          other.languageId == this.languageId &&
          other.patternOfVariationId == this.patternOfVariationId &&
          other.name == this.name &&
          other.description == this.description);
}

class NinPatternOfVariationInfoCompanion
    extends UpdateCompanion<NinPatternOfVariationInfoData> {
  final Value<int> languageId;
  final Value<String> patternOfVariationId;
  final Value<String> name;
  final Value<String> description;
  const NinPatternOfVariationInfoCompanion({
    this.languageId = const Value.absent(),
    this.patternOfVariationId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  NinPatternOfVariationInfoCompanion.insert({
    @required int languageId,
    @required String patternOfVariationId,
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  })  : languageId = Value(languageId),
        patternOfVariationId = Value(patternOfVariationId);
  static Insertable<NinPatternOfVariationInfoData> custom({
    Expression<int> languageId,
    Expression<String> patternOfVariationId,
    Expression<String> name,
    Expression<String> description,
  }) {
    return RawValuesInsertable({
      if (languageId != null) 'language_id': languageId,
      if (patternOfVariationId != null)
        'patternOfVariation_id': patternOfVariationId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  NinPatternOfVariationInfoCompanion copyWith(
      {Value<int> languageId,
      Value<String> patternOfVariationId,
      Value<String> name,
      Value<String> description}) {
    return NinPatternOfVariationInfoCompanion(
      languageId: languageId ?? this.languageId,
      patternOfVariationId: patternOfVariationId ?? this.patternOfVariationId,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (languageId.present) {
      map['language_id'] = Variable<int>(languageId.value);
    }
    if (patternOfVariationId.present) {
      map['patternOfVariation_id'] =
          Variable<String>(patternOfVariationId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinPatternOfVariationInfoCompanion(')
          ..write('languageId: $languageId, ')
          ..write('patternOfVariationId: $patternOfVariationId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class NinPatternOfVariationInfo extends Table
    with TableInfo<NinPatternOfVariationInfo, NinPatternOfVariationInfoData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinPatternOfVariationInfo(this._db, [this._alias]);
  final VerificationMeta _languageIdMeta = const VerificationMeta('languageId');
  GeneratedIntColumn _languageId;
  GeneratedIntColumn get languageId => _languageId ??= _constructLanguageId();
  GeneratedIntColumn _constructLanguageId() {
    return GeneratedIntColumn('language_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _patternOfVariationIdMeta =
      const VerificationMeta('patternOfVariationId');
  GeneratedTextColumn _patternOfVariationId;
  GeneratedTextColumn get patternOfVariationId =>
      _patternOfVariationId ??= _constructPatternOfVariationId();
  GeneratedTextColumn _constructPatternOfVariationId() {
    return GeneratedTextColumn('patternOfVariation_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [languageId, patternOfVariationId, name, description];
  @override
  NinPatternOfVariationInfo get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_PatternOfVariationInfo';
  @override
  final String actualTableName = 'nin_PatternOfVariationInfo';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinPatternOfVariationInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('language_id')) {
      context.handle(
          _languageIdMeta,
          languageId.isAcceptableOrUnknown(
              data['language_id'], _languageIdMeta));
    } else if (isInserting) {
      context.missing(_languageIdMeta);
    }
    if (data.containsKey('patternOfVariation_id')) {
      context.handle(
          _patternOfVariationIdMeta,
          patternOfVariationId.isAcceptableOrUnknown(
              data['patternOfVariation_id'], _patternOfVariationIdMeta));
    } else if (isInserting) {
      context.missing(_patternOfVariationIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {languageId, patternOfVariationId};
  @override
  NinPatternOfVariationInfoData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinPatternOfVariationInfoData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  NinPatternOfVariationInfo createAlias(String alias) {
    return NinPatternOfVariationInfo(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (language_id, "patternOfVariation_id")',
        'FOREIGN KEY(language_id) REFERENCES "nin_Language" (_id)',
        'FOREIGN KEY("patternOfVariation_id") REFERENCES "nin_PatternOfVariation" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinLECTypeInfoData extends DataClass
    implements Insertable<NinLECTypeInfoData> {
  final String lecTypeId;
  final String languageId;
  final String name;
  final String description;
  NinLECTypeInfoData(
      {@required this.lecTypeId,
      @required this.languageId,
      this.name,
      this.description});
  factory NinLECTypeInfoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinLECTypeInfoData(
      lecTypeId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}lecType_id']),
      languageId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}language_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || lecTypeId != null) {
      map['lecType_id'] = Variable<String>(lecTypeId);
    }
    if (!nullToAbsent || languageId != null) {
      map['language_id'] = Variable<String>(languageId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  NinLECTypeInfoCompanion toCompanion(bool nullToAbsent) {
    return NinLECTypeInfoCompanion(
      lecTypeId: lecTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(lecTypeId),
      languageId: languageId == null && nullToAbsent
          ? const Value.absent()
          : Value(languageId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory NinLECTypeInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinLECTypeInfoData(
      lecTypeId: serializer.fromJson<String>(json['lecType_id']),
      languageId: serializer.fromJson<String>(json['language_id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lecType_id': serializer.toJson<String>(lecTypeId),
      'language_id': serializer.toJson<String>(languageId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  NinLECTypeInfoData copyWith(
          {String lecTypeId,
          String languageId,
          String name,
          String description}) =>
      NinLECTypeInfoData(
        lecTypeId: lecTypeId ?? this.lecTypeId,
        languageId: languageId ?? this.languageId,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('NinLECTypeInfoData(')
          ..write('lecTypeId: $lecTypeId, ')
          ..write('languageId: $languageId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(lecTypeId.hashCode,
      $mrjc(languageId.hashCode, $mrjc(name.hashCode, description.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinLECTypeInfoData &&
          other.lecTypeId == this.lecTypeId &&
          other.languageId == this.languageId &&
          other.name == this.name &&
          other.description == this.description);
}

class NinLECTypeInfoCompanion extends UpdateCompanion<NinLECTypeInfoData> {
  final Value<String> lecTypeId;
  final Value<String> languageId;
  final Value<String> name;
  final Value<String> description;
  const NinLECTypeInfoCompanion({
    this.lecTypeId = const Value.absent(),
    this.languageId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  NinLECTypeInfoCompanion.insert({
    @required String lecTypeId,
    @required String languageId,
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  })  : lecTypeId = Value(lecTypeId),
        languageId = Value(languageId);
  static Insertable<NinLECTypeInfoData> custom({
    Expression<String> lecTypeId,
    Expression<String> languageId,
    Expression<String> name,
    Expression<String> description,
  }) {
    return RawValuesInsertable({
      if (lecTypeId != null) 'lecType_id': lecTypeId,
      if (languageId != null) 'language_id': languageId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  NinLECTypeInfoCompanion copyWith(
      {Value<String> lecTypeId,
      Value<String> languageId,
      Value<String> name,
      Value<String> description}) {
    return NinLECTypeInfoCompanion(
      lecTypeId: lecTypeId ?? this.lecTypeId,
      languageId: languageId ?? this.languageId,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lecTypeId.present) {
      map['lecType_id'] = Variable<String>(lecTypeId.value);
    }
    if (languageId.present) {
      map['language_id'] = Variable<String>(languageId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinLECTypeInfoCompanion(')
          ..write('lecTypeId: $lecTypeId, ')
          ..write('languageId: $languageId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class NinLECTypeInfo extends Table
    with TableInfo<NinLECTypeInfo, NinLECTypeInfoData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinLECTypeInfo(this._db, [this._alias]);
  final VerificationMeta _lecTypeIdMeta = const VerificationMeta('lecTypeId');
  GeneratedTextColumn _lecTypeId;
  GeneratedTextColumn get lecTypeId => _lecTypeId ??= _constructLecTypeId();
  GeneratedTextColumn _constructLecTypeId() {
    return GeneratedTextColumn('lecType_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _languageIdMeta = const VerificationMeta('languageId');
  GeneratedTextColumn _languageId;
  GeneratedTextColumn get languageId => _languageId ??= _constructLanguageId();
  GeneratedTextColumn _constructLanguageId() {
    return GeneratedTextColumn('language_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [lecTypeId, languageId, name, description];
  @override
  NinLECTypeInfo get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_LECTypeInfo';
  @override
  final String actualTableName = 'nin_LECTypeInfo';
  @override
  VerificationContext validateIntegrity(Insertable<NinLECTypeInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('lecType_id')) {
      context.handle(_lecTypeIdMeta,
          lecTypeId.isAcceptableOrUnknown(data['lecType_id'], _lecTypeIdMeta));
    } else if (isInserting) {
      context.missing(_lecTypeIdMeta);
    }
    if (data.containsKey('language_id')) {
      context.handle(
          _languageIdMeta,
          languageId.isAcceptableOrUnknown(
              data['language_id'], _languageIdMeta));
    } else if (isInserting) {
      context.missing(_languageIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lecTypeId, languageId};
  @override
  NinLECTypeInfoData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinLECTypeInfoData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinLECTypeInfo createAlias(String alias) {
    return NinLECTypeInfo(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY ("lecType_id", language_id)',
        'FOREIGN KEY("lecType_id") REFERENCES "nin_LECType" (_id)',
        'FOREIGN KEY(language_id) REFERENCES "nin_Language" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMajorTypeInfoData extends DataClass
    implements Insertable<NinMajorTypeInfoData> {
  final int languageId;
  final int majorTypeId;
  final String name;
  final String description;
  NinMajorTypeInfoData(
      {@required this.languageId,
      @required this.majorTypeId,
      this.name,
      this.description});
  factory NinMajorTypeInfoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinMajorTypeInfoData(
      languageId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}language_id']),
      majorTypeId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorType_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || languageId != null) {
      map['language_id'] = Variable<int>(languageId);
    }
    if (!nullToAbsent || majorTypeId != null) {
      map['majorType_id'] = Variable<int>(majorTypeId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  NinMajorTypeInfoCompanion toCompanion(bool nullToAbsent) {
    return NinMajorTypeInfoCompanion(
      languageId: languageId == null && nullToAbsent
          ? const Value.absent()
          : Value(languageId),
      majorTypeId: majorTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory NinMajorTypeInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMajorTypeInfoData(
      languageId: serializer.fromJson<int>(json['language_id']),
      majorTypeId: serializer.fromJson<int>(json['majorType_id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'language_id': serializer.toJson<int>(languageId),
      'majorType_id': serializer.toJson<int>(majorTypeId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  NinMajorTypeInfoData copyWith(
          {int languageId, int majorTypeId, String name, String description}) =>
      NinMajorTypeInfoData(
        languageId: languageId ?? this.languageId,
        majorTypeId: majorTypeId ?? this.majorTypeId,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('NinMajorTypeInfoData(')
          ..write('languageId: $languageId, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(languageId.hashCode,
      $mrjc(majorTypeId.hashCode, $mrjc(name.hashCode, description.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMajorTypeInfoData &&
          other.languageId == this.languageId &&
          other.majorTypeId == this.majorTypeId &&
          other.name == this.name &&
          other.description == this.description);
}

class NinMajorTypeInfoCompanion extends UpdateCompanion<NinMajorTypeInfoData> {
  final Value<int> languageId;
  final Value<int> majorTypeId;
  final Value<String> name;
  final Value<String> description;
  const NinMajorTypeInfoCompanion({
    this.languageId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  NinMajorTypeInfoCompanion.insert({
    @required int languageId,
    @required int majorTypeId,
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  })  : languageId = Value(languageId),
        majorTypeId = Value(majorTypeId);
  static Insertable<NinMajorTypeInfoData> custom({
    Expression<int> languageId,
    Expression<int> majorTypeId,
    Expression<String> name,
    Expression<String> description,
  }) {
    return RawValuesInsertable({
      if (languageId != null) 'language_id': languageId,
      if (majorTypeId != null) 'majorType_id': majorTypeId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  NinMajorTypeInfoCompanion copyWith(
      {Value<int> languageId,
      Value<int> majorTypeId,
      Value<String> name,
      Value<String> description}) {
    return NinMajorTypeInfoCompanion(
      languageId: languageId ?? this.languageId,
      majorTypeId: majorTypeId ?? this.majorTypeId,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (languageId.present) {
      map['language_id'] = Variable<int>(languageId.value);
    }
    if (majorTypeId.present) {
      map['majorType_id'] = Variable<int>(majorTypeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinMajorTypeInfoCompanion(')
          ..write('languageId: $languageId, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class NinMajorTypeInfo extends Table
    with TableInfo<NinMajorTypeInfo, NinMajorTypeInfoData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinMajorTypeInfo(this._db, [this._alias]);
  final VerificationMeta _languageIdMeta = const VerificationMeta('languageId');
  GeneratedIntColumn _languageId;
  GeneratedIntColumn get languageId => _languageId ??= _constructLanguageId();
  GeneratedIntColumn _constructLanguageId() {
    return GeneratedIntColumn('language_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _majorTypeIdMeta =
      const VerificationMeta('majorTypeId');
  GeneratedIntColumn _majorTypeId;
  GeneratedIntColumn get majorTypeId =>
      _majorTypeId ??= _constructMajorTypeId();
  GeneratedIntColumn _constructMajorTypeId() {
    return GeneratedIntColumn('majorType_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [languageId, majorTypeId, name, description];
  @override
  NinMajorTypeInfo get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_MajorTypeInfo';
  @override
  final String actualTableName = 'nin_MajorTypeInfo';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinMajorTypeInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('language_id')) {
      context.handle(
          _languageIdMeta,
          languageId.isAcceptableOrUnknown(
              data['language_id'], _languageIdMeta));
    } else if (isInserting) {
      context.missing(_languageIdMeta);
    }
    if (data.containsKey('majorType_id')) {
      context.handle(
          _majorTypeIdMeta,
          majorTypeId.isAcceptableOrUnknown(
              data['majorType_id'], _majorTypeIdMeta));
    } else if (isInserting) {
      context.missing(_majorTypeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {languageId, majorTypeId};
  @override
  NinMajorTypeInfoData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinMajorTypeInfoData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinMajorTypeInfo createAlias(String alias) {
    return NinMajorTypeInfo(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (language_id, "majorType_id")',
        'FOREIGN KEY(language_id) REFERENCES "nin_Language" (_id)',
        'FOREIGN KEY("majorType_id") REFERENCES "nin_MajorType" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMinorTypeData extends DataClass
    implements Insertable<NinMinorTypeData> {
  final String id;
  final int majorTypeId;
  NinMinorTypeData({@required this.id, this.majorTypeId});
  factory NinMinorTypeData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return NinMinorTypeData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      majorTypeId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorType_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<String>(id);
    }
    if (!nullToAbsent || majorTypeId != null) {
      map['majorType_id'] = Variable<int>(majorTypeId);
    }
    return map;
  }

  NinMinorTypeCompanion toCompanion(bool nullToAbsent) {
    return NinMinorTypeCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      majorTypeId: majorTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeId),
    );
  }

  factory NinMinorTypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMinorTypeData(
      id: serializer.fromJson<String>(json['_id']),
      majorTypeId: serializer.fromJson<int>(json['majorType_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'majorType_id': serializer.toJson<int>(majorTypeId),
    };
  }

  NinMinorTypeData copyWith({String id, int majorTypeId}) => NinMinorTypeData(
        id: id ?? this.id,
        majorTypeId: majorTypeId ?? this.majorTypeId,
      );
  @override
  String toString() {
    return (StringBuffer('NinMinorTypeData(')
          ..write('id: $id, ')
          ..write('majorTypeId: $majorTypeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, majorTypeId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMinorTypeData &&
          other.id == this.id &&
          other.majorTypeId == this.majorTypeId);
}

class NinMinorTypeCompanion extends UpdateCompanion<NinMinorTypeData> {
  final Value<String> id;
  final Value<int> majorTypeId;
  const NinMinorTypeCompanion({
    this.id = const Value.absent(),
    this.majorTypeId = const Value.absent(),
  });
  NinMinorTypeCompanion.insert({
    @required String id,
    this.majorTypeId = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinMinorTypeData> custom({
    Expression<String> id,
    Expression<int> majorTypeId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (majorTypeId != null) 'majorType_id': majorTypeId,
    });
  }

  NinMinorTypeCompanion copyWith({Value<String> id, Value<int> majorTypeId}) {
    return NinMinorTypeCompanion(
      id: id ?? this.id,
      majorTypeId: majorTypeId ?? this.majorTypeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<String>(id.value);
    }
    if (majorTypeId.present) {
      map['majorType_id'] = Variable<int>(majorTypeId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinMinorTypeCompanion(')
          ..write('id: $id, ')
          ..write('majorTypeId: $majorTypeId')
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

  final VerificationMeta _majorTypeIdMeta =
      const VerificationMeta('majorTypeId');
  GeneratedIntColumn _majorTypeId;
  GeneratedIntColumn get majorTypeId =>
      _majorTypeId ??= _constructMajorTypeId();
  GeneratedIntColumn _constructMajorTypeId() {
    return GeneratedIntColumn('majorType_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, majorTypeId];
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
    if (data.containsKey('majorType_id')) {
      context.handle(
          _majorTypeIdMeta,
          majorTypeId.isAcceptableOrUnknown(
              data['majorType_id'], _majorTypeIdMeta));
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
        'FOREIGN KEY("majorType_id") REFERENCES "nin_MajorType" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinLECInfoData extends DataClass implements Insertable<NinLECInfoData> {
  final int languageId;
  final String lecId;
  final String name;
  final String description;
  NinLECInfoData(
      {@required this.languageId,
      @required this.lecId,
      this.name,
      this.description});
  factory NinLECInfoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinLECInfoData(
      languageId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}language_id']),
      lecId:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}lec_id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || languageId != null) {
      map['language_id'] = Variable<int>(languageId);
    }
    if (!nullToAbsent || lecId != null) {
      map['lec_id'] = Variable<String>(lecId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  NinLECInfoCompanion toCompanion(bool nullToAbsent) {
    return NinLECInfoCompanion(
      languageId: languageId == null && nullToAbsent
          ? const Value.absent()
          : Value(languageId),
      lecId:
          lecId == null && nullToAbsent ? const Value.absent() : Value(lecId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory NinLECInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinLECInfoData(
      languageId: serializer.fromJson<int>(json['language_id']),
      lecId: serializer.fromJson<String>(json['lec_id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'language_id': serializer.toJson<int>(languageId),
      'lec_id': serializer.toJson<String>(lecId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  NinLECInfoData copyWith(
          {int languageId, String lecId, String name, String description}) =>
      NinLECInfoData(
        languageId: languageId ?? this.languageId,
        lecId: lecId ?? this.lecId,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('NinLECInfoData(')
          ..write('languageId: $languageId, ')
          ..write('lecId: $lecId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(languageId.hashCode,
      $mrjc(lecId.hashCode, $mrjc(name.hashCode, description.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinLECInfoData &&
          other.languageId == this.languageId &&
          other.lecId == this.lecId &&
          other.name == this.name &&
          other.description == this.description);
}

class NinLECInfoCompanion extends UpdateCompanion<NinLECInfoData> {
  final Value<int> languageId;
  final Value<String> lecId;
  final Value<String> name;
  final Value<String> description;
  const NinLECInfoCompanion({
    this.languageId = const Value.absent(),
    this.lecId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  NinLECInfoCompanion.insert({
    @required int languageId,
    @required String lecId,
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  })  : languageId = Value(languageId),
        lecId = Value(lecId);
  static Insertable<NinLECInfoData> custom({
    Expression<int> languageId,
    Expression<String> lecId,
    Expression<String> name,
    Expression<String> description,
  }) {
    return RawValuesInsertable({
      if (languageId != null) 'language_id': languageId,
      if (lecId != null) 'lec_id': lecId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  NinLECInfoCompanion copyWith(
      {Value<int> languageId,
      Value<String> lecId,
      Value<String> name,
      Value<String> description}) {
    return NinLECInfoCompanion(
      languageId: languageId ?? this.languageId,
      lecId: lecId ?? this.lecId,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (languageId.present) {
      map['language_id'] = Variable<int>(languageId.value);
    }
    if (lecId.present) {
      map['lec_id'] = Variable<String>(lecId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinLECInfoCompanion(')
          ..write('languageId: $languageId, ')
          ..write('lecId: $lecId, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class NinLECInfo extends Table with TableInfo<NinLECInfo, NinLECInfoData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinLECInfo(this._db, [this._alias]);
  final VerificationMeta _languageIdMeta = const VerificationMeta('languageId');
  GeneratedIntColumn _languageId;
  GeneratedIntColumn get languageId => _languageId ??= _constructLanguageId();
  GeneratedIntColumn _constructLanguageId() {
    return GeneratedIntColumn('language_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _lecIdMeta = const VerificationMeta('lecId');
  GeneratedTextColumn _lecId;
  GeneratedTextColumn get lecId => _lecId ??= _constructLecId();
  GeneratedTextColumn _constructLecId() {
    return GeneratedTextColumn('lec_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [languageId, lecId, name, description];
  @override
  NinLECInfo get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_LECInfo';
  @override
  final String actualTableName = 'nin_LECInfo';
  @override
  VerificationContext validateIntegrity(Insertable<NinLECInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('language_id')) {
      context.handle(
          _languageIdMeta,
          languageId.isAcceptableOrUnknown(
              data['language_id'], _languageIdMeta));
    } else if (isInserting) {
      context.missing(_languageIdMeta);
    }
    if (data.containsKey('lec_id')) {
      context.handle(
          _lecIdMeta, lecId.isAcceptableOrUnknown(data['lec_id'], _lecIdMeta));
    } else if (isInserting) {
      context.missing(_lecIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {languageId, lecId};
  @override
  NinLECInfoData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinLECInfoData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinLECInfo createAlias(String alias) {
    return NinLECInfo(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (language_id, lec_id)',
        'FOREIGN KEY(language_id) REFERENCES "nin_Language" (_id)',
        'FOREIGN KEY(lec_id) REFERENCES "nin_LEC" (_id)'
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
  final int relativeOrder;
  final String parentId;
  NinElementarySegmentData(
      {@required this.id,
      this.lecId,
      this.value,
      this.order,
      this.relativeOrder,
      this.parentId});
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
      relativeOrder: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}relative_order']),
      parentId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}parent_id']),
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
    if (!nullToAbsent || relativeOrder != null) {
      map['relative_order'] = Variable<int>(relativeOrder);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
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
      relativeOrder: relativeOrder == null && nullToAbsent
          ? const Value.absent()
          : Value(relativeOrder),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
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
      relativeOrder: serializer.fromJson<int>(json['relative_order']),
      parentId: serializer.fromJson<String>(json['parent_id']),
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
      'relative_order': serializer.toJson<int>(relativeOrder),
      'parent_id': serializer.toJson<String>(parentId),
    };
  }

  NinElementarySegmentData copyWith(
          {String id,
          String lecId,
          String value,
          int order,
          int relativeOrder,
          String parentId}) =>
      NinElementarySegmentData(
        id: id ?? this.id,
        lecId: lecId ?? this.lecId,
        value: value ?? this.value,
        order: order ?? this.order,
        relativeOrder: relativeOrder ?? this.relativeOrder,
        parentId: parentId ?? this.parentId,
      );
  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentData(')
          ..write('id: $id, ')
          ..write('lecId: $lecId, ')
          ..write('value: $value, ')
          ..write('order: $order, ')
          ..write('relativeOrder: $relativeOrder, ')
          ..write('parentId: $parentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          lecId.hashCode,
          $mrjc(
              value.hashCode,
              $mrjc(order.hashCode,
                  $mrjc(relativeOrder.hashCode, parentId.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinElementarySegmentData &&
          other.id == this.id &&
          other.lecId == this.lecId &&
          other.value == this.value &&
          other.order == this.order &&
          other.relativeOrder == this.relativeOrder &&
          other.parentId == this.parentId);
}

class NinElementarySegmentCompanion
    extends UpdateCompanion<NinElementarySegmentData> {
  final Value<String> id;
  final Value<String> lecId;
  final Value<String> value;
  final Value<int> order;
  final Value<int> relativeOrder;
  final Value<String> parentId;
  const NinElementarySegmentCompanion({
    this.id = const Value.absent(),
    this.lecId = const Value.absent(),
    this.value = const Value.absent(),
    this.order = const Value.absent(),
    this.relativeOrder = const Value.absent(),
    this.parentId = const Value.absent(),
  });
  NinElementarySegmentCompanion.insert({
    @required String id,
    this.lecId = const Value.absent(),
    this.value = const Value.absent(),
    this.order = const Value.absent(),
    this.relativeOrder = const Value.absent(),
    this.parentId = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinElementarySegmentData> custom({
    Expression<String> id,
    Expression<String> lecId,
    Expression<String> value,
    Expression<int> order,
    Expression<int> relativeOrder,
    Expression<String> parentId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (lecId != null) 'lec_id': lecId,
      if (value != null) 'value': value,
      if (order != null) 'order': order,
      if (relativeOrder != null) 'relative_order': relativeOrder,
      if (parentId != null) 'parent_id': parentId,
    });
  }

  NinElementarySegmentCompanion copyWith(
      {Value<String> id,
      Value<String> lecId,
      Value<String> value,
      Value<int> order,
      Value<int> relativeOrder,
      Value<String> parentId}) {
    return NinElementarySegmentCompanion(
      id: id ?? this.id,
      lecId: lecId ?? this.lecId,
      value: value ?? this.value,
      order: order ?? this.order,
      relativeOrder: relativeOrder ?? this.relativeOrder,
      parentId: parentId ?? this.parentId,
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
    if (relativeOrder.present) {
      map['relative_order'] = Variable<int>(relativeOrder.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentCompanion(')
          ..write('id: $id, ')
          ..write('lecId: $lecId, ')
          ..write('value: $value, ')
          ..write('order: $order, ')
          ..write('relativeOrder: $relativeOrder, ')
          ..write('parentId: $parentId')
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

  final VerificationMeta _relativeOrderMeta =
      const VerificationMeta('relativeOrder');
  GeneratedIntColumn _relativeOrder;
  GeneratedIntColumn get relativeOrder =>
      _relativeOrder ??= _constructRelativeOrder();
  GeneratedIntColumn _constructRelativeOrder() {
    return GeneratedIntColumn('relative_order', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _parentIdMeta = const VerificationMeta('parentId');
  GeneratedTextColumn _parentId;
  GeneratedTextColumn get parentId => _parentId ??= _constructParentId();
  GeneratedTextColumn _constructParentId() {
    return GeneratedTextColumn('parent_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, lecId, value, order, relativeOrder, parentId];
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
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order'], _orderMeta));
    }
    if (data.containsKey('relative_order')) {
      context.handle(
          _relativeOrderMeta,
          relativeOrder.isAcceptableOrUnknown(
              data['relative_order'], _relativeOrderMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id'], _parentIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
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
        'PRIMARY KEY (_id)',
        'FOREIGN KEY(lec_id) REFERENCES "nin_LEC" (_id)',
        'FOREIGN KEY(parent_id) REFERENCES "nin_ElementarySegment" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinGadValueData extends DataClass implements Insertable<NinGadValueData> {
  final int id;
  final int gadId;
  final int majorTypeId;
  final int m7ScaleId;
  NinGadValueData(
      {@required this.id, this.gadId, this.majorTypeId, this.m7ScaleId});
  factory NinGadValueData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return NinGadValueData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
      gadId: intType.mapFromDatabaseResponse(data['${effectivePrefix}gad_id']),
      majorTypeId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}majorType_id']),
      m7ScaleId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}m7Scale_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['_id'] = Variable<int>(id);
    }
    if (!nullToAbsent || gadId != null) {
      map['gad_id'] = Variable<int>(gadId);
    }
    if (!nullToAbsent || majorTypeId != null) {
      map['majorType_id'] = Variable<int>(majorTypeId);
    }
    if (!nullToAbsent || m7ScaleId != null) {
      map['m7Scale_id'] = Variable<int>(m7ScaleId);
    }
    return map;
  }

  NinGadValueCompanion toCompanion(bool nullToAbsent) {
    return NinGadValueCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      gadId:
          gadId == null && nullToAbsent ? const Value.absent() : Value(gadId),
      majorTypeId: majorTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeId),
      m7ScaleId: m7ScaleId == null && nullToAbsent
          ? const Value.absent()
          : Value(m7ScaleId),
    );
  }

  factory NinGadValueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinGadValueData(
      id: serializer.fromJson<int>(json['_id']),
      gadId: serializer.fromJson<int>(json['gad_id']),
      majorTypeId: serializer.fromJson<int>(json['majorType_id']),
      m7ScaleId: serializer.fromJson<int>(json['m7Scale_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<int>(id),
      'gad_id': serializer.toJson<int>(gadId),
      'majorType_id': serializer.toJson<int>(majorTypeId),
      'm7Scale_id': serializer.toJson<int>(m7ScaleId),
    };
  }

  NinGadValueData copyWith(
          {int id, int gadId, int majorTypeId, int m7ScaleId}) =>
      NinGadValueData(
        id: id ?? this.id,
        gadId: gadId ?? this.gadId,
        majorTypeId: majorTypeId ?? this.majorTypeId,
        m7ScaleId: m7ScaleId ?? this.m7ScaleId,
      );
  @override
  String toString() {
    return (StringBuffer('NinGadValueData(')
          ..write('id: $id, ')
          ..write('gadId: $gadId, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('m7ScaleId: $m7ScaleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(gadId.hashCode, $mrjc(majorTypeId.hashCode, m7ScaleId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinGadValueData &&
          other.id == this.id &&
          other.gadId == this.gadId &&
          other.majorTypeId == this.majorTypeId &&
          other.m7ScaleId == this.m7ScaleId);
}

class NinGadValueCompanion extends UpdateCompanion<NinGadValueData> {
  final Value<int> id;
  final Value<int> gadId;
  final Value<int> majorTypeId;
  final Value<int> m7ScaleId;
  const NinGadValueCompanion({
    this.id = const Value.absent(),
    this.gadId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.m7ScaleId = const Value.absent(),
  });
  NinGadValueCompanion.insert({
    this.id = const Value.absent(),
    this.gadId = const Value.absent(),
    this.majorTypeId = const Value.absent(),
    this.m7ScaleId = const Value.absent(),
  });
  static Insertable<NinGadValueData> custom({
    Expression<int> id,
    Expression<int> gadId,
    Expression<int> majorTypeId,
    Expression<int> m7ScaleId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (gadId != null) 'gad_id': gadId,
      if (majorTypeId != null) 'majorType_id': majorTypeId,
      if (m7ScaleId != null) 'm7Scale_id': m7ScaleId,
    });
  }

  NinGadValueCompanion copyWith(
      {Value<int> id,
      Value<int> gadId,
      Value<int> majorTypeId,
      Value<int> m7ScaleId}) {
    return NinGadValueCompanion(
      id: id ?? this.id,
      gadId: gadId ?? this.gadId,
      majorTypeId: majorTypeId ?? this.majorTypeId,
      m7ScaleId: m7ScaleId ?? this.m7ScaleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['_id'] = Variable<int>(id.value);
    }
    if (gadId.present) {
      map['gad_id'] = Variable<int>(gadId.value);
    }
    if (majorTypeId.present) {
      map['majorType_id'] = Variable<int>(majorTypeId.value);
    }
    if (m7ScaleId.present) {
      map['m7Scale_id'] = Variable<int>(m7ScaleId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinGadValueCompanion(')
          ..write('id: $id, ')
          ..write('gadId: $gadId, ')
          ..write('majorTypeId: $majorTypeId, ')
          ..write('m7ScaleId: $m7ScaleId')
          ..write(')'))
        .toString();
  }
}

class NinGadValue extends Table with TableInfo<NinGadValue, NinGadValueData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinGadValue(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _gadIdMeta = const VerificationMeta('gadId');
  GeneratedIntColumn _gadId;
  GeneratedIntColumn get gadId => _gadId ??= _constructGadId();
  GeneratedIntColumn _constructGadId() {
    return GeneratedIntColumn('gad_id', $tableName, true,
        $customConstraints: '');
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

  final VerificationMeta _m7ScaleIdMeta = const VerificationMeta('m7ScaleId');
  GeneratedIntColumn _m7ScaleId;
  GeneratedIntColumn get m7ScaleId => _m7ScaleId ??= _constructM7ScaleId();
  GeneratedIntColumn _constructM7ScaleId() {
    return GeneratedIntColumn('m7Scale_id', $tableName, true,
        $customConstraints: '');
  }

  @override
  List<GeneratedColumn> get $columns => [id, gadId, majorTypeId, m7ScaleId];
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
    if (data.containsKey('_id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['_id'], _idMeta));
    }
    if (data.containsKey('gad_id')) {
      context.handle(
          _gadIdMeta, gadId.isAcceptableOrUnknown(data['gad_id'], _gadIdMeta));
    }
    if (data.containsKey('majorType_id')) {
      context.handle(
          _majorTypeIdMeta,
          majorTypeId.isAcceptableOrUnknown(
              data['majorType_id'], _majorTypeIdMeta));
    }
    if (data.containsKey('m7Scale_id')) {
      context.handle(_m7ScaleIdMeta,
          m7ScaleId.isAcceptableOrUnknown(data['m7Scale_id'], _m7ScaleIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
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
        'PRIMARY KEY (_id)',
        'FOREIGN KEY(gad_id) REFERENCES "nin_GAD" ("artsKode")',
        'FOREIGN KEY("majorType_id") REFERENCES "nin_MajorType" (_id)',
        'FOREIGN KEY("m7Scale_id") REFERENCES "nin_GadScale" ("m7Scale")'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMinorTypeInfoData extends DataClass
    implements Insertable<NinMinorTypeInfoData> {
  final int minorTypeId;
  final int languageId;
  final String key;
  final String value;
  NinMinorTypeInfoData(
      {@required this.minorTypeId,
      @required this.languageId,
      @required this.key,
      this.value});
  factory NinMinorTypeInfoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinMinorTypeInfoData(
      minorTypeId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}minorType_id']),
      languageId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}language_id']),
      key: stringType.mapFromDatabaseResponse(data['${effectivePrefix}key']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || minorTypeId != null) {
      map['minorType_id'] = Variable<int>(minorTypeId);
    }
    if (!nullToAbsent || languageId != null) {
      map['language_id'] = Variable<int>(languageId);
    }
    if (!nullToAbsent || key != null) {
      map['key'] = Variable<String>(key);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  NinMinorTypeInfoCompanion toCompanion(bool nullToAbsent) {
    return NinMinorTypeInfoCompanion(
      minorTypeId: minorTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(minorTypeId),
      languageId: languageId == null && nullToAbsent
          ? const Value.absent()
          : Value(languageId),
      key: key == null && nullToAbsent ? const Value.absent() : Value(key),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory NinMinorTypeInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinMinorTypeInfoData(
      minorTypeId: serializer.fromJson<int>(json['minorType_id']),
      languageId: serializer.fromJson<int>(json['language_id']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'minorType_id': serializer.toJson<int>(minorTypeId),
      'language_id': serializer.toJson<int>(languageId),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  NinMinorTypeInfoData copyWith(
          {int minorTypeId, int languageId, String key, String value}) =>
      NinMinorTypeInfoData(
        minorTypeId: minorTypeId ?? this.minorTypeId,
        languageId: languageId ?? this.languageId,
        key: key ?? this.key,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('NinMinorTypeInfoData(')
          ..write('minorTypeId: $minorTypeId, ')
          ..write('languageId: $languageId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(minorTypeId.hashCode,
      $mrjc(languageId.hashCode, $mrjc(key.hashCode, value.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinMinorTypeInfoData &&
          other.minorTypeId == this.minorTypeId &&
          other.languageId == this.languageId &&
          other.key == this.key &&
          other.value == this.value);
}

class NinMinorTypeInfoCompanion extends UpdateCompanion<NinMinorTypeInfoData> {
  final Value<int> minorTypeId;
  final Value<int> languageId;
  final Value<String> key;
  final Value<String> value;
  const NinMinorTypeInfoCompanion({
    this.minorTypeId = const Value.absent(),
    this.languageId = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
  });
  NinMinorTypeInfoCompanion.insert({
    @required int minorTypeId,
    @required int languageId,
    @required String key,
    this.value = const Value.absent(),
  })  : minorTypeId = Value(minorTypeId),
        languageId = Value(languageId),
        key = Value(key);
  static Insertable<NinMinorTypeInfoData> custom({
    Expression<int> minorTypeId,
    Expression<int> languageId,
    Expression<String> key,
    Expression<String> value,
  }) {
    return RawValuesInsertable({
      if (minorTypeId != null) 'minorType_id': minorTypeId,
      if (languageId != null) 'language_id': languageId,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    });
  }

  NinMinorTypeInfoCompanion copyWith(
      {Value<int> minorTypeId,
      Value<int> languageId,
      Value<String> key,
      Value<String> value}) {
    return NinMinorTypeInfoCompanion(
      minorTypeId: minorTypeId ?? this.minorTypeId,
      languageId: languageId ?? this.languageId,
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (minorTypeId.present) {
      map['minorType_id'] = Variable<int>(minorTypeId.value);
    }
    if (languageId.present) {
      map['language_id'] = Variable<int>(languageId.value);
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
    return (StringBuffer('NinMinorTypeInfoCompanion(')
          ..write('minorTypeId: $minorTypeId, ')
          ..write('languageId: $languageId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class NinMinorTypeInfo extends Table
    with TableInfo<NinMinorTypeInfo, NinMinorTypeInfoData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinMinorTypeInfo(this._db, [this._alias]);
  final VerificationMeta _minorTypeIdMeta =
      const VerificationMeta('minorTypeId');
  GeneratedIntColumn _minorTypeId;
  GeneratedIntColumn get minorTypeId =>
      _minorTypeId ??= _constructMinorTypeId();
  GeneratedIntColumn _constructMinorTypeId() {
    return GeneratedIntColumn('minorType_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _languageIdMeta = const VerificationMeta('languageId');
  GeneratedIntColumn _languageId;
  GeneratedIntColumn get languageId => _languageId ??= _constructLanguageId();
  GeneratedIntColumn _constructLanguageId() {
    return GeneratedIntColumn('language_id', $tableName, false,
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
  List<GeneratedColumn> get $columns => [minorTypeId, languageId, key, value];
  @override
  NinMinorTypeInfo get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_MinorTypeInfo';
  @override
  final String actualTableName = 'nin_MinorTypeInfo';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinMinorTypeInfoData> instance,
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
  Set<GeneratedColumn> get $primaryKey => {minorTypeId, languageId, key};
  @override
  NinMinorTypeInfoData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinMinorTypeInfoData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  NinMinorTypeInfo createAlias(String alias) {
    return NinMinorTypeInfo(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY ("minorType_id", language_id, "key")',
        'FOREIGN KEY("minorType_id") REFERENCES "nin_MinorType" (_id)',
        'FOREIGN KEY(language_id) REFERENCES "nin_Language" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinMinorTypeScaledData extends DataClass
    implements Insertable<NinMinorTypeScaledData> {
  final String id;
  final int minorTypeId;
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
      minorTypeId: intType
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
      map['minorType_id'] = Variable<int>(minorTypeId);
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
      minorTypeId: serializer.fromJson<int>(json['minorType_id']),
      mappingScaleId: serializer.fromJson<int>(json['mappingScale_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'minorType_id': serializer.toJson<int>(minorTypeId),
      'mappingScale_id': serializer.toJson<int>(mappingScaleId),
    };
  }

  NinMinorTypeScaledData copyWith(
          {String id, int minorTypeId, int mappingScaleId}) =>
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
  final Value<int> minorTypeId;
  final Value<int> mappingScaleId;
  const NinMinorTypeScaledCompanion({
    this.id = const Value.absent(),
    this.minorTypeId = const Value.absent(),
    this.mappingScaleId = const Value.absent(),
  });
  NinMinorTypeScaledCompanion.insert({
    @required String id,
    @required int minorTypeId,
    this.mappingScaleId = const Value.absent(),
  })  : id = Value(id),
        minorTypeId = Value(minorTypeId);
  static Insertable<NinMinorTypeScaledData> custom({
    Expression<String> id,
    Expression<int> minorTypeId,
    Expression<int> mappingScaleId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (minorTypeId != null) 'minorType_id': minorTypeId,
      if (mappingScaleId != null) 'mappingScale_id': mappingScaleId,
    });
  }

  NinMinorTypeScaledCompanion copyWith(
      {Value<String> id, Value<int> minorTypeId, Value<int> mappingScaleId}) {
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
      map['minorType_id'] = Variable<int>(minorTypeId.value);
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
  GeneratedIntColumn _minorTypeId;
  GeneratedIntColumn get minorTypeId =>
      _minorTypeId ??= _constructMinorTypeId();
  GeneratedIntColumn _constructMinorTypeId() {
    return GeneratedIntColumn('minorType_id', $tableName, false,
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

class NinElementarySegmentInfoData extends DataClass
    implements Insertable<NinElementarySegmentInfoData> {
  final int elementarySegmentId;
  final int languageId;
  final String key;
  final String value;
  NinElementarySegmentInfoData(
      {@required this.elementarySegmentId,
      @required this.languageId,
      @required this.key,
      this.value});
  factory NinElementarySegmentInfoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return NinElementarySegmentInfoData(
      elementarySegmentId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}elementarySegment_id']),
      languageId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}language_id']),
      key: stringType.mapFromDatabaseResponse(data['${effectivePrefix}key']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || elementarySegmentId != null) {
      map['elementarySegment_id'] = Variable<int>(elementarySegmentId);
    }
    if (!nullToAbsent || languageId != null) {
      map['language_id'] = Variable<int>(languageId);
    }
    if (!nullToAbsent || key != null) {
      map['key'] = Variable<String>(key);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  NinElementarySegmentInfoCompanion toCompanion(bool nullToAbsent) {
    return NinElementarySegmentInfoCompanion(
      elementarySegmentId: elementarySegmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(elementarySegmentId),
      languageId: languageId == null && nullToAbsent
          ? const Value.absent()
          : Value(languageId),
      key: key == null && nullToAbsent ? const Value.absent() : Value(key),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory NinElementarySegmentInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinElementarySegmentInfoData(
      elementarySegmentId:
          serializer.fromJson<int>(json['elementarySegment_id']),
      languageId: serializer.fromJson<int>(json['language_id']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'elementarySegment_id': serializer.toJson<int>(elementarySegmentId),
      'language_id': serializer.toJson<int>(languageId),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  NinElementarySegmentInfoData copyWith(
          {int elementarySegmentId,
          int languageId,
          String key,
          String value}) =>
      NinElementarySegmentInfoData(
        elementarySegmentId: elementarySegmentId ?? this.elementarySegmentId,
        languageId: languageId ?? this.languageId,
        key: key ?? this.key,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('NinElementarySegmentInfoData(')
          ..write('elementarySegmentId: $elementarySegmentId, ')
          ..write('languageId: $languageId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(elementarySegmentId.hashCode,
      $mrjc(languageId.hashCode, $mrjc(key.hashCode, value.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinElementarySegmentInfoData &&
          other.elementarySegmentId == this.elementarySegmentId &&
          other.languageId == this.languageId &&
          other.key == this.key &&
          other.value == this.value);
}

class NinElementarySegmentInfoCompanion
    extends UpdateCompanion<NinElementarySegmentInfoData> {
  final Value<int> elementarySegmentId;
  final Value<int> languageId;
  final Value<String> key;
  final Value<String> value;
  const NinElementarySegmentInfoCompanion({
    this.elementarySegmentId = const Value.absent(),
    this.languageId = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
  });
  NinElementarySegmentInfoCompanion.insert({
    @required int elementarySegmentId,
    @required int languageId,
    @required String key,
    this.value = const Value.absent(),
  })  : elementarySegmentId = Value(elementarySegmentId),
        languageId = Value(languageId),
        key = Value(key);
  static Insertable<NinElementarySegmentInfoData> custom({
    Expression<int> elementarySegmentId,
    Expression<int> languageId,
    Expression<String> key,
    Expression<String> value,
  }) {
    return RawValuesInsertable({
      if (elementarySegmentId != null)
        'elementarySegment_id': elementarySegmentId,
      if (languageId != null) 'language_id': languageId,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    });
  }

  NinElementarySegmentInfoCompanion copyWith(
      {Value<int> elementarySegmentId,
      Value<int> languageId,
      Value<String> key,
      Value<String> value}) {
    return NinElementarySegmentInfoCompanion(
      elementarySegmentId: elementarySegmentId ?? this.elementarySegmentId,
      languageId: languageId ?? this.languageId,
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (elementarySegmentId.present) {
      map['elementarySegment_id'] = Variable<int>(elementarySegmentId.value);
    }
    if (languageId.present) {
      map['language_id'] = Variable<int>(languageId.value);
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
    return (StringBuffer('NinElementarySegmentInfoCompanion(')
          ..write('elementarySegmentId: $elementarySegmentId, ')
          ..write('languageId: $languageId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class NinElementarySegmentInfo extends Table
    with TableInfo<NinElementarySegmentInfo, NinElementarySegmentInfoData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinElementarySegmentInfo(this._db, [this._alias]);
  final VerificationMeta _elementarySegmentIdMeta =
      const VerificationMeta('elementarySegmentId');
  GeneratedIntColumn _elementarySegmentId;
  GeneratedIntColumn get elementarySegmentId =>
      _elementarySegmentId ??= _constructElementarySegmentId();
  GeneratedIntColumn _constructElementarySegmentId() {
    return GeneratedIntColumn('elementarySegment_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _languageIdMeta = const VerificationMeta('languageId');
  GeneratedIntColumn _languageId;
  GeneratedIntColumn get languageId => _languageId ??= _constructLanguageId();
  GeneratedIntColumn _constructLanguageId() {
    return GeneratedIntColumn('language_id', $tableName, false,
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
  List<GeneratedColumn> get $columns =>
      [elementarySegmentId, languageId, key, value];
  @override
  NinElementarySegmentInfo get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_ElementarySegmentInfo';
  @override
  final String actualTableName = 'nin_ElementarySegmentInfo';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinElementarySegmentInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('elementarySegment_id')) {
      context.handle(
          _elementarySegmentIdMeta,
          elementarySegmentId.isAcceptableOrUnknown(
              data['elementarySegment_id'], _elementarySegmentIdMeta));
    } else if (isInserting) {
      context.missing(_elementarySegmentIdMeta);
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
  Set<GeneratedColumn> get $primaryKey =>
      {elementarySegmentId, languageId, key};
  @override
  NinElementarySegmentInfoData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinElementarySegmentInfoData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  NinElementarySegmentInfo createAlias(String alias) {
    return NinElementarySegmentInfo(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY ("elementarySegment_id", language_id, "key")',
        'FOREIGN KEY("elementarySegment_id") REFERENCES "nin_ElementarySegment" (_id)',
        'FOREIGN KEY(language_id) REFERENCES "nin_Language" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinStandardSegmentData extends DataClass
    implements Insertable<NinStandardSegmentData> {
  final String id;
  final String majorTypeLECId;
  NinStandardSegmentData({@required this.id, this.majorTypeLECId});
  factory NinStandardSegmentData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinStandardSegmentData(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}_id']),
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
    if (!nullToAbsent || majorTypeLECId != null) {
      map['majorTypeLEC_id'] = Variable<String>(majorTypeLECId);
    }
    return map;
  }

  NinStandardSegmentCompanion toCompanion(bool nullToAbsent) {
    return NinStandardSegmentCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      majorTypeLECId: majorTypeLECId == null && nullToAbsent
          ? const Value.absent()
          : Value(majorTypeLECId),
    );
  }

  factory NinStandardSegmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinStandardSegmentData(
      id: serializer.fromJson<String>(json['_id']),
      majorTypeLECId: serializer.fromJson<String>(json['majorTypeLEC_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      '_id': serializer.toJson<String>(id),
      'majorTypeLEC_id': serializer.toJson<String>(majorTypeLECId),
    };
  }

  NinStandardSegmentData copyWith({String id, String majorTypeLECId}) =>
      NinStandardSegmentData(
        id: id ?? this.id,
        majorTypeLECId: majorTypeLECId ?? this.majorTypeLECId,
      );
  @override
  String toString() {
    return (StringBuffer('NinStandardSegmentData(')
          ..write('id: $id, ')
          ..write('majorTypeLECId: $majorTypeLECId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, majorTypeLECId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinStandardSegmentData &&
          other.id == this.id &&
          other.majorTypeLECId == this.majorTypeLECId);
}

class NinStandardSegmentCompanion
    extends UpdateCompanion<NinStandardSegmentData> {
  final Value<String> id;
  final Value<String> majorTypeLECId;
  const NinStandardSegmentCompanion({
    this.id = const Value.absent(),
    this.majorTypeLECId = const Value.absent(),
  });
  NinStandardSegmentCompanion.insert({
    @required String id,
    this.majorTypeLECId = const Value.absent(),
  }) : id = Value(id);
  static Insertable<NinStandardSegmentData> custom({
    Expression<String> id,
    Expression<String> majorTypeLECId,
  }) {
    return RawValuesInsertable({
      if (id != null) '_id': id,
      if (majorTypeLECId != null) 'majorTypeLEC_id': majorTypeLECId,
    });
  }

  NinStandardSegmentCompanion copyWith(
      {Value<String> id, Value<String> majorTypeLECId}) {
    return NinStandardSegmentCompanion(
      id: id ?? this.id,
      majorTypeLECId: majorTypeLECId ?? this.majorTypeLECId,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinStandardSegmentCompanion(')
          ..write('id: $id, ')
          ..write('majorTypeLECId: $majorTypeLECId')
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

  @override
  List<GeneratedColumn> get $columns => [id, majorTypeLECId];
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
        'FOREIGN KEY("majorTypeLEC_id") REFERENCES "nin_MajorTypeLEC" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class NinGadValueElementarySegmentData extends DataClass
    implements Insertable<NinGadValueElementarySegmentData> {
  final int gadId;
  final int elementarySegmentId;
  NinGadValueElementarySegmentData(
      {@required this.gadId, @required this.elementarySegmentId});
  factory NinGadValueElementarySegmentData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return NinGadValueElementarySegmentData(
      gadId: intType.mapFromDatabaseResponse(data['${effectivePrefix}gad_id']),
      elementarySegmentId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}elementarySegment_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || gadId != null) {
      map['gad_id'] = Variable<int>(gadId);
    }
    if (!nullToAbsent || elementarySegmentId != null) {
      map['elementarySegment_id'] = Variable<int>(elementarySegmentId);
    }
    return map;
  }

  NinGadValueElementarySegmentCompanion toCompanion(bool nullToAbsent) {
    return NinGadValueElementarySegmentCompanion(
      gadId:
          gadId == null && nullToAbsent ? const Value.absent() : Value(gadId),
      elementarySegmentId: elementarySegmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(elementarySegmentId),
    );
  }

  factory NinGadValueElementarySegmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinGadValueElementarySegmentData(
      gadId: serializer.fromJson<int>(json['gad_id']),
      elementarySegmentId:
          serializer.fromJson<int>(json['elementarySegment_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'gad_id': serializer.toJson<int>(gadId),
      'elementarySegment_id': serializer.toJson<int>(elementarySegmentId),
    };
  }

  NinGadValueElementarySegmentData copyWith(
          {int gadId, int elementarySegmentId}) =>
      NinGadValueElementarySegmentData(
        gadId: gadId ?? this.gadId,
        elementarySegmentId: elementarySegmentId ?? this.elementarySegmentId,
      );
  @override
  String toString() {
    return (StringBuffer('NinGadValueElementarySegmentData(')
          ..write('gadId: $gadId, ')
          ..write('elementarySegmentId: $elementarySegmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(gadId.hashCode, elementarySegmentId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinGadValueElementarySegmentData &&
          other.gadId == this.gadId &&
          other.elementarySegmentId == this.elementarySegmentId);
}

class NinGadValueElementarySegmentCompanion
    extends UpdateCompanion<NinGadValueElementarySegmentData> {
  final Value<int> gadId;
  final Value<int> elementarySegmentId;
  const NinGadValueElementarySegmentCompanion({
    this.gadId = const Value.absent(),
    this.elementarySegmentId = const Value.absent(),
  });
  NinGadValueElementarySegmentCompanion.insert({
    @required int gadId,
    @required int elementarySegmentId,
  })  : gadId = Value(gadId),
        elementarySegmentId = Value(elementarySegmentId);
  static Insertable<NinGadValueElementarySegmentData> custom({
    Expression<int> gadId,
    Expression<int> elementarySegmentId,
  }) {
    return RawValuesInsertable({
      if (gadId != null) 'gad_id': gadId,
      if (elementarySegmentId != null)
        'elementarySegment_id': elementarySegmentId,
    });
  }

  NinGadValueElementarySegmentCompanion copyWith(
      {Value<int> gadId, Value<int> elementarySegmentId}) {
    return NinGadValueElementarySegmentCompanion(
      gadId: gadId ?? this.gadId,
      elementarySegmentId: elementarySegmentId ?? this.elementarySegmentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (gadId.present) {
      map['gad_id'] = Variable<int>(gadId.value);
    }
    if (elementarySegmentId.present) {
      map['elementarySegment_id'] = Variable<int>(elementarySegmentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinGadValueElementarySegmentCompanion(')
          ..write('gadId: $gadId, ')
          ..write('elementarySegmentId: $elementarySegmentId')
          ..write(')'))
        .toString();
  }
}

class NinGadValueElementarySegment extends Table
    with
        TableInfo<NinGadValueElementarySegment,
            NinGadValueElementarySegmentData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinGadValueElementarySegment(this._db, [this._alias]);
  final VerificationMeta _gadIdMeta = const VerificationMeta('gadId');
  GeneratedIntColumn _gadId;
  GeneratedIntColumn get gadId => _gadId ??= _constructGadId();
  GeneratedIntColumn _constructGadId() {
    return GeneratedIntColumn('gad_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _elementarySegmentIdMeta =
      const VerificationMeta('elementarySegmentId');
  GeneratedIntColumn _elementarySegmentId;
  GeneratedIntColumn get elementarySegmentId =>
      _elementarySegmentId ??= _constructElementarySegmentId();
  GeneratedIntColumn _constructElementarySegmentId() {
    return GeneratedIntColumn('elementarySegment_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  @override
  List<GeneratedColumn> get $columns => [gadId, elementarySegmentId];
  @override
  NinGadValueElementarySegment get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_GadValueElementarySegment';
  @override
  final String actualTableName = 'nin_GadValueElementarySegment';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinGadValueElementarySegmentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('gad_id')) {
      context.handle(
          _gadIdMeta, gadId.isAcceptableOrUnknown(data['gad_id'], _gadIdMeta));
    } else if (isInserting) {
      context.missing(_gadIdMeta);
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
  Set<GeneratedColumn> get $primaryKey => {gadId, elementarySegmentId};
  @override
  NinGadValueElementarySegmentData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinGadValueElementarySegmentData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  NinGadValueElementarySegment createAlias(String alias) {
    return NinGadValueElementarySegment(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY (gad_id, "elementarySegment_id")',
        'FOREIGN KEY(gad_id) REFERENCES "nin_GadValue" (_id)',
        'FOREIGN KEY("elementarySegment_id") REFERENCES "nin_ElementarySegment" (_id)'
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

class NinStandardSegmentInfoData extends DataClass
    implements Insertable<NinStandardSegmentInfoData> {
  final String standardSegmentId;
  final String languageId;
  final String value;
  NinStandardSegmentInfoData(
      {@required this.standardSegmentId,
      @required this.languageId,
      this.value});
  factory NinStandardSegmentInfoData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return NinStandardSegmentInfoData(
      standardSegmentId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}standardSegment_id']),
      languageId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}language_id']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || standardSegmentId != null) {
      map['standardSegment_id'] = Variable<String>(standardSegmentId);
    }
    if (!nullToAbsent || languageId != null) {
      map['language_id'] = Variable<String>(languageId);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  NinStandardSegmentInfoCompanion toCompanion(bool nullToAbsent) {
    return NinStandardSegmentInfoCompanion(
      standardSegmentId: standardSegmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(standardSegmentId),
      languageId: languageId == null && nullToAbsent
          ? const Value.absent()
          : Value(languageId),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory NinStandardSegmentInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NinStandardSegmentInfoData(
      standardSegmentId:
          serializer.fromJson<String>(json['standardSegment_id']),
      languageId: serializer.fromJson<String>(json['language_id']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'standardSegment_id': serializer.toJson<String>(standardSegmentId),
      'language_id': serializer.toJson<String>(languageId),
      'value': serializer.toJson<String>(value),
    };
  }

  NinStandardSegmentInfoData copyWith(
          {String standardSegmentId, String languageId, String value}) =>
      NinStandardSegmentInfoData(
        standardSegmentId: standardSegmentId ?? this.standardSegmentId,
        languageId: languageId ?? this.languageId,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('NinStandardSegmentInfoData(')
          ..write('standardSegmentId: $standardSegmentId, ')
          ..write('languageId: $languageId, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      standardSegmentId.hashCode, $mrjc(languageId.hashCode, value.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NinStandardSegmentInfoData &&
          other.standardSegmentId == this.standardSegmentId &&
          other.languageId == this.languageId &&
          other.value == this.value);
}

class NinStandardSegmentInfoCompanion
    extends UpdateCompanion<NinStandardSegmentInfoData> {
  final Value<String> standardSegmentId;
  final Value<String> languageId;
  final Value<String> value;
  const NinStandardSegmentInfoCompanion({
    this.standardSegmentId = const Value.absent(),
    this.languageId = const Value.absent(),
    this.value = const Value.absent(),
  });
  NinStandardSegmentInfoCompanion.insert({
    @required String standardSegmentId,
    @required String languageId,
    this.value = const Value.absent(),
  })  : standardSegmentId = Value(standardSegmentId),
        languageId = Value(languageId);
  static Insertable<NinStandardSegmentInfoData> custom({
    Expression<String> standardSegmentId,
    Expression<String> languageId,
    Expression<String> value,
  }) {
    return RawValuesInsertable({
      if (standardSegmentId != null) 'standardSegment_id': standardSegmentId,
      if (languageId != null) 'language_id': languageId,
      if (value != null) 'value': value,
    });
  }

  NinStandardSegmentInfoCompanion copyWith(
      {Value<String> standardSegmentId,
      Value<String> languageId,
      Value<String> value}) {
    return NinStandardSegmentInfoCompanion(
      standardSegmentId: standardSegmentId ?? this.standardSegmentId,
      languageId: languageId ?? this.languageId,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (standardSegmentId.present) {
      map['standardSegment_id'] = Variable<String>(standardSegmentId.value);
    }
    if (languageId.present) {
      map['language_id'] = Variable<String>(languageId.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NinStandardSegmentInfoCompanion(')
          ..write('standardSegmentId: $standardSegmentId, ')
          ..write('languageId: $languageId, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class NinStandardSegmentInfo extends Table
    with TableInfo<NinStandardSegmentInfo, NinStandardSegmentInfoData> {
  final GeneratedDatabase _db;
  final String _alias;
  NinStandardSegmentInfo(this._db, [this._alias]);
  final VerificationMeta _standardSegmentIdMeta =
      const VerificationMeta('standardSegmentId');
  GeneratedTextColumn _standardSegmentId;
  GeneratedTextColumn get standardSegmentId =>
      _standardSegmentId ??= _constructStandardSegmentId();
  GeneratedTextColumn _constructStandardSegmentId() {
    return GeneratedTextColumn('standardSegment_id', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _languageIdMeta = const VerificationMeta('languageId');
  GeneratedTextColumn _languageId;
  GeneratedTextColumn get languageId => _languageId ??= _constructLanguageId();
  GeneratedTextColumn _constructLanguageId() {
    return GeneratedTextColumn('language_id', $tableName, false,
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
  List<GeneratedColumn> get $columns => [standardSegmentId, languageId, value];
  @override
  NinStandardSegmentInfo get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'nin_StandardSegmentInfo';
  @override
  final String actualTableName = 'nin_StandardSegmentInfo';
  @override
  VerificationContext validateIntegrity(
      Insertable<NinStandardSegmentInfoData> instance,
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
    if (data.containsKey('language_id')) {
      context.handle(
          _languageIdMeta,
          languageId.isAcceptableOrUnknown(
              data['language_id'], _languageIdMeta));
    } else if (isInserting) {
      context.missing(_languageIdMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {standardSegmentId, languageId};
  @override
  NinStandardSegmentInfoData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NinStandardSegmentInfoData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  NinStandardSegmentInfo createAlias(String alias) {
    return NinStandardSegmentInfo(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY ("standardSegment_id", language_id)',
        'FOREIGN KEY("standardSegment_id") REFERENCES "nin_StandardSegment" (_id)',
        'FOREIGN KEY(language_id) REFERENCES "nin_Language" (_id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

abstract class _$NiNDatabase extends GeneratedDatabase {
  _$NiNDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  NinLanguage _ninLanguage;
  NinLanguage get ninLanguage => _ninLanguage ??= NinLanguage(this);
  NinMajorTypeGroup _ninMajorTypeGroup;
  NinMajorTypeGroup get ninMajorTypeGroup =>
      _ninMajorTypeGroup ??= NinMajorTypeGroup(this);
  NinMappingScale _ninMappingScale;
  NinMappingScale get ninMappingScale =>
      _ninMappingScale ??= NinMappingScale(this);
  NinStructuringProcess _ninStructuringProcess;
  NinStructuringProcess get ninStructuringProcess =>
      _ninStructuringProcess ??= NinStructuringProcess(this);
  NinPatternOfVariation _ninPatternOfVariation;
  NinPatternOfVariation get ninPatternOfVariation =>
      _ninPatternOfVariation ??= NinPatternOfVariation(this);
  NinLECType _ninLECType;
  NinLECType get ninLECType => _ninLECType ??= NinLECType(this);
  NinGadScale _ninGadScale;
  NinGadScale get ninGadScale => _ninGadScale ??= NinGadScale(this);
  NinGAD _ninGAD;
  NinGAD get ninGAD => _ninGAD ??= NinGAD(this);
  NinMajorTypeGroupInfo _ninMajorTypeGroupInfo;
  NinMajorTypeGroupInfo get ninMajorTypeGroupInfo =>
      _ninMajorTypeGroupInfo ??= NinMajorTypeGroupInfo(this);
  NinMajorType _ninMajorType;
  NinMajorType get ninMajorType => _ninMajorType ??= NinMajorType(this);
  NinLEC _ninLEC;
  NinLEC get ninLEC => _ninLEC ??= NinLEC(this);
  NinStructuringProcessInfo _ninStructuringProcessInfo;
  NinStructuringProcessInfo get ninStructuringProcessInfo =>
      _ninStructuringProcessInfo ??= NinStructuringProcessInfo(this);
  NinPatternOfVariationInfo _ninPatternOfVariationInfo;
  NinPatternOfVariationInfo get ninPatternOfVariationInfo =>
      _ninPatternOfVariationInfo ??= NinPatternOfVariationInfo(this);
  NinLECTypeInfo _ninLECTypeInfo;
  NinLECTypeInfo get ninLECTypeInfo => _ninLECTypeInfo ??= NinLECTypeInfo(this);
  NinMajorTypeInfo _ninMajorTypeInfo;
  NinMajorTypeInfo get ninMajorTypeInfo =>
      _ninMajorTypeInfo ??= NinMajorTypeInfo(this);
  NinMinorType _ninMinorType;
  NinMinorType get ninMinorType => _ninMinorType ??= NinMinorType(this);
  NinLECInfo _ninLECInfo;
  NinLECInfo get ninLECInfo => _ninLECInfo ??= NinLECInfo(this);
  NinMajorTypeLEC _ninMajorTypeLEC;
  NinMajorTypeLEC get ninMajorTypeLEC =>
      _ninMajorTypeLEC ??= NinMajorTypeLEC(this);
  NinElementarySegment _ninElementarySegment;
  NinElementarySegment get ninElementarySegment =>
      _ninElementarySegment ??= NinElementarySegment(this);
  NinGadValue _ninGadValue;
  NinGadValue get ninGadValue => _ninGadValue ??= NinGadValue(this);
  NinMinorTypeInfo _ninMinorTypeInfo;
  NinMinorTypeInfo get ninMinorTypeInfo =>
      _ninMinorTypeInfo ??= NinMinorTypeInfo(this);
  NinMinorTypeScaled _ninMinorTypeScaled;
  NinMinorTypeScaled get ninMinorTypeScaled =>
      _ninMinorTypeScaled ??= NinMinorTypeScaled(this);
  NinElementarySegmentInfo _ninElementarySegmentInfo;
  NinElementarySegmentInfo get ninElementarySegmentInfo =>
      _ninElementarySegmentInfo ??= NinElementarySegmentInfo(this);
  NinStandardSegment _ninStandardSegment;
  NinStandardSegment get ninStandardSegment =>
      _ninStandardSegment ??= NinStandardSegment(this);
  NinGadValueElementarySegment _ninGadValueElementarySegment;
  NinGadValueElementarySegment get ninGadValueElementarySegment =>
      _ninGadValueElementarySegment ??= NinGadValueElementarySegment(this);
  NinMinorTypeStandardSegment _ninMinorTypeStandardSegment;
  NinMinorTypeStandardSegment get ninMinorTypeStandardSegment =>
      _ninMinorTypeStandardSegment ??= NinMinorTypeStandardSegment(this);
  NinStandardSegmentElement _ninStandardSegmentElement;
  NinStandardSegmentElement get ninStandardSegmentElement =>
      _ninStandardSegmentElement ??= NinStandardSegmentElement(this);
  NinStandardSegmentInfo _ninStandardSegmentInfo;
  NinStandardSegmentInfo get ninStandardSegmentInfo =>
      _ninStandardSegmentInfo ??= NinStandardSegmentInfo(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        ninLanguage,
        ninMajorTypeGroup,
        ninMappingScale,
        ninStructuringProcess,
        ninPatternOfVariation,
        ninLECType,
        ninGadScale,
        ninGAD,
        ninMajorTypeGroupInfo,
        ninMajorType,
        ninLEC,
        ninStructuringProcessInfo,
        ninPatternOfVariationInfo,
        ninLECTypeInfo,
        ninMajorTypeInfo,
        ninMinorType,
        ninLECInfo,
        ninMajorTypeLEC,
        ninElementarySegment,
        ninGadValue,
        ninMinorTypeInfo,
        ninMinorTypeScaled,
        ninElementarySegmentInfo,
        ninStandardSegment,
        ninGadValueElementarySegment,
        ninMinorTypeStandardSegment,
        ninStandardSegmentElement,
        ninStandardSegmentInfo
      ];
}
