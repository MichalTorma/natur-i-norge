// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_description.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class T4Data extends DataClass implements Insertable<T4Data> {
  final int index;
  final String c_NyRad;
  final String c_Artsgruppe;
  final String c_Art;
  final String c_Autor;
  final String c_NorskNavn;
  final String c_X;
  final String c_Artskode;
  final int c_11;
  final int c_12;
  final int c_13;
  final int c_14;
  final int c_15;
  final int c_16;
  final int c_17;
  final int c_18;
  final int c_21;
  final int c_22;
  final int c_23;
  final int c_24;
  final int c_25;
  final int c_26;
  final int c_27;
  final int c_28;
  final int c_31;
  final int c_32;
  final int c_33;
  final int c_34;
  final int c_35;
  final int c_36;
  final int c_37;
  final int c_38;
  final int c_41;
  final int c_42;
  final int c_43;
  final int c_44;
  final int c_45;
  final int c_46;
  final int c_47;
  final int c_48;
  final int c_51;
  final int c_52;
  final int c_53;
  final int c_54;
  final int c_55;
  final int c_56;
  final int c_57;
  final int c_58;
  final int c_61;
  final int c_62;
  final int c_63;
  final int c_64;
  final int c_65;
  final int c_66;
  final int c_67;
  final int c_68;
  final int c_71;
  final int c_72;
  final int c_73;
  final int c_74;
  final int c_75;
  final int c_76;
  final int c_77;
  final int c_78;
  final int c_81;
  final int c_82;
  final int c_83;
  final int c_84;
  final int c_85;
  final int c_86;
  final int c_87;
  final int c_88;
  final int c_K3;
  final int c_K4;
  final int c_K5;
  final int c_K6;
  final int c_K7;
  final int c_K8;
  final int c_V37;
  final int c_V38;
  final int c_V47;
  final int c_V48;
  final int c_V57;
  final int c_V58;
  final int c_V67;
  final int c_V68;
  T4Data(
      {@required this.index,
      @required this.c_NyRad,
      @required this.c_Artsgruppe,
      @required this.c_Art,
      @required this.c_Autor,
      @required this.c_NorskNavn,
      @required this.c_X,
      @required this.c_Artskode,
      this.c_11,
      this.c_12,
      this.c_13,
      this.c_14,
      this.c_15,
      this.c_16,
      this.c_17,
      this.c_18,
      this.c_21,
      this.c_22,
      this.c_23,
      this.c_24,
      this.c_25,
      this.c_26,
      this.c_27,
      this.c_28,
      this.c_31,
      this.c_32,
      this.c_33,
      this.c_34,
      this.c_35,
      this.c_36,
      this.c_37,
      this.c_38,
      this.c_41,
      this.c_42,
      this.c_43,
      this.c_44,
      this.c_45,
      this.c_46,
      this.c_47,
      this.c_48,
      this.c_51,
      this.c_52,
      this.c_53,
      this.c_54,
      this.c_55,
      this.c_56,
      this.c_57,
      this.c_58,
      this.c_61,
      this.c_62,
      this.c_63,
      this.c_64,
      this.c_65,
      this.c_66,
      this.c_67,
      this.c_68,
      this.c_71,
      this.c_72,
      this.c_73,
      this.c_74,
      this.c_75,
      this.c_76,
      this.c_77,
      this.c_78,
      this.c_81,
      this.c_82,
      this.c_83,
      this.c_84,
      this.c_85,
      this.c_86,
      this.c_87,
      this.c_88,
      this.c_K3,
      this.c_K4,
      this.c_K5,
      this.c_K6,
      this.c_K7,
      this.c_K8,
      this.c_V37,
      this.c_V38,
      this.c_V47,
      this.c_V48,
      this.c_V57,
      this.c_V58,
      this.c_V67,
      this.c_V68});
  factory T4Data.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return T4Data(
      index: intType.mapFromDatabaseResponse(data['${effectivePrefix}index']),
      c_NyRad:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}c_NyRad']),
      c_Artsgruppe: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}c_Artsgruppe']),
      c_Art:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}c_Art']),
      c_Autor:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}c_Autor']),
      c_NorskNavn: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}c_NorskNavn']),
      c_X: stringType.mapFromDatabaseResponse(data['${effectivePrefix}c_X']),
      c_Artskode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}c_Artskode']),
      c_11: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_11']),
      c_12: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_12']),
      c_13: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_13']),
      c_14: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_14']),
      c_15: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_15']),
      c_16: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_16']),
      c_17: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_17']),
      c_18: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_18']),
      c_21: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_21']),
      c_22: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_22']),
      c_23: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_23']),
      c_24: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_24']),
      c_25: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_25']),
      c_26: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_26']),
      c_27: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_27']),
      c_28: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_28']),
      c_31: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_31']),
      c_32: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_32']),
      c_33: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_33']),
      c_34: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_34']),
      c_35: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_35']),
      c_36: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_36']),
      c_37: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_37']),
      c_38: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_38']),
      c_41: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_41']),
      c_42: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_42']),
      c_43: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_43']),
      c_44: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_44']),
      c_45: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_45']),
      c_46: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_46']),
      c_47: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_47']),
      c_48: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_48']),
      c_51: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_51']),
      c_52: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_52']),
      c_53: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_53']),
      c_54: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_54']),
      c_55: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_55']),
      c_56: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_56']),
      c_57: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_57']),
      c_58: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_58']),
      c_61: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_61']),
      c_62: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_62']),
      c_63: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_63']),
      c_64: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_64']),
      c_65: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_65']),
      c_66: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_66']),
      c_67: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_67']),
      c_68: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_68']),
      c_71: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_71']),
      c_72: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_72']),
      c_73: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_73']),
      c_74: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_74']),
      c_75: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_75']),
      c_76: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_76']),
      c_77: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_77']),
      c_78: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_78']),
      c_81: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_81']),
      c_82: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_82']),
      c_83: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_83']),
      c_84: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_84']),
      c_85: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_85']),
      c_86: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_86']),
      c_87: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_87']),
      c_88: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_88']),
      c_K3: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_K3']),
      c_K4: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_K4']),
      c_K5: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_K5']),
      c_K6: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_K6']),
      c_K7: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_K7']),
      c_K8: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_K8']),
      c_V37: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_V37']),
      c_V38: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_V38']),
      c_V47: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_V47']),
      c_V48: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_V48']),
      c_V57: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_V57']),
      c_V58: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_V58']),
      c_V67: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_V67']),
      c_V68: intType.mapFromDatabaseResponse(data['${effectivePrefix}c_V68']),
    );
  }
  factory T4Data.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return T4Data(
      index: serializer.fromJson<int>(json['index']),
      c_NyRad: serializer.fromJson<String>(json['c_NyRad']),
      c_Artsgruppe: serializer.fromJson<String>(json['c_Artsgruppe']),
      c_Art: serializer.fromJson<String>(json['c_Art']),
      c_Autor: serializer.fromJson<String>(json['c_Autor']),
      c_NorskNavn: serializer.fromJson<String>(json['c_NorskNavn']),
      c_X: serializer.fromJson<String>(json['c_X']),
      c_Artskode: serializer.fromJson<String>(json['c_Artskode']),
      c_11: serializer.fromJson<int>(json['c_11']),
      c_12: serializer.fromJson<int>(json['c_12']),
      c_13: serializer.fromJson<int>(json['c_13']),
      c_14: serializer.fromJson<int>(json['c_14']),
      c_15: serializer.fromJson<int>(json['c_15']),
      c_16: serializer.fromJson<int>(json['c_16']),
      c_17: serializer.fromJson<int>(json['c_17']),
      c_18: serializer.fromJson<int>(json['c_18']),
      c_21: serializer.fromJson<int>(json['c_21']),
      c_22: serializer.fromJson<int>(json['c_22']),
      c_23: serializer.fromJson<int>(json['c_23']),
      c_24: serializer.fromJson<int>(json['c_24']),
      c_25: serializer.fromJson<int>(json['c_25']),
      c_26: serializer.fromJson<int>(json['c_26']),
      c_27: serializer.fromJson<int>(json['c_27']),
      c_28: serializer.fromJson<int>(json['c_28']),
      c_31: serializer.fromJson<int>(json['c_31']),
      c_32: serializer.fromJson<int>(json['c_32']),
      c_33: serializer.fromJson<int>(json['c_33']),
      c_34: serializer.fromJson<int>(json['c_34']),
      c_35: serializer.fromJson<int>(json['c_35']),
      c_36: serializer.fromJson<int>(json['c_36']),
      c_37: serializer.fromJson<int>(json['c_37']),
      c_38: serializer.fromJson<int>(json['c_38']),
      c_41: serializer.fromJson<int>(json['c_41']),
      c_42: serializer.fromJson<int>(json['c_42']),
      c_43: serializer.fromJson<int>(json['c_43']),
      c_44: serializer.fromJson<int>(json['c_44']),
      c_45: serializer.fromJson<int>(json['c_45']),
      c_46: serializer.fromJson<int>(json['c_46']),
      c_47: serializer.fromJson<int>(json['c_47']),
      c_48: serializer.fromJson<int>(json['c_48']),
      c_51: serializer.fromJson<int>(json['c_51']),
      c_52: serializer.fromJson<int>(json['c_52']),
      c_53: serializer.fromJson<int>(json['c_53']),
      c_54: serializer.fromJson<int>(json['c_54']),
      c_55: serializer.fromJson<int>(json['c_55']),
      c_56: serializer.fromJson<int>(json['c_56']),
      c_57: serializer.fromJson<int>(json['c_57']),
      c_58: serializer.fromJson<int>(json['c_58']),
      c_61: serializer.fromJson<int>(json['c_61']),
      c_62: serializer.fromJson<int>(json['c_62']),
      c_63: serializer.fromJson<int>(json['c_63']),
      c_64: serializer.fromJson<int>(json['c_64']),
      c_65: serializer.fromJson<int>(json['c_65']),
      c_66: serializer.fromJson<int>(json['c_66']),
      c_67: serializer.fromJson<int>(json['c_67']),
      c_68: serializer.fromJson<int>(json['c_68']),
      c_71: serializer.fromJson<int>(json['c_71']),
      c_72: serializer.fromJson<int>(json['c_72']),
      c_73: serializer.fromJson<int>(json['c_73']),
      c_74: serializer.fromJson<int>(json['c_74']),
      c_75: serializer.fromJson<int>(json['c_75']),
      c_76: serializer.fromJson<int>(json['c_76']),
      c_77: serializer.fromJson<int>(json['c_77']),
      c_78: serializer.fromJson<int>(json['c_78']),
      c_81: serializer.fromJson<int>(json['c_81']),
      c_82: serializer.fromJson<int>(json['c_82']),
      c_83: serializer.fromJson<int>(json['c_83']),
      c_84: serializer.fromJson<int>(json['c_84']),
      c_85: serializer.fromJson<int>(json['c_85']),
      c_86: serializer.fromJson<int>(json['c_86']),
      c_87: serializer.fromJson<int>(json['c_87']),
      c_88: serializer.fromJson<int>(json['c_88']),
      c_K3: serializer.fromJson<int>(json['c_K3']),
      c_K4: serializer.fromJson<int>(json['c_K4']),
      c_K5: serializer.fromJson<int>(json['c_K5']),
      c_K6: serializer.fromJson<int>(json['c_K6']),
      c_K7: serializer.fromJson<int>(json['c_K7']),
      c_K8: serializer.fromJson<int>(json['c_K8']),
      c_V37: serializer.fromJson<int>(json['c_V37']),
      c_V38: serializer.fromJson<int>(json['c_V38']),
      c_V47: serializer.fromJson<int>(json['c_V47']),
      c_V48: serializer.fromJson<int>(json['c_V48']),
      c_V57: serializer.fromJson<int>(json['c_V57']),
      c_V58: serializer.fromJson<int>(json['c_V58']),
      c_V67: serializer.fromJson<int>(json['c_V67']),
      c_V68: serializer.fromJson<int>(json['c_V68']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return <String, dynamic>{
      'index': serializer.toJson<int>(index),
      'c_NyRad': serializer.toJson<String>(c_NyRad),
      'c_Artsgruppe': serializer.toJson<String>(c_Artsgruppe),
      'c_Art': serializer.toJson<String>(c_Art),
      'c_Autor': serializer.toJson<String>(c_Autor),
      'c_NorskNavn': serializer.toJson<String>(c_NorskNavn),
      'c_X': serializer.toJson<String>(c_X),
      'c_Artskode': serializer.toJson<String>(c_Artskode),
      'c_11': serializer.toJson<int>(c_11),
      'c_12': serializer.toJson<int>(c_12),
      'c_13': serializer.toJson<int>(c_13),
      'c_14': serializer.toJson<int>(c_14),
      'c_15': serializer.toJson<int>(c_15),
      'c_16': serializer.toJson<int>(c_16),
      'c_17': serializer.toJson<int>(c_17),
      'c_18': serializer.toJson<int>(c_18),
      'c_21': serializer.toJson<int>(c_21),
      'c_22': serializer.toJson<int>(c_22),
      'c_23': serializer.toJson<int>(c_23),
      'c_24': serializer.toJson<int>(c_24),
      'c_25': serializer.toJson<int>(c_25),
      'c_26': serializer.toJson<int>(c_26),
      'c_27': serializer.toJson<int>(c_27),
      'c_28': serializer.toJson<int>(c_28),
      'c_31': serializer.toJson<int>(c_31),
      'c_32': serializer.toJson<int>(c_32),
      'c_33': serializer.toJson<int>(c_33),
      'c_34': serializer.toJson<int>(c_34),
      'c_35': serializer.toJson<int>(c_35),
      'c_36': serializer.toJson<int>(c_36),
      'c_37': serializer.toJson<int>(c_37),
      'c_38': serializer.toJson<int>(c_38),
      'c_41': serializer.toJson<int>(c_41),
      'c_42': serializer.toJson<int>(c_42),
      'c_43': serializer.toJson<int>(c_43),
      'c_44': serializer.toJson<int>(c_44),
      'c_45': serializer.toJson<int>(c_45),
      'c_46': serializer.toJson<int>(c_46),
      'c_47': serializer.toJson<int>(c_47),
      'c_48': serializer.toJson<int>(c_48),
      'c_51': serializer.toJson<int>(c_51),
      'c_52': serializer.toJson<int>(c_52),
      'c_53': serializer.toJson<int>(c_53),
      'c_54': serializer.toJson<int>(c_54),
      'c_55': serializer.toJson<int>(c_55),
      'c_56': serializer.toJson<int>(c_56),
      'c_57': serializer.toJson<int>(c_57),
      'c_58': serializer.toJson<int>(c_58),
      'c_61': serializer.toJson<int>(c_61),
      'c_62': serializer.toJson<int>(c_62),
      'c_63': serializer.toJson<int>(c_63),
      'c_64': serializer.toJson<int>(c_64),
      'c_65': serializer.toJson<int>(c_65),
      'c_66': serializer.toJson<int>(c_66),
      'c_67': serializer.toJson<int>(c_67),
      'c_68': serializer.toJson<int>(c_68),
      'c_71': serializer.toJson<int>(c_71),
      'c_72': serializer.toJson<int>(c_72),
      'c_73': serializer.toJson<int>(c_73),
      'c_74': serializer.toJson<int>(c_74),
      'c_75': serializer.toJson<int>(c_75),
      'c_76': serializer.toJson<int>(c_76),
      'c_77': serializer.toJson<int>(c_77),
      'c_78': serializer.toJson<int>(c_78),
      'c_81': serializer.toJson<int>(c_81),
      'c_82': serializer.toJson<int>(c_82),
      'c_83': serializer.toJson<int>(c_83),
      'c_84': serializer.toJson<int>(c_84),
      'c_85': serializer.toJson<int>(c_85),
      'c_86': serializer.toJson<int>(c_86),
      'c_87': serializer.toJson<int>(c_87),
      'c_88': serializer.toJson<int>(c_88),
      'c_K3': serializer.toJson<int>(c_K3),
      'c_K4': serializer.toJson<int>(c_K4),
      'c_K5': serializer.toJson<int>(c_K5),
      'c_K6': serializer.toJson<int>(c_K6),
      'c_K7': serializer.toJson<int>(c_K7),
      'c_K8': serializer.toJson<int>(c_K8),
      'c_V37': serializer.toJson<int>(c_V37),
      'c_V38': serializer.toJson<int>(c_V38),
      'c_V47': serializer.toJson<int>(c_V47),
      'c_V48': serializer.toJson<int>(c_V48),
      'c_V57': serializer.toJson<int>(c_V57),
      'c_V58': serializer.toJson<int>(c_V58),
      'c_V67': serializer.toJson<int>(c_V67),
      'c_V68': serializer.toJson<int>(c_V68),
    };
  }

  @override
  T4Companion createCompanion(bool nullToAbsent) {
    return T4Companion(
      index:
          index == null && nullToAbsent ? const Value.absent() : Value(index),
      c_NyRad: c_NyRad == null && nullToAbsent
          ? const Value.absent()
          : Value(c_NyRad),
      c_Artsgruppe: c_Artsgruppe == null && nullToAbsent
          ? const Value.absent()
          : Value(c_Artsgruppe),
      c_Art:
          c_Art == null && nullToAbsent ? const Value.absent() : Value(c_Art),
      c_Autor: c_Autor == null && nullToAbsent
          ? const Value.absent()
          : Value(c_Autor),
      c_NorskNavn: c_NorskNavn == null && nullToAbsent
          ? const Value.absent()
          : Value(c_NorskNavn),
      c_X: c_X == null && nullToAbsent ? const Value.absent() : Value(c_X),
      c_Artskode: c_Artskode == null && nullToAbsent
          ? const Value.absent()
          : Value(c_Artskode),
      c_11: c_11 == null && nullToAbsent ? const Value.absent() : Value(c_11),
      c_12: c_12 == null && nullToAbsent ? const Value.absent() : Value(c_12),
      c_13: c_13 == null && nullToAbsent ? const Value.absent() : Value(c_13),
      c_14: c_14 == null && nullToAbsent ? const Value.absent() : Value(c_14),
      c_15: c_15 == null && nullToAbsent ? const Value.absent() : Value(c_15),
      c_16: c_16 == null && nullToAbsent ? const Value.absent() : Value(c_16),
      c_17: c_17 == null && nullToAbsent ? const Value.absent() : Value(c_17),
      c_18: c_18 == null && nullToAbsent ? const Value.absent() : Value(c_18),
      c_21: c_21 == null && nullToAbsent ? const Value.absent() : Value(c_21),
      c_22: c_22 == null && nullToAbsent ? const Value.absent() : Value(c_22),
      c_23: c_23 == null && nullToAbsent ? const Value.absent() : Value(c_23),
      c_24: c_24 == null && nullToAbsent ? const Value.absent() : Value(c_24),
      c_25: c_25 == null && nullToAbsent ? const Value.absent() : Value(c_25),
      c_26: c_26 == null && nullToAbsent ? const Value.absent() : Value(c_26),
      c_27: c_27 == null && nullToAbsent ? const Value.absent() : Value(c_27),
      c_28: c_28 == null && nullToAbsent ? const Value.absent() : Value(c_28),
      c_31: c_31 == null && nullToAbsent ? const Value.absent() : Value(c_31),
      c_32: c_32 == null && nullToAbsent ? const Value.absent() : Value(c_32),
      c_33: c_33 == null && nullToAbsent ? const Value.absent() : Value(c_33),
      c_34: c_34 == null && nullToAbsent ? const Value.absent() : Value(c_34),
      c_35: c_35 == null && nullToAbsent ? const Value.absent() : Value(c_35),
      c_36: c_36 == null && nullToAbsent ? const Value.absent() : Value(c_36),
      c_37: c_37 == null && nullToAbsent ? const Value.absent() : Value(c_37),
      c_38: c_38 == null && nullToAbsent ? const Value.absent() : Value(c_38),
      c_41: c_41 == null && nullToAbsent ? const Value.absent() : Value(c_41),
      c_42: c_42 == null && nullToAbsent ? const Value.absent() : Value(c_42),
      c_43: c_43 == null && nullToAbsent ? const Value.absent() : Value(c_43),
      c_44: c_44 == null && nullToAbsent ? const Value.absent() : Value(c_44),
      c_45: c_45 == null && nullToAbsent ? const Value.absent() : Value(c_45),
      c_46: c_46 == null && nullToAbsent ? const Value.absent() : Value(c_46),
      c_47: c_47 == null && nullToAbsent ? const Value.absent() : Value(c_47),
      c_48: c_48 == null && nullToAbsent ? const Value.absent() : Value(c_48),
      c_51: c_51 == null && nullToAbsent ? const Value.absent() : Value(c_51),
      c_52: c_52 == null && nullToAbsent ? const Value.absent() : Value(c_52),
      c_53: c_53 == null && nullToAbsent ? const Value.absent() : Value(c_53),
      c_54: c_54 == null && nullToAbsent ? const Value.absent() : Value(c_54),
      c_55: c_55 == null && nullToAbsent ? const Value.absent() : Value(c_55),
      c_56: c_56 == null && nullToAbsent ? const Value.absent() : Value(c_56),
      c_57: c_57 == null && nullToAbsent ? const Value.absent() : Value(c_57),
      c_58: c_58 == null && nullToAbsent ? const Value.absent() : Value(c_58),
      c_61: c_61 == null && nullToAbsent ? const Value.absent() : Value(c_61),
      c_62: c_62 == null && nullToAbsent ? const Value.absent() : Value(c_62),
      c_63: c_63 == null && nullToAbsent ? const Value.absent() : Value(c_63),
      c_64: c_64 == null && nullToAbsent ? const Value.absent() : Value(c_64),
      c_65: c_65 == null && nullToAbsent ? const Value.absent() : Value(c_65),
      c_66: c_66 == null && nullToAbsent ? const Value.absent() : Value(c_66),
      c_67: c_67 == null && nullToAbsent ? const Value.absent() : Value(c_67),
      c_68: c_68 == null && nullToAbsent ? const Value.absent() : Value(c_68),
      c_71: c_71 == null && nullToAbsent ? const Value.absent() : Value(c_71),
      c_72: c_72 == null && nullToAbsent ? const Value.absent() : Value(c_72),
      c_73: c_73 == null && nullToAbsent ? const Value.absent() : Value(c_73),
      c_74: c_74 == null && nullToAbsent ? const Value.absent() : Value(c_74),
      c_75: c_75 == null && nullToAbsent ? const Value.absent() : Value(c_75),
      c_76: c_76 == null && nullToAbsent ? const Value.absent() : Value(c_76),
      c_77: c_77 == null && nullToAbsent ? const Value.absent() : Value(c_77),
      c_78: c_78 == null && nullToAbsent ? const Value.absent() : Value(c_78),
      c_81: c_81 == null && nullToAbsent ? const Value.absent() : Value(c_81),
      c_82: c_82 == null && nullToAbsent ? const Value.absent() : Value(c_82),
      c_83: c_83 == null && nullToAbsent ? const Value.absent() : Value(c_83),
      c_84: c_84 == null && nullToAbsent ? const Value.absent() : Value(c_84),
      c_85: c_85 == null && nullToAbsent ? const Value.absent() : Value(c_85),
      c_86: c_86 == null && nullToAbsent ? const Value.absent() : Value(c_86),
      c_87: c_87 == null && nullToAbsent ? const Value.absent() : Value(c_87),
      c_88: c_88 == null && nullToAbsent ? const Value.absent() : Value(c_88),
      c_K3: c_K3 == null && nullToAbsent ? const Value.absent() : Value(c_K3),
      c_K4: c_K4 == null && nullToAbsent ? const Value.absent() : Value(c_K4),
      c_K5: c_K5 == null && nullToAbsent ? const Value.absent() : Value(c_K5),
      c_K6: c_K6 == null && nullToAbsent ? const Value.absent() : Value(c_K6),
      c_K7: c_K7 == null && nullToAbsent ? const Value.absent() : Value(c_K7),
      c_K8: c_K8 == null && nullToAbsent ? const Value.absent() : Value(c_K8),
      c_V37:
          c_V37 == null && nullToAbsent ? const Value.absent() : Value(c_V37),
      c_V38:
          c_V38 == null && nullToAbsent ? const Value.absent() : Value(c_V38),
      c_V47:
          c_V47 == null && nullToAbsent ? const Value.absent() : Value(c_V47),
      c_V48:
          c_V48 == null && nullToAbsent ? const Value.absent() : Value(c_V48),
      c_V57:
          c_V57 == null && nullToAbsent ? const Value.absent() : Value(c_V57),
      c_V58:
          c_V58 == null && nullToAbsent ? const Value.absent() : Value(c_V58),
      c_V67:
          c_V67 == null && nullToAbsent ? const Value.absent() : Value(c_V67),
      c_V68:
          c_V68 == null && nullToAbsent ? const Value.absent() : Value(c_V68),
    );
  }

  T4Data copyWith(
          {int index,
          String c_NyRad,
          String c_Artsgruppe,
          String c_Art,
          String c_Autor,
          String c_NorskNavn,
          String c_X,
          String c_Artskode,
          int c_11,
          int c_12,
          int c_13,
          int c_14,
          int c_15,
          int c_16,
          int c_17,
          int c_18,
          int c_21,
          int c_22,
          int c_23,
          int c_24,
          int c_25,
          int c_26,
          int c_27,
          int c_28,
          int c_31,
          int c_32,
          int c_33,
          int c_34,
          int c_35,
          int c_36,
          int c_37,
          int c_38,
          int c_41,
          int c_42,
          int c_43,
          int c_44,
          int c_45,
          int c_46,
          int c_47,
          int c_48,
          int c_51,
          int c_52,
          int c_53,
          int c_54,
          int c_55,
          int c_56,
          int c_57,
          int c_58,
          int c_61,
          int c_62,
          int c_63,
          int c_64,
          int c_65,
          int c_66,
          int c_67,
          int c_68,
          int c_71,
          int c_72,
          int c_73,
          int c_74,
          int c_75,
          int c_76,
          int c_77,
          int c_78,
          int c_81,
          int c_82,
          int c_83,
          int c_84,
          int c_85,
          int c_86,
          int c_87,
          int c_88,
          int c_K3,
          int c_K4,
          int c_K5,
          int c_K6,
          int c_K7,
          int c_K8,
          int c_V37,
          int c_V38,
          int c_V47,
          int c_V48,
          int c_V57,
          int c_V58,
          int c_V67,
          int c_V68}) =>
      T4Data(
        index: index ?? this.index,
        c_NyRad: c_NyRad ?? this.c_NyRad,
        c_Artsgruppe: c_Artsgruppe ?? this.c_Artsgruppe,
        c_Art: c_Art ?? this.c_Art,
        c_Autor: c_Autor ?? this.c_Autor,
        c_NorskNavn: c_NorskNavn ?? this.c_NorskNavn,
        c_X: c_X ?? this.c_X,
        c_Artskode: c_Artskode ?? this.c_Artskode,
        c_11: c_11 ?? this.c_11,
        c_12: c_12 ?? this.c_12,
        c_13: c_13 ?? this.c_13,
        c_14: c_14 ?? this.c_14,
        c_15: c_15 ?? this.c_15,
        c_16: c_16 ?? this.c_16,
        c_17: c_17 ?? this.c_17,
        c_18: c_18 ?? this.c_18,
        c_21: c_21 ?? this.c_21,
        c_22: c_22 ?? this.c_22,
        c_23: c_23 ?? this.c_23,
        c_24: c_24 ?? this.c_24,
        c_25: c_25 ?? this.c_25,
        c_26: c_26 ?? this.c_26,
        c_27: c_27 ?? this.c_27,
        c_28: c_28 ?? this.c_28,
        c_31: c_31 ?? this.c_31,
        c_32: c_32 ?? this.c_32,
        c_33: c_33 ?? this.c_33,
        c_34: c_34 ?? this.c_34,
        c_35: c_35 ?? this.c_35,
        c_36: c_36 ?? this.c_36,
        c_37: c_37 ?? this.c_37,
        c_38: c_38 ?? this.c_38,
        c_41: c_41 ?? this.c_41,
        c_42: c_42 ?? this.c_42,
        c_43: c_43 ?? this.c_43,
        c_44: c_44 ?? this.c_44,
        c_45: c_45 ?? this.c_45,
        c_46: c_46 ?? this.c_46,
        c_47: c_47 ?? this.c_47,
        c_48: c_48 ?? this.c_48,
        c_51: c_51 ?? this.c_51,
        c_52: c_52 ?? this.c_52,
        c_53: c_53 ?? this.c_53,
        c_54: c_54 ?? this.c_54,
        c_55: c_55 ?? this.c_55,
        c_56: c_56 ?? this.c_56,
        c_57: c_57 ?? this.c_57,
        c_58: c_58 ?? this.c_58,
        c_61: c_61 ?? this.c_61,
        c_62: c_62 ?? this.c_62,
        c_63: c_63 ?? this.c_63,
        c_64: c_64 ?? this.c_64,
        c_65: c_65 ?? this.c_65,
        c_66: c_66 ?? this.c_66,
        c_67: c_67 ?? this.c_67,
        c_68: c_68 ?? this.c_68,
        c_71: c_71 ?? this.c_71,
        c_72: c_72 ?? this.c_72,
        c_73: c_73 ?? this.c_73,
        c_74: c_74 ?? this.c_74,
        c_75: c_75 ?? this.c_75,
        c_76: c_76 ?? this.c_76,
        c_77: c_77 ?? this.c_77,
        c_78: c_78 ?? this.c_78,
        c_81: c_81 ?? this.c_81,
        c_82: c_82 ?? this.c_82,
        c_83: c_83 ?? this.c_83,
        c_84: c_84 ?? this.c_84,
        c_85: c_85 ?? this.c_85,
        c_86: c_86 ?? this.c_86,
        c_87: c_87 ?? this.c_87,
        c_88: c_88 ?? this.c_88,
        c_K3: c_K3 ?? this.c_K3,
        c_K4: c_K4 ?? this.c_K4,
        c_K5: c_K5 ?? this.c_K5,
        c_K6: c_K6 ?? this.c_K6,
        c_K7: c_K7 ?? this.c_K7,
        c_K8: c_K8 ?? this.c_K8,
        c_V37: c_V37 ?? this.c_V37,
        c_V38: c_V38 ?? this.c_V38,
        c_V47: c_V47 ?? this.c_V47,
        c_V48: c_V48 ?? this.c_V48,
        c_V57: c_V57 ?? this.c_V57,
        c_V58: c_V58 ?? this.c_V58,
        c_V67: c_V67 ?? this.c_V67,
        c_V68: c_V68 ?? this.c_V68,
      );
  @override
  String toString() {
    return (StringBuffer('T4Data(')
          ..write('index: $index, ')
          ..write('c_NyRad: $c_NyRad, ')
          ..write('c_Artsgruppe: $c_Artsgruppe, ')
          ..write('c_Art: $c_Art, ')
          ..write('c_Autor: $c_Autor, ')
          ..write('c_NorskNavn: $c_NorskNavn, ')
          ..write('c_X: $c_X, ')
          ..write('c_Artskode: $c_Artskode, ')
          ..write('c_11: $c_11, ')
          ..write('c_12: $c_12, ')
          ..write('c_13: $c_13, ')
          ..write('c_14: $c_14, ')
          ..write('c_15: $c_15, ')
          ..write('c_16: $c_16, ')
          ..write('c_17: $c_17, ')
          ..write('c_18: $c_18, ')
          ..write('c_21: $c_21, ')
          ..write('c_22: $c_22, ')
          ..write('c_23: $c_23, ')
          ..write('c_24: $c_24, ')
          ..write('c_25: $c_25, ')
          ..write('c_26: $c_26, ')
          ..write('c_27: $c_27, ')
          ..write('c_28: $c_28, ')
          ..write('c_31: $c_31, ')
          ..write('c_32: $c_32, ')
          ..write('c_33: $c_33, ')
          ..write('c_34: $c_34, ')
          ..write('c_35: $c_35, ')
          ..write('c_36: $c_36, ')
          ..write('c_37: $c_37, ')
          ..write('c_38: $c_38, ')
          ..write('c_41: $c_41, ')
          ..write('c_42: $c_42, ')
          ..write('c_43: $c_43, ')
          ..write('c_44: $c_44, ')
          ..write('c_45: $c_45, ')
          ..write('c_46: $c_46, ')
          ..write('c_47: $c_47, ')
          ..write('c_48: $c_48, ')
          ..write('c_51: $c_51, ')
          ..write('c_52: $c_52, ')
          ..write('c_53: $c_53, ')
          ..write('c_54: $c_54, ')
          ..write('c_55: $c_55, ')
          ..write('c_56: $c_56, ')
          ..write('c_57: $c_57, ')
          ..write('c_58: $c_58, ')
          ..write('c_61: $c_61, ')
          ..write('c_62: $c_62, ')
          ..write('c_63: $c_63, ')
          ..write('c_64: $c_64, ')
          ..write('c_65: $c_65, ')
          ..write('c_66: $c_66, ')
          ..write('c_67: $c_67, ')
          ..write('c_68: $c_68, ')
          ..write('c_71: $c_71, ')
          ..write('c_72: $c_72, ')
          ..write('c_73: $c_73, ')
          ..write('c_74: $c_74, ')
          ..write('c_75: $c_75, ')
          ..write('c_76: $c_76, ')
          ..write('c_77: $c_77, ')
          ..write('c_78: $c_78, ')
          ..write('c_81: $c_81, ')
          ..write('c_82: $c_82, ')
          ..write('c_83: $c_83, ')
          ..write('c_84: $c_84, ')
          ..write('c_85: $c_85, ')
          ..write('c_86: $c_86, ')
          ..write('c_87: $c_87, ')
          ..write('c_88: $c_88, ')
          ..write('c_K3: $c_K3, ')
          ..write('c_K4: $c_K4, ')
          ..write('c_K5: $c_K5, ')
          ..write('c_K6: $c_K6, ')
          ..write('c_K7: $c_K7, ')
          ..write('c_K8: $c_K8, ')
          ..write('c_V37: $c_V37, ')
          ..write('c_V38: $c_V38, ')
          ..write('c_V47: $c_V47, ')
          ..write('c_V48: $c_V48, ')
          ..write('c_V57: $c_V57, ')
          ..write('c_V58: $c_V58, ')
          ..write('c_V67: $c_V67, ')
          ..write('c_V68: $c_V68')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      index.hashCode,
      $mrjc(
          c_NyRad.hashCode,
          $mrjc(
              c_Artsgruppe.hashCode,
              $mrjc(
                  c_Art.hashCode,
                  $mrjc(
                      c_Autor.hashCode,
                      $mrjc(
                          c_NorskNavn.hashCode,
                          $mrjc(
                              c_X.hashCode,
                              $mrjc(
                                  c_Artskode.hashCode,
                                  $mrjc(
                                      c_11.hashCode,
                                      $mrjc(
                                          c_12.hashCode,
                                          $mrjc(
                                              c_13.hashCode,
                                              $mrjc(
                                                  c_14.hashCode,
                                                  $mrjc(
                                                      c_15.hashCode,
                                                      $mrjc(
                                                          c_16.hashCode,
                                                          $mrjc(
                                                              c_17.hashCode,
                                                              $mrjc(
                                                                  c_18.hashCode,
                                                                  $mrjc(
                                                                      c_21
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          c_22
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              c_23.hashCode,
                                                                              $mrjc(c_24.hashCode, $mrjc(c_25.hashCode, $mrjc(c_26.hashCode, $mrjc(c_27.hashCode, $mrjc(c_28.hashCode, $mrjc(c_31.hashCode, $mrjc(c_32.hashCode, $mrjc(c_33.hashCode, $mrjc(c_34.hashCode, $mrjc(c_35.hashCode, $mrjc(c_36.hashCode, $mrjc(c_37.hashCode, $mrjc(c_38.hashCode, $mrjc(c_41.hashCode, $mrjc(c_42.hashCode, $mrjc(c_43.hashCode, $mrjc(c_44.hashCode, $mrjc(c_45.hashCode, $mrjc(c_46.hashCode, $mrjc(c_47.hashCode, $mrjc(c_48.hashCode, $mrjc(c_51.hashCode, $mrjc(c_52.hashCode, $mrjc(c_53.hashCode, $mrjc(c_54.hashCode, $mrjc(c_55.hashCode, $mrjc(c_56.hashCode, $mrjc(c_57.hashCode, $mrjc(c_58.hashCode, $mrjc(c_61.hashCode, $mrjc(c_62.hashCode, $mrjc(c_63.hashCode, $mrjc(c_64.hashCode, $mrjc(c_65.hashCode, $mrjc(c_66.hashCode, $mrjc(c_67.hashCode, $mrjc(c_68.hashCode, $mrjc(c_71.hashCode, $mrjc(c_72.hashCode, $mrjc(c_73.hashCode, $mrjc(c_74.hashCode, $mrjc(c_75.hashCode, $mrjc(c_76.hashCode, $mrjc(c_77.hashCode, $mrjc(c_78.hashCode, $mrjc(c_81.hashCode, $mrjc(c_82.hashCode, $mrjc(c_83.hashCode, $mrjc(c_84.hashCode, $mrjc(c_85.hashCode, $mrjc(c_86.hashCode, $mrjc(c_87.hashCode, $mrjc(c_88.hashCode, $mrjc(c_K3.hashCode, $mrjc(c_K4.hashCode, $mrjc(c_K5.hashCode, $mrjc(c_K6.hashCode, $mrjc(c_K7.hashCode, $mrjc(c_K8.hashCode, $mrjc(c_V37.hashCode, $mrjc(c_V38.hashCode, $mrjc(c_V47.hashCode, $mrjc(c_V48.hashCode, $mrjc(c_V57.hashCode, $mrjc(c_V58.hashCode, $mrjc(c_V67.hashCode, c_V68.hashCode))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is T4Data &&
          other.index == this.index &&
          other.c_NyRad == this.c_NyRad &&
          other.c_Artsgruppe == this.c_Artsgruppe &&
          other.c_Art == this.c_Art &&
          other.c_Autor == this.c_Autor &&
          other.c_NorskNavn == this.c_NorskNavn &&
          other.c_X == this.c_X &&
          other.c_Artskode == this.c_Artskode &&
          other.c_11 == this.c_11 &&
          other.c_12 == this.c_12 &&
          other.c_13 == this.c_13 &&
          other.c_14 == this.c_14 &&
          other.c_15 == this.c_15 &&
          other.c_16 == this.c_16 &&
          other.c_17 == this.c_17 &&
          other.c_18 == this.c_18 &&
          other.c_21 == this.c_21 &&
          other.c_22 == this.c_22 &&
          other.c_23 == this.c_23 &&
          other.c_24 == this.c_24 &&
          other.c_25 == this.c_25 &&
          other.c_26 == this.c_26 &&
          other.c_27 == this.c_27 &&
          other.c_28 == this.c_28 &&
          other.c_31 == this.c_31 &&
          other.c_32 == this.c_32 &&
          other.c_33 == this.c_33 &&
          other.c_34 == this.c_34 &&
          other.c_35 == this.c_35 &&
          other.c_36 == this.c_36 &&
          other.c_37 == this.c_37 &&
          other.c_38 == this.c_38 &&
          other.c_41 == this.c_41 &&
          other.c_42 == this.c_42 &&
          other.c_43 == this.c_43 &&
          other.c_44 == this.c_44 &&
          other.c_45 == this.c_45 &&
          other.c_46 == this.c_46 &&
          other.c_47 == this.c_47 &&
          other.c_48 == this.c_48 &&
          other.c_51 == this.c_51 &&
          other.c_52 == this.c_52 &&
          other.c_53 == this.c_53 &&
          other.c_54 == this.c_54 &&
          other.c_55 == this.c_55 &&
          other.c_56 == this.c_56 &&
          other.c_57 == this.c_57 &&
          other.c_58 == this.c_58 &&
          other.c_61 == this.c_61 &&
          other.c_62 == this.c_62 &&
          other.c_63 == this.c_63 &&
          other.c_64 == this.c_64 &&
          other.c_65 == this.c_65 &&
          other.c_66 == this.c_66 &&
          other.c_67 == this.c_67 &&
          other.c_68 == this.c_68 &&
          other.c_71 == this.c_71 &&
          other.c_72 == this.c_72 &&
          other.c_73 == this.c_73 &&
          other.c_74 == this.c_74 &&
          other.c_75 == this.c_75 &&
          other.c_76 == this.c_76 &&
          other.c_77 == this.c_77 &&
          other.c_78 == this.c_78 &&
          other.c_81 == this.c_81 &&
          other.c_82 == this.c_82 &&
          other.c_83 == this.c_83 &&
          other.c_84 == this.c_84 &&
          other.c_85 == this.c_85 &&
          other.c_86 == this.c_86 &&
          other.c_87 == this.c_87 &&
          other.c_88 == this.c_88 &&
          other.c_K3 == this.c_K3 &&
          other.c_K4 == this.c_K4 &&
          other.c_K5 == this.c_K5 &&
          other.c_K6 == this.c_K6 &&
          other.c_K7 == this.c_K7 &&
          other.c_K8 == this.c_K8 &&
          other.c_V37 == this.c_V37 &&
          other.c_V38 == this.c_V38 &&
          other.c_V47 == this.c_V47 &&
          other.c_V48 == this.c_V48 &&
          other.c_V57 == this.c_V57 &&
          other.c_V58 == this.c_V58 &&
          other.c_V67 == this.c_V67 &&
          other.c_V68 == this.c_V68);
}

class T4Companion extends UpdateCompanion<T4Data> {
  final Value<int> index;
  final Value<String> c_NyRad;
  final Value<String> c_Artsgruppe;
  final Value<String> c_Art;
  final Value<String> c_Autor;
  final Value<String> c_NorskNavn;
  final Value<String> c_X;
  final Value<String> c_Artskode;
  final Value<int> c_11;
  final Value<int> c_12;
  final Value<int> c_13;
  final Value<int> c_14;
  final Value<int> c_15;
  final Value<int> c_16;
  final Value<int> c_17;
  final Value<int> c_18;
  final Value<int> c_21;
  final Value<int> c_22;
  final Value<int> c_23;
  final Value<int> c_24;
  final Value<int> c_25;
  final Value<int> c_26;
  final Value<int> c_27;
  final Value<int> c_28;
  final Value<int> c_31;
  final Value<int> c_32;
  final Value<int> c_33;
  final Value<int> c_34;
  final Value<int> c_35;
  final Value<int> c_36;
  final Value<int> c_37;
  final Value<int> c_38;
  final Value<int> c_41;
  final Value<int> c_42;
  final Value<int> c_43;
  final Value<int> c_44;
  final Value<int> c_45;
  final Value<int> c_46;
  final Value<int> c_47;
  final Value<int> c_48;
  final Value<int> c_51;
  final Value<int> c_52;
  final Value<int> c_53;
  final Value<int> c_54;
  final Value<int> c_55;
  final Value<int> c_56;
  final Value<int> c_57;
  final Value<int> c_58;
  final Value<int> c_61;
  final Value<int> c_62;
  final Value<int> c_63;
  final Value<int> c_64;
  final Value<int> c_65;
  final Value<int> c_66;
  final Value<int> c_67;
  final Value<int> c_68;
  final Value<int> c_71;
  final Value<int> c_72;
  final Value<int> c_73;
  final Value<int> c_74;
  final Value<int> c_75;
  final Value<int> c_76;
  final Value<int> c_77;
  final Value<int> c_78;
  final Value<int> c_81;
  final Value<int> c_82;
  final Value<int> c_83;
  final Value<int> c_84;
  final Value<int> c_85;
  final Value<int> c_86;
  final Value<int> c_87;
  final Value<int> c_88;
  final Value<int> c_K3;
  final Value<int> c_K4;
  final Value<int> c_K5;
  final Value<int> c_K6;
  final Value<int> c_K7;
  final Value<int> c_K8;
  final Value<int> c_V37;
  final Value<int> c_V38;
  final Value<int> c_V47;
  final Value<int> c_V48;
  final Value<int> c_V57;
  final Value<int> c_V58;
  final Value<int> c_V67;
  final Value<int> c_V68;
  const T4Companion({
    this.index = const Value.absent(),
    this.c_NyRad = const Value.absent(),
    this.c_Artsgruppe = const Value.absent(),
    this.c_Art = const Value.absent(),
    this.c_Autor = const Value.absent(),
    this.c_NorskNavn = const Value.absent(),
    this.c_X = const Value.absent(),
    this.c_Artskode = const Value.absent(),
    this.c_11 = const Value.absent(),
    this.c_12 = const Value.absent(),
    this.c_13 = const Value.absent(),
    this.c_14 = const Value.absent(),
    this.c_15 = const Value.absent(),
    this.c_16 = const Value.absent(),
    this.c_17 = const Value.absent(),
    this.c_18 = const Value.absent(),
    this.c_21 = const Value.absent(),
    this.c_22 = const Value.absent(),
    this.c_23 = const Value.absent(),
    this.c_24 = const Value.absent(),
    this.c_25 = const Value.absent(),
    this.c_26 = const Value.absent(),
    this.c_27 = const Value.absent(),
    this.c_28 = const Value.absent(),
    this.c_31 = const Value.absent(),
    this.c_32 = const Value.absent(),
    this.c_33 = const Value.absent(),
    this.c_34 = const Value.absent(),
    this.c_35 = const Value.absent(),
    this.c_36 = const Value.absent(),
    this.c_37 = const Value.absent(),
    this.c_38 = const Value.absent(),
    this.c_41 = const Value.absent(),
    this.c_42 = const Value.absent(),
    this.c_43 = const Value.absent(),
    this.c_44 = const Value.absent(),
    this.c_45 = const Value.absent(),
    this.c_46 = const Value.absent(),
    this.c_47 = const Value.absent(),
    this.c_48 = const Value.absent(),
    this.c_51 = const Value.absent(),
    this.c_52 = const Value.absent(),
    this.c_53 = const Value.absent(),
    this.c_54 = const Value.absent(),
    this.c_55 = const Value.absent(),
    this.c_56 = const Value.absent(),
    this.c_57 = const Value.absent(),
    this.c_58 = const Value.absent(),
    this.c_61 = const Value.absent(),
    this.c_62 = const Value.absent(),
    this.c_63 = const Value.absent(),
    this.c_64 = const Value.absent(),
    this.c_65 = const Value.absent(),
    this.c_66 = const Value.absent(),
    this.c_67 = const Value.absent(),
    this.c_68 = const Value.absent(),
    this.c_71 = const Value.absent(),
    this.c_72 = const Value.absent(),
    this.c_73 = const Value.absent(),
    this.c_74 = const Value.absent(),
    this.c_75 = const Value.absent(),
    this.c_76 = const Value.absent(),
    this.c_77 = const Value.absent(),
    this.c_78 = const Value.absent(),
    this.c_81 = const Value.absent(),
    this.c_82 = const Value.absent(),
    this.c_83 = const Value.absent(),
    this.c_84 = const Value.absent(),
    this.c_85 = const Value.absent(),
    this.c_86 = const Value.absent(),
    this.c_87 = const Value.absent(),
    this.c_88 = const Value.absent(),
    this.c_K3 = const Value.absent(),
    this.c_K4 = const Value.absent(),
    this.c_K5 = const Value.absent(),
    this.c_K6 = const Value.absent(),
    this.c_K7 = const Value.absent(),
    this.c_K8 = const Value.absent(),
    this.c_V37 = const Value.absent(),
    this.c_V38 = const Value.absent(),
    this.c_V47 = const Value.absent(),
    this.c_V48 = const Value.absent(),
    this.c_V57 = const Value.absent(),
    this.c_V58 = const Value.absent(),
    this.c_V67 = const Value.absent(),
    this.c_V68 = const Value.absent(),
  });
  T4Companion.insert({
    this.index = const Value.absent(),
    @required String c_NyRad,
    @required String c_Artsgruppe,
    @required String c_Art,
    @required String c_Autor,
    @required String c_NorskNavn,
    @required String c_X,
    @required String c_Artskode,
    this.c_11 = const Value.absent(),
    this.c_12 = const Value.absent(),
    this.c_13 = const Value.absent(),
    this.c_14 = const Value.absent(),
    this.c_15 = const Value.absent(),
    this.c_16 = const Value.absent(),
    this.c_17 = const Value.absent(),
    this.c_18 = const Value.absent(),
    this.c_21 = const Value.absent(),
    this.c_22 = const Value.absent(),
    this.c_23 = const Value.absent(),
    this.c_24 = const Value.absent(),
    this.c_25 = const Value.absent(),
    this.c_26 = const Value.absent(),
    this.c_27 = const Value.absent(),
    this.c_28 = const Value.absent(),
    this.c_31 = const Value.absent(),
    this.c_32 = const Value.absent(),
    this.c_33 = const Value.absent(),
    this.c_34 = const Value.absent(),
    this.c_35 = const Value.absent(),
    this.c_36 = const Value.absent(),
    this.c_37 = const Value.absent(),
    this.c_38 = const Value.absent(),
    this.c_41 = const Value.absent(),
    this.c_42 = const Value.absent(),
    this.c_43 = const Value.absent(),
    this.c_44 = const Value.absent(),
    this.c_45 = const Value.absent(),
    this.c_46 = const Value.absent(),
    this.c_47 = const Value.absent(),
    this.c_48 = const Value.absent(),
    this.c_51 = const Value.absent(),
    this.c_52 = const Value.absent(),
    this.c_53 = const Value.absent(),
    this.c_54 = const Value.absent(),
    this.c_55 = const Value.absent(),
    this.c_56 = const Value.absent(),
    this.c_57 = const Value.absent(),
    this.c_58 = const Value.absent(),
    this.c_61 = const Value.absent(),
    this.c_62 = const Value.absent(),
    this.c_63 = const Value.absent(),
    this.c_64 = const Value.absent(),
    this.c_65 = const Value.absent(),
    this.c_66 = const Value.absent(),
    this.c_67 = const Value.absent(),
    this.c_68 = const Value.absent(),
    this.c_71 = const Value.absent(),
    this.c_72 = const Value.absent(),
    this.c_73 = const Value.absent(),
    this.c_74 = const Value.absent(),
    this.c_75 = const Value.absent(),
    this.c_76 = const Value.absent(),
    this.c_77 = const Value.absent(),
    this.c_78 = const Value.absent(),
    this.c_81 = const Value.absent(),
    this.c_82 = const Value.absent(),
    this.c_83 = const Value.absent(),
    this.c_84 = const Value.absent(),
    this.c_85 = const Value.absent(),
    this.c_86 = const Value.absent(),
    this.c_87 = const Value.absent(),
    this.c_88 = const Value.absent(),
    this.c_K3 = const Value.absent(),
    this.c_K4 = const Value.absent(),
    this.c_K5 = const Value.absent(),
    this.c_K6 = const Value.absent(),
    this.c_K7 = const Value.absent(),
    this.c_K8 = const Value.absent(),
    this.c_V37 = const Value.absent(),
    this.c_V38 = const Value.absent(),
    this.c_V47 = const Value.absent(),
    this.c_V48 = const Value.absent(),
    this.c_V57 = const Value.absent(),
    this.c_V58 = const Value.absent(),
    this.c_V67 = const Value.absent(),
    this.c_V68 = const Value.absent(),
  })  : c_NyRad = Value(c_NyRad),
        c_Artsgruppe = Value(c_Artsgruppe),
        c_Art = Value(c_Art),
        c_Autor = Value(c_Autor),
        c_NorskNavn = Value(c_NorskNavn),
        c_X = Value(c_X),
        c_Artskode = Value(c_Artskode);
  T4Companion copyWith(
      {Value<int> index,
      Value<String> c_NyRad,
      Value<String> c_Artsgruppe,
      Value<String> c_Art,
      Value<String> c_Autor,
      Value<String> c_NorskNavn,
      Value<String> c_X,
      Value<String> c_Artskode,
      Value<int> c_11,
      Value<int> c_12,
      Value<int> c_13,
      Value<int> c_14,
      Value<int> c_15,
      Value<int> c_16,
      Value<int> c_17,
      Value<int> c_18,
      Value<int> c_21,
      Value<int> c_22,
      Value<int> c_23,
      Value<int> c_24,
      Value<int> c_25,
      Value<int> c_26,
      Value<int> c_27,
      Value<int> c_28,
      Value<int> c_31,
      Value<int> c_32,
      Value<int> c_33,
      Value<int> c_34,
      Value<int> c_35,
      Value<int> c_36,
      Value<int> c_37,
      Value<int> c_38,
      Value<int> c_41,
      Value<int> c_42,
      Value<int> c_43,
      Value<int> c_44,
      Value<int> c_45,
      Value<int> c_46,
      Value<int> c_47,
      Value<int> c_48,
      Value<int> c_51,
      Value<int> c_52,
      Value<int> c_53,
      Value<int> c_54,
      Value<int> c_55,
      Value<int> c_56,
      Value<int> c_57,
      Value<int> c_58,
      Value<int> c_61,
      Value<int> c_62,
      Value<int> c_63,
      Value<int> c_64,
      Value<int> c_65,
      Value<int> c_66,
      Value<int> c_67,
      Value<int> c_68,
      Value<int> c_71,
      Value<int> c_72,
      Value<int> c_73,
      Value<int> c_74,
      Value<int> c_75,
      Value<int> c_76,
      Value<int> c_77,
      Value<int> c_78,
      Value<int> c_81,
      Value<int> c_82,
      Value<int> c_83,
      Value<int> c_84,
      Value<int> c_85,
      Value<int> c_86,
      Value<int> c_87,
      Value<int> c_88,
      Value<int> c_K3,
      Value<int> c_K4,
      Value<int> c_K5,
      Value<int> c_K6,
      Value<int> c_K7,
      Value<int> c_K8,
      Value<int> c_V37,
      Value<int> c_V38,
      Value<int> c_V47,
      Value<int> c_V48,
      Value<int> c_V57,
      Value<int> c_V58,
      Value<int> c_V67,
      Value<int> c_V68}) {
    return T4Companion(
      index: index ?? this.index,
      c_NyRad: c_NyRad ?? this.c_NyRad,
      c_Artsgruppe: c_Artsgruppe ?? this.c_Artsgruppe,
      c_Art: c_Art ?? this.c_Art,
      c_Autor: c_Autor ?? this.c_Autor,
      c_NorskNavn: c_NorskNavn ?? this.c_NorskNavn,
      c_X: c_X ?? this.c_X,
      c_Artskode: c_Artskode ?? this.c_Artskode,
      c_11: c_11 ?? this.c_11,
      c_12: c_12 ?? this.c_12,
      c_13: c_13 ?? this.c_13,
      c_14: c_14 ?? this.c_14,
      c_15: c_15 ?? this.c_15,
      c_16: c_16 ?? this.c_16,
      c_17: c_17 ?? this.c_17,
      c_18: c_18 ?? this.c_18,
      c_21: c_21 ?? this.c_21,
      c_22: c_22 ?? this.c_22,
      c_23: c_23 ?? this.c_23,
      c_24: c_24 ?? this.c_24,
      c_25: c_25 ?? this.c_25,
      c_26: c_26 ?? this.c_26,
      c_27: c_27 ?? this.c_27,
      c_28: c_28 ?? this.c_28,
      c_31: c_31 ?? this.c_31,
      c_32: c_32 ?? this.c_32,
      c_33: c_33 ?? this.c_33,
      c_34: c_34 ?? this.c_34,
      c_35: c_35 ?? this.c_35,
      c_36: c_36 ?? this.c_36,
      c_37: c_37 ?? this.c_37,
      c_38: c_38 ?? this.c_38,
      c_41: c_41 ?? this.c_41,
      c_42: c_42 ?? this.c_42,
      c_43: c_43 ?? this.c_43,
      c_44: c_44 ?? this.c_44,
      c_45: c_45 ?? this.c_45,
      c_46: c_46 ?? this.c_46,
      c_47: c_47 ?? this.c_47,
      c_48: c_48 ?? this.c_48,
      c_51: c_51 ?? this.c_51,
      c_52: c_52 ?? this.c_52,
      c_53: c_53 ?? this.c_53,
      c_54: c_54 ?? this.c_54,
      c_55: c_55 ?? this.c_55,
      c_56: c_56 ?? this.c_56,
      c_57: c_57 ?? this.c_57,
      c_58: c_58 ?? this.c_58,
      c_61: c_61 ?? this.c_61,
      c_62: c_62 ?? this.c_62,
      c_63: c_63 ?? this.c_63,
      c_64: c_64 ?? this.c_64,
      c_65: c_65 ?? this.c_65,
      c_66: c_66 ?? this.c_66,
      c_67: c_67 ?? this.c_67,
      c_68: c_68 ?? this.c_68,
      c_71: c_71 ?? this.c_71,
      c_72: c_72 ?? this.c_72,
      c_73: c_73 ?? this.c_73,
      c_74: c_74 ?? this.c_74,
      c_75: c_75 ?? this.c_75,
      c_76: c_76 ?? this.c_76,
      c_77: c_77 ?? this.c_77,
      c_78: c_78 ?? this.c_78,
      c_81: c_81 ?? this.c_81,
      c_82: c_82 ?? this.c_82,
      c_83: c_83 ?? this.c_83,
      c_84: c_84 ?? this.c_84,
      c_85: c_85 ?? this.c_85,
      c_86: c_86 ?? this.c_86,
      c_87: c_87 ?? this.c_87,
      c_88: c_88 ?? this.c_88,
      c_K3: c_K3 ?? this.c_K3,
      c_K4: c_K4 ?? this.c_K4,
      c_K5: c_K5 ?? this.c_K5,
      c_K6: c_K6 ?? this.c_K6,
      c_K7: c_K7 ?? this.c_K7,
      c_K8: c_K8 ?? this.c_K8,
      c_V37: c_V37 ?? this.c_V37,
      c_V38: c_V38 ?? this.c_V38,
      c_V47: c_V47 ?? this.c_V47,
      c_V48: c_V48 ?? this.c_V48,
      c_V57: c_V57 ?? this.c_V57,
      c_V58: c_V58 ?? this.c_V58,
      c_V67: c_V67 ?? this.c_V67,
      c_V68: c_V68 ?? this.c_V68,
    );
  }
}

class $T4Table extends T4 with TableInfo<$T4Table, T4Data> {
  final GeneratedDatabase _db;
  final String _alias;
  $T4Table(this._db, [this._alias]);
  final VerificationMeta _indexMeta = const VerificationMeta('index');
  GeneratedIntColumn _index;
  @override
  GeneratedIntColumn get index => _index ??= _constructIndex();
  GeneratedIntColumn _constructIndex() {
    return GeneratedIntColumn('index', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _c_NyRadMeta = const VerificationMeta('c_NyRad');
  GeneratedTextColumn _c_NyRad;
  @override
  GeneratedTextColumn get c_NyRad => _c_NyRad ??= _constructCNyRad();
  GeneratedTextColumn _constructCNyRad() {
    return GeneratedTextColumn('c_NyRad', $tableName, false,
        minTextLength: 1, maxTextLength: 256);
  }

  final VerificationMeta _c_ArtsgruppeMeta =
      const VerificationMeta('c_Artsgruppe');
  GeneratedTextColumn _c_Artsgruppe;
  @override
  GeneratedTextColumn get c_Artsgruppe =>
      _c_Artsgruppe ??= _constructCArtsgruppe();
  GeneratedTextColumn _constructCArtsgruppe() {
    return GeneratedTextColumn('c_Artsgruppe', $tableName, false,
        minTextLength: 1, maxTextLength: 256);
  }

  final VerificationMeta _c_ArtMeta = const VerificationMeta('c_Art');
  GeneratedTextColumn _c_Art;
  @override
  GeneratedTextColumn get c_Art => _c_Art ??= _constructCArt();
  GeneratedTextColumn _constructCArt() {
    return GeneratedTextColumn('c_Art', $tableName, false,
        minTextLength: 1, maxTextLength: 256);
  }

  final VerificationMeta _c_AutorMeta = const VerificationMeta('c_Autor');
  GeneratedTextColumn _c_Autor;
  @override
  GeneratedTextColumn get c_Autor => _c_Autor ??= _constructCAutor();
  GeneratedTextColumn _constructCAutor() {
    return GeneratedTextColumn('c_Autor', $tableName, false,
        minTextLength: 1, maxTextLength: 256);
  }

  final VerificationMeta _c_NorskNavnMeta =
      const VerificationMeta('c_NorskNavn');
  GeneratedTextColumn _c_NorskNavn;
  @override
  GeneratedTextColumn get c_NorskNavn =>
      _c_NorskNavn ??= _constructCNorskNavn();
  GeneratedTextColumn _constructCNorskNavn() {
    return GeneratedTextColumn('c_NorskNavn', $tableName, false,
        minTextLength: 1, maxTextLength: 256);
  }

  final VerificationMeta _c_XMeta = const VerificationMeta('c_X');
  GeneratedTextColumn _c_X;
  @override
  GeneratedTextColumn get c_X => _c_X ??= _constructCX();
  GeneratedTextColumn _constructCX() {
    return GeneratedTextColumn('c_X', $tableName, false,
        minTextLength: 1, maxTextLength: 256);
  }

  final VerificationMeta _c_ArtskodeMeta = const VerificationMeta('c_Artskode');
  GeneratedTextColumn _c_Artskode;
  @override
  GeneratedTextColumn get c_Artskode => _c_Artskode ??= _constructCArtskode();
  GeneratedTextColumn _constructCArtskode() {
    return GeneratedTextColumn('c_Artskode', $tableName, false,
        minTextLength: 1, maxTextLength: 256);
  }

  final VerificationMeta _c_11Meta = const VerificationMeta('c_11');
  GeneratedIntColumn _c_11;
  @override
  GeneratedIntColumn get c_11 => _c_11 ??= _constructC11();
  GeneratedIntColumn _constructC11() {
    return GeneratedIntColumn(
      'c_11',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_12Meta = const VerificationMeta('c_12');
  GeneratedIntColumn _c_12;
  @override
  GeneratedIntColumn get c_12 => _c_12 ??= _constructC12();
  GeneratedIntColumn _constructC12() {
    return GeneratedIntColumn(
      'c_12',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_13Meta = const VerificationMeta('c_13');
  GeneratedIntColumn _c_13;
  @override
  GeneratedIntColumn get c_13 => _c_13 ??= _constructC13();
  GeneratedIntColumn _constructC13() {
    return GeneratedIntColumn(
      'c_13',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_14Meta = const VerificationMeta('c_14');
  GeneratedIntColumn _c_14;
  @override
  GeneratedIntColumn get c_14 => _c_14 ??= _constructC14();
  GeneratedIntColumn _constructC14() {
    return GeneratedIntColumn(
      'c_14',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_15Meta = const VerificationMeta('c_15');
  GeneratedIntColumn _c_15;
  @override
  GeneratedIntColumn get c_15 => _c_15 ??= _constructC15();
  GeneratedIntColumn _constructC15() {
    return GeneratedIntColumn(
      'c_15',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_16Meta = const VerificationMeta('c_16');
  GeneratedIntColumn _c_16;
  @override
  GeneratedIntColumn get c_16 => _c_16 ??= _constructC16();
  GeneratedIntColumn _constructC16() {
    return GeneratedIntColumn(
      'c_16',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_17Meta = const VerificationMeta('c_17');
  GeneratedIntColumn _c_17;
  @override
  GeneratedIntColumn get c_17 => _c_17 ??= _constructC17();
  GeneratedIntColumn _constructC17() {
    return GeneratedIntColumn(
      'c_17',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_18Meta = const VerificationMeta('c_18');
  GeneratedIntColumn _c_18;
  @override
  GeneratedIntColumn get c_18 => _c_18 ??= _constructC18();
  GeneratedIntColumn _constructC18() {
    return GeneratedIntColumn(
      'c_18',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_21Meta = const VerificationMeta('c_21');
  GeneratedIntColumn _c_21;
  @override
  GeneratedIntColumn get c_21 => _c_21 ??= _constructC21();
  GeneratedIntColumn _constructC21() {
    return GeneratedIntColumn(
      'c_21',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_22Meta = const VerificationMeta('c_22');
  GeneratedIntColumn _c_22;
  @override
  GeneratedIntColumn get c_22 => _c_22 ??= _constructC22();
  GeneratedIntColumn _constructC22() {
    return GeneratedIntColumn(
      'c_22',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_23Meta = const VerificationMeta('c_23');
  GeneratedIntColumn _c_23;
  @override
  GeneratedIntColumn get c_23 => _c_23 ??= _constructC23();
  GeneratedIntColumn _constructC23() {
    return GeneratedIntColumn(
      'c_23',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_24Meta = const VerificationMeta('c_24');
  GeneratedIntColumn _c_24;
  @override
  GeneratedIntColumn get c_24 => _c_24 ??= _constructC24();
  GeneratedIntColumn _constructC24() {
    return GeneratedIntColumn(
      'c_24',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_25Meta = const VerificationMeta('c_25');
  GeneratedIntColumn _c_25;
  @override
  GeneratedIntColumn get c_25 => _c_25 ??= _constructC25();
  GeneratedIntColumn _constructC25() {
    return GeneratedIntColumn(
      'c_25',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_26Meta = const VerificationMeta('c_26');
  GeneratedIntColumn _c_26;
  @override
  GeneratedIntColumn get c_26 => _c_26 ??= _constructC26();
  GeneratedIntColumn _constructC26() {
    return GeneratedIntColumn(
      'c_26',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_27Meta = const VerificationMeta('c_27');
  GeneratedIntColumn _c_27;
  @override
  GeneratedIntColumn get c_27 => _c_27 ??= _constructC27();
  GeneratedIntColumn _constructC27() {
    return GeneratedIntColumn(
      'c_27',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_28Meta = const VerificationMeta('c_28');
  GeneratedIntColumn _c_28;
  @override
  GeneratedIntColumn get c_28 => _c_28 ??= _constructC28();
  GeneratedIntColumn _constructC28() {
    return GeneratedIntColumn(
      'c_28',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_31Meta = const VerificationMeta('c_31');
  GeneratedIntColumn _c_31;
  @override
  GeneratedIntColumn get c_31 => _c_31 ??= _constructC31();
  GeneratedIntColumn _constructC31() {
    return GeneratedIntColumn(
      'c_31',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_32Meta = const VerificationMeta('c_32');
  GeneratedIntColumn _c_32;
  @override
  GeneratedIntColumn get c_32 => _c_32 ??= _constructC32();
  GeneratedIntColumn _constructC32() {
    return GeneratedIntColumn(
      'c_32',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_33Meta = const VerificationMeta('c_33');
  GeneratedIntColumn _c_33;
  @override
  GeneratedIntColumn get c_33 => _c_33 ??= _constructC33();
  GeneratedIntColumn _constructC33() {
    return GeneratedIntColumn(
      'c_33',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_34Meta = const VerificationMeta('c_34');
  GeneratedIntColumn _c_34;
  @override
  GeneratedIntColumn get c_34 => _c_34 ??= _constructC34();
  GeneratedIntColumn _constructC34() {
    return GeneratedIntColumn(
      'c_34',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_35Meta = const VerificationMeta('c_35');
  GeneratedIntColumn _c_35;
  @override
  GeneratedIntColumn get c_35 => _c_35 ??= _constructC35();
  GeneratedIntColumn _constructC35() {
    return GeneratedIntColumn(
      'c_35',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_36Meta = const VerificationMeta('c_36');
  GeneratedIntColumn _c_36;
  @override
  GeneratedIntColumn get c_36 => _c_36 ??= _constructC36();
  GeneratedIntColumn _constructC36() {
    return GeneratedIntColumn(
      'c_36',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_37Meta = const VerificationMeta('c_37');
  GeneratedIntColumn _c_37;
  @override
  GeneratedIntColumn get c_37 => _c_37 ??= _constructC37();
  GeneratedIntColumn _constructC37() {
    return GeneratedIntColumn(
      'c_37',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_38Meta = const VerificationMeta('c_38');
  GeneratedIntColumn _c_38;
  @override
  GeneratedIntColumn get c_38 => _c_38 ??= _constructC38();
  GeneratedIntColumn _constructC38() {
    return GeneratedIntColumn(
      'c_38',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_41Meta = const VerificationMeta('c_41');
  GeneratedIntColumn _c_41;
  @override
  GeneratedIntColumn get c_41 => _c_41 ??= _constructC41();
  GeneratedIntColumn _constructC41() {
    return GeneratedIntColumn(
      'c_41',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_42Meta = const VerificationMeta('c_42');
  GeneratedIntColumn _c_42;
  @override
  GeneratedIntColumn get c_42 => _c_42 ??= _constructC42();
  GeneratedIntColumn _constructC42() {
    return GeneratedIntColumn(
      'c_42',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_43Meta = const VerificationMeta('c_43');
  GeneratedIntColumn _c_43;
  @override
  GeneratedIntColumn get c_43 => _c_43 ??= _constructC43();
  GeneratedIntColumn _constructC43() {
    return GeneratedIntColumn(
      'c_43',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_44Meta = const VerificationMeta('c_44');
  GeneratedIntColumn _c_44;
  @override
  GeneratedIntColumn get c_44 => _c_44 ??= _constructC44();
  GeneratedIntColumn _constructC44() {
    return GeneratedIntColumn(
      'c_44',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_45Meta = const VerificationMeta('c_45');
  GeneratedIntColumn _c_45;
  @override
  GeneratedIntColumn get c_45 => _c_45 ??= _constructC45();
  GeneratedIntColumn _constructC45() {
    return GeneratedIntColumn(
      'c_45',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_46Meta = const VerificationMeta('c_46');
  GeneratedIntColumn _c_46;
  @override
  GeneratedIntColumn get c_46 => _c_46 ??= _constructC46();
  GeneratedIntColumn _constructC46() {
    return GeneratedIntColumn(
      'c_46',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_47Meta = const VerificationMeta('c_47');
  GeneratedIntColumn _c_47;
  @override
  GeneratedIntColumn get c_47 => _c_47 ??= _constructC47();
  GeneratedIntColumn _constructC47() {
    return GeneratedIntColumn(
      'c_47',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_48Meta = const VerificationMeta('c_48');
  GeneratedIntColumn _c_48;
  @override
  GeneratedIntColumn get c_48 => _c_48 ??= _constructC48();
  GeneratedIntColumn _constructC48() {
    return GeneratedIntColumn(
      'c_48',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_51Meta = const VerificationMeta('c_51');
  GeneratedIntColumn _c_51;
  @override
  GeneratedIntColumn get c_51 => _c_51 ??= _constructC51();
  GeneratedIntColumn _constructC51() {
    return GeneratedIntColumn(
      'c_51',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_52Meta = const VerificationMeta('c_52');
  GeneratedIntColumn _c_52;
  @override
  GeneratedIntColumn get c_52 => _c_52 ??= _constructC52();
  GeneratedIntColumn _constructC52() {
    return GeneratedIntColumn(
      'c_52',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_53Meta = const VerificationMeta('c_53');
  GeneratedIntColumn _c_53;
  @override
  GeneratedIntColumn get c_53 => _c_53 ??= _constructC53();
  GeneratedIntColumn _constructC53() {
    return GeneratedIntColumn(
      'c_53',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_54Meta = const VerificationMeta('c_54');
  GeneratedIntColumn _c_54;
  @override
  GeneratedIntColumn get c_54 => _c_54 ??= _constructC54();
  GeneratedIntColumn _constructC54() {
    return GeneratedIntColumn(
      'c_54',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_55Meta = const VerificationMeta('c_55');
  GeneratedIntColumn _c_55;
  @override
  GeneratedIntColumn get c_55 => _c_55 ??= _constructC55();
  GeneratedIntColumn _constructC55() {
    return GeneratedIntColumn(
      'c_55',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_56Meta = const VerificationMeta('c_56');
  GeneratedIntColumn _c_56;
  @override
  GeneratedIntColumn get c_56 => _c_56 ??= _constructC56();
  GeneratedIntColumn _constructC56() {
    return GeneratedIntColumn(
      'c_56',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_57Meta = const VerificationMeta('c_57');
  GeneratedIntColumn _c_57;
  @override
  GeneratedIntColumn get c_57 => _c_57 ??= _constructC57();
  GeneratedIntColumn _constructC57() {
    return GeneratedIntColumn(
      'c_57',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_58Meta = const VerificationMeta('c_58');
  GeneratedIntColumn _c_58;
  @override
  GeneratedIntColumn get c_58 => _c_58 ??= _constructC58();
  GeneratedIntColumn _constructC58() {
    return GeneratedIntColumn(
      'c_58',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_61Meta = const VerificationMeta('c_61');
  GeneratedIntColumn _c_61;
  @override
  GeneratedIntColumn get c_61 => _c_61 ??= _constructC61();
  GeneratedIntColumn _constructC61() {
    return GeneratedIntColumn(
      'c_61',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_62Meta = const VerificationMeta('c_62');
  GeneratedIntColumn _c_62;
  @override
  GeneratedIntColumn get c_62 => _c_62 ??= _constructC62();
  GeneratedIntColumn _constructC62() {
    return GeneratedIntColumn(
      'c_62',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_63Meta = const VerificationMeta('c_63');
  GeneratedIntColumn _c_63;
  @override
  GeneratedIntColumn get c_63 => _c_63 ??= _constructC63();
  GeneratedIntColumn _constructC63() {
    return GeneratedIntColumn(
      'c_63',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_64Meta = const VerificationMeta('c_64');
  GeneratedIntColumn _c_64;
  @override
  GeneratedIntColumn get c_64 => _c_64 ??= _constructC64();
  GeneratedIntColumn _constructC64() {
    return GeneratedIntColumn(
      'c_64',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_65Meta = const VerificationMeta('c_65');
  GeneratedIntColumn _c_65;
  @override
  GeneratedIntColumn get c_65 => _c_65 ??= _constructC65();
  GeneratedIntColumn _constructC65() {
    return GeneratedIntColumn(
      'c_65',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_66Meta = const VerificationMeta('c_66');
  GeneratedIntColumn _c_66;
  @override
  GeneratedIntColumn get c_66 => _c_66 ??= _constructC66();
  GeneratedIntColumn _constructC66() {
    return GeneratedIntColumn(
      'c_66',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_67Meta = const VerificationMeta('c_67');
  GeneratedIntColumn _c_67;
  @override
  GeneratedIntColumn get c_67 => _c_67 ??= _constructC67();
  GeneratedIntColumn _constructC67() {
    return GeneratedIntColumn(
      'c_67',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_68Meta = const VerificationMeta('c_68');
  GeneratedIntColumn _c_68;
  @override
  GeneratedIntColumn get c_68 => _c_68 ??= _constructC68();
  GeneratedIntColumn _constructC68() {
    return GeneratedIntColumn(
      'c_68',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_71Meta = const VerificationMeta('c_71');
  GeneratedIntColumn _c_71;
  @override
  GeneratedIntColumn get c_71 => _c_71 ??= _constructC71();
  GeneratedIntColumn _constructC71() {
    return GeneratedIntColumn(
      'c_71',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_72Meta = const VerificationMeta('c_72');
  GeneratedIntColumn _c_72;
  @override
  GeneratedIntColumn get c_72 => _c_72 ??= _constructC72();
  GeneratedIntColumn _constructC72() {
    return GeneratedIntColumn(
      'c_72',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_73Meta = const VerificationMeta('c_73');
  GeneratedIntColumn _c_73;
  @override
  GeneratedIntColumn get c_73 => _c_73 ??= _constructC73();
  GeneratedIntColumn _constructC73() {
    return GeneratedIntColumn(
      'c_73',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_74Meta = const VerificationMeta('c_74');
  GeneratedIntColumn _c_74;
  @override
  GeneratedIntColumn get c_74 => _c_74 ??= _constructC74();
  GeneratedIntColumn _constructC74() {
    return GeneratedIntColumn(
      'c_74',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_75Meta = const VerificationMeta('c_75');
  GeneratedIntColumn _c_75;
  @override
  GeneratedIntColumn get c_75 => _c_75 ??= _constructC75();
  GeneratedIntColumn _constructC75() {
    return GeneratedIntColumn(
      'c_75',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_76Meta = const VerificationMeta('c_76');
  GeneratedIntColumn _c_76;
  @override
  GeneratedIntColumn get c_76 => _c_76 ??= _constructC76();
  GeneratedIntColumn _constructC76() {
    return GeneratedIntColumn(
      'c_76',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_77Meta = const VerificationMeta('c_77');
  GeneratedIntColumn _c_77;
  @override
  GeneratedIntColumn get c_77 => _c_77 ??= _constructC77();
  GeneratedIntColumn _constructC77() {
    return GeneratedIntColumn(
      'c_77',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_78Meta = const VerificationMeta('c_78');
  GeneratedIntColumn _c_78;
  @override
  GeneratedIntColumn get c_78 => _c_78 ??= _constructC78();
  GeneratedIntColumn _constructC78() {
    return GeneratedIntColumn(
      'c_78',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_81Meta = const VerificationMeta('c_81');
  GeneratedIntColumn _c_81;
  @override
  GeneratedIntColumn get c_81 => _c_81 ??= _constructC81();
  GeneratedIntColumn _constructC81() {
    return GeneratedIntColumn(
      'c_81',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_82Meta = const VerificationMeta('c_82');
  GeneratedIntColumn _c_82;
  @override
  GeneratedIntColumn get c_82 => _c_82 ??= _constructC82();
  GeneratedIntColumn _constructC82() {
    return GeneratedIntColumn(
      'c_82',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_83Meta = const VerificationMeta('c_83');
  GeneratedIntColumn _c_83;
  @override
  GeneratedIntColumn get c_83 => _c_83 ??= _constructC83();
  GeneratedIntColumn _constructC83() {
    return GeneratedIntColumn(
      'c_83',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_84Meta = const VerificationMeta('c_84');
  GeneratedIntColumn _c_84;
  @override
  GeneratedIntColumn get c_84 => _c_84 ??= _constructC84();
  GeneratedIntColumn _constructC84() {
    return GeneratedIntColumn(
      'c_84',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_85Meta = const VerificationMeta('c_85');
  GeneratedIntColumn _c_85;
  @override
  GeneratedIntColumn get c_85 => _c_85 ??= _constructC85();
  GeneratedIntColumn _constructC85() {
    return GeneratedIntColumn(
      'c_85',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_86Meta = const VerificationMeta('c_86');
  GeneratedIntColumn _c_86;
  @override
  GeneratedIntColumn get c_86 => _c_86 ??= _constructC86();
  GeneratedIntColumn _constructC86() {
    return GeneratedIntColumn(
      'c_86',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_87Meta = const VerificationMeta('c_87');
  GeneratedIntColumn _c_87;
  @override
  GeneratedIntColumn get c_87 => _c_87 ??= _constructC87();
  GeneratedIntColumn _constructC87() {
    return GeneratedIntColumn(
      'c_87',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_88Meta = const VerificationMeta('c_88');
  GeneratedIntColumn _c_88;
  @override
  GeneratedIntColumn get c_88 => _c_88 ??= _constructC88();
  GeneratedIntColumn _constructC88() {
    return GeneratedIntColumn(
      'c_88',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_K3Meta = const VerificationMeta('c_K3');
  GeneratedIntColumn _c_K3;
  @override
  GeneratedIntColumn get c_K3 => _c_K3 ??= _constructCK3();
  GeneratedIntColumn _constructCK3() {
    return GeneratedIntColumn(
      'c_K3',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_K4Meta = const VerificationMeta('c_K4');
  GeneratedIntColumn _c_K4;
  @override
  GeneratedIntColumn get c_K4 => _c_K4 ??= _constructCK4();
  GeneratedIntColumn _constructCK4() {
    return GeneratedIntColumn(
      'c_K4',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_K5Meta = const VerificationMeta('c_K5');
  GeneratedIntColumn _c_K5;
  @override
  GeneratedIntColumn get c_K5 => _c_K5 ??= _constructCK5();
  GeneratedIntColumn _constructCK5() {
    return GeneratedIntColumn(
      'c_K5',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_K6Meta = const VerificationMeta('c_K6');
  GeneratedIntColumn _c_K6;
  @override
  GeneratedIntColumn get c_K6 => _c_K6 ??= _constructCK6();
  GeneratedIntColumn _constructCK6() {
    return GeneratedIntColumn(
      'c_K6',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_K7Meta = const VerificationMeta('c_K7');
  GeneratedIntColumn _c_K7;
  @override
  GeneratedIntColumn get c_K7 => _c_K7 ??= _constructCK7();
  GeneratedIntColumn _constructCK7() {
    return GeneratedIntColumn(
      'c_K7',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_K8Meta = const VerificationMeta('c_K8');
  GeneratedIntColumn _c_K8;
  @override
  GeneratedIntColumn get c_K8 => _c_K8 ??= _constructCK8();
  GeneratedIntColumn _constructCK8() {
    return GeneratedIntColumn(
      'c_K8',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_V37Meta = const VerificationMeta('c_V37');
  GeneratedIntColumn _c_V37;
  @override
  GeneratedIntColumn get c_V37 => _c_V37 ??= _constructCV37();
  GeneratedIntColumn _constructCV37() {
    return GeneratedIntColumn(
      'c_V37',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_V38Meta = const VerificationMeta('c_V38');
  GeneratedIntColumn _c_V38;
  @override
  GeneratedIntColumn get c_V38 => _c_V38 ??= _constructCV38();
  GeneratedIntColumn _constructCV38() {
    return GeneratedIntColumn(
      'c_V38',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_V47Meta = const VerificationMeta('c_V47');
  GeneratedIntColumn _c_V47;
  @override
  GeneratedIntColumn get c_V47 => _c_V47 ??= _constructCV47();
  GeneratedIntColumn _constructCV47() {
    return GeneratedIntColumn(
      'c_V47',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_V48Meta = const VerificationMeta('c_V48');
  GeneratedIntColumn _c_V48;
  @override
  GeneratedIntColumn get c_V48 => _c_V48 ??= _constructCV48();
  GeneratedIntColumn _constructCV48() {
    return GeneratedIntColumn(
      'c_V48',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_V57Meta = const VerificationMeta('c_V57');
  GeneratedIntColumn _c_V57;
  @override
  GeneratedIntColumn get c_V57 => _c_V57 ??= _constructCV57();
  GeneratedIntColumn _constructCV57() {
    return GeneratedIntColumn(
      'c_V57',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_V58Meta = const VerificationMeta('c_V58');
  GeneratedIntColumn _c_V58;
  @override
  GeneratedIntColumn get c_V58 => _c_V58 ??= _constructCV58();
  GeneratedIntColumn _constructCV58() {
    return GeneratedIntColumn(
      'c_V58',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_V67Meta = const VerificationMeta('c_V67');
  GeneratedIntColumn _c_V67;
  @override
  GeneratedIntColumn get c_V67 => _c_V67 ??= _constructCV67();
  GeneratedIntColumn _constructCV67() {
    return GeneratedIntColumn(
      'c_V67',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_V68Meta = const VerificationMeta('c_V68');
  GeneratedIntColumn _c_V68;
  @override
  GeneratedIntColumn get c_V68 => _c_V68 ??= _constructCV68();
  GeneratedIntColumn _constructCV68() {
    return GeneratedIntColumn(
      'c_V68',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        index,
        c_NyRad,
        c_Artsgruppe,
        c_Art,
        c_Autor,
        c_NorskNavn,
        c_X,
        c_Artskode,
        c_11,
        c_12,
        c_13,
        c_14,
        c_15,
        c_16,
        c_17,
        c_18,
        c_21,
        c_22,
        c_23,
        c_24,
        c_25,
        c_26,
        c_27,
        c_28,
        c_31,
        c_32,
        c_33,
        c_34,
        c_35,
        c_36,
        c_37,
        c_38,
        c_41,
        c_42,
        c_43,
        c_44,
        c_45,
        c_46,
        c_47,
        c_48,
        c_51,
        c_52,
        c_53,
        c_54,
        c_55,
        c_56,
        c_57,
        c_58,
        c_61,
        c_62,
        c_63,
        c_64,
        c_65,
        c_66,
        c_67,
        c_68,
        c_71,
        c_72,
        c_73,
        c_74,
        c_75,
        c_76,
        c_77,
        c_78,
        c_81,
        c_82,
        c_83,
        c_84,
        c_85,
        c_86,
        c_87,
        c_88,
        c_K3,
        c_K4,
        c_K5,
        c_K6,
        c_K7,
        c_K8,
        c_V37,
        c_V38,
        c_V47,
        c_V48,
        c_V57,
        c_V58,
        c_V67,
        c_V68
      ];
  @override
  $T4Table get asDslTable => this;
  @override
  String get $tableName => _alias ?? 't4';
  @override
  final String actualTableName = 't4';
  @override
  VerificationContext validateIntegrity(T4Companion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.index.present) {
      context.handle(
          _indexMeta, index.isAcceptableValue(d.index.value, _indexMeta));
    } else if (index.isRequired && isInserting) {
      context.missing(_indexMeta);
    }
    if (d.c_NyRad.present) {
      context.handle(_c_NyRadMeta,
          c_NyRad.isAcceptableValue(d.c_NyRad.value, _c_NyRadMeta));
    } else if (c_NyRad.isRequired && isInserting) {
      context.missing(_c_NyRadMeta);
    }
    if (d.c_Artsgruppe.present) {
      context.handle(
          _c_ArtsgruppeMeta,
          c_Artsgruppe.isAcceptableValue(
              d.c_Artsgruppe.value, _c_ArtsgruppeMeta));
    } else if (c_Artsgruppe.isRequired && isInserting) {
      context.missing(_c_ArtsgruppeMeta);
    }
    if (d.c_Art.present) {
      context.handle(
          _c_ArtMeta, c_Art.isAcceptableValue(d.c_Art.value, _c_ArtMeta));
    } else if (c_Art.isRequired && isInserting) {
      context.missing(_c_ArtMeta);
    }
    if (d.c_Autor.present) {
      context.handle(_c_AutorMeta,
          c_Autor.isAcceptableValue(d.c_Autor.value, _c_AutorMeta));
    } else if (c_Autor.isRequired && isInserting) {
      context.missing(_c_AutorMeta);
    }
    if (d.c_NorskNavn.present) {
      context.handle(_c_NorskNavnMeta,
          c_NorskNavn.isAcceptableValue(d.c_NorskNavn.value, _c_NorskNavnMeta));
    } else if (c_NorskNavn.isRequired && isInserting) {
      context.missing(_c_NorskNavnMeta);
    }
    if (d.c_X.present) {
      context.handle(_c_XMeta, c_X.isAcceptableValue(d.c_X.value, _c_XMeta));
    } else if (c_X.isRequired && isInserting) {
      context.missing(_c_XMeta);
    }
    if (d.c_Artskode.present) {
      context.handle(_c_ArtskodeMeta,
          c_Artskode.isAcceptableValue(d.c_Artskode.value, _c_ArtskodeMeta));
    } else if (c_Artskode.isRequired && isInserting) {
      context.missing(_c_ArtskodeMeta);
    }
    if (d.c_11.present) {
      context.handle(
          _c_11Meta, c_11.isAcceptableValue(d.c_11.value, _c_11Meta));
    } else if (c_11.isRequired && isInserting) {
      context.missing(_c_11Meta);
    }
    if (d.c_12.present) {
      context.handle(
          _c_12Meta, c_12.isAcceptableValue(d.c_12.value, _c_12Meta));
    } else if (c_12.isRequired && isInserting) {
      context.missing(_c_12Meta);
    }
    if (d.c_13.present) {
      context.handle(
          _c_13Meta, c_13.isAcceptableValue(d.c_13.value, _c_13Meta));
    } else if (c_13.isRequired && isInserting) {
      context.missing(_c_13Meta);
    }
    if (d.c_14.present) {
      context.handle(
          _c_14Meta, c_14.isAcceptableValue(d.c_14.value, _c_14Meta));
    } else if (c_14.isRequired && isInserting) {
      context.missing(_c_14Meta);
    }
    if (d.c_15.present) {
      context.handle(
          _c_15Meta, c_15.isAcceptableValue(d.c_15.value, _c_15Meta));
    } else if (c_15.isRequired && isInserting) {
      context.missing(_c_15Meta);
    }
    if (d.c_16.present) {
      context.handle(
          _c_16Meta, c_16.isAcceptableValue(d.c_16.value, _c_16Meta));
    } else if (c_16.isRequired && isInserting) {
      context.missing(_c_16Meta);
    }
    if (d.c_17.present) {
      context.handle(
          _c_17Meta, c_17.isAcceptableValue(d.c_17.value, _c_17Meta));
    } else if (c_17.isRequired && isInserting) {
      context.missing(_c_17Meta);
    }
    if (d.c_18.present) {
      context.handle(
          _c_18Meta, c_18.isAcceptableValue(d.c_18.value, _c_18Meta));
    } else if (c_18.isRequired && isInserting) {
      context.missing(_c_18Meta);
    }
    if (d.c_21.present) {
      context.handle(
          _c_21Meta, c_21.isAcceptableValue(d.c_21.value, _c_21Meta));
    } else if (c_21.isRequired && isInserting) {
      context.missing(_c_21Meta);
    }
    if (d.c_22.present) {
      context.handle(
          _c_22Meta, c_22.isAcceptableValue(d.c_22.value, _c_22Meta));
    } else if (c_22.isRequired && isInserting) {
      context.missing(_c_22Meta);
    }
    if (d.c_23.present) {
      context.handle(
          _c_23Meta, c_23.isAcceptableValue(d.c_23.value, _c_23Meta));
    } else if (c_23.isRequired && isInserting) {
      context.missing(_c_23Meta);
    }
    if (d.c_24.present) {
      context.handle(
          _c_24Meta, c_24.isAcceptableValue(d.c_24.value, _c_24Meta));
    } else if (c_24.isRequired && isInserting) {
      context.missing(_c_24Meta);
    }
    if (d.c_25.present) {
      context.handle(
          _c_25Meta, c_25.isAcceptableValue(d.c_25.value, _c_25Meta));
    } else if (c_25.isRequired && isInserting) {
      context.missing(_c_25Meta);
    }
    if (d.c_26.present) {
      context.handle(
          _c_26Meta, c_26.isAcceptableValue(d.c_26.value, _c_26Meta));
    } else if (c_26.isRequired && isInserting) {
      context.missing(_c_26Meta);
    }
    if (d.c_27.present) {
      context.handle(
          _c_27Meta, c_27.isAcceptableValue(d.c_27.value, _c_27Meta));
    } else if (c_27.isRequired && isInserting) {
      context.missing(_c_27Meta);
    }
    if (d.c_28.present) {
      context.handle(
          _c_28Meta, c_28.isAcceptableValue(d.c_28.value, _c_28Meta));
    } else if (c_28.isRequired && isInserting) {
      context.missing(_c_28Meta);
    }
    if (d.c_31.present) {
      context.handle(
          _c_31Meta, c_31.isAcceptableValue(d.c_31.value, _c_31Meta));
    } else if (c_31.isRequired && isInserting) {
      context.missing(_c_31Meta);
    }
    if (d.c_32.present) {
      context.handle(
          _c_32Meta, c_32.isAcceptableValue(d.c_32.value, _c_32Meta));
    } else if (c_32.isRequired && isInserting) {
      context.missing(_c_32Meta);
    }
    if (d.c_33.present) {
      context.handle(
          _c_33Meta, c_33.isAcceptableValue(d.c_33.value, _c_33Meta));
    } else if (c_33.isRequired && isInserting) {
      context.missing(_c_33Meta);
    }
    if (d.c_34.present) {
      context.handle(
          _c_34Meta, c_34.isAcceptableValue(d.c_34.value, _c_34Meta));
    } else if (c_34.isRequired && isInserting) {
      context.missing(_c_34Meta);
    }
    if (d.c_35.present) {
      context.handle(
          _c_35Meta, c_35.isAcceptableValue(d.c_35.value, _c_35Meta));
    } else if (c_35.isRequired && isInserting) {
      context.missing(_c_35Meta);
    }
    if (d.c_36.present) {
      context.handle(
          _c_36Meta, c_36.isAcceptableValue(d.c_36.value, _c_36Meta));
    } else if (c_36.isRequired && isInserting) {
      context.missing(_c_36Meta);
    }
    if (d.c_37.present) {
      context.handle(
          _c_37Meta, c_37.isAcceptableValue(d.c_37.value, _c_37Meta));
    } else if (c_37.isRequired && isInserting) {
      context.missing(_c_37Meta);
    }
    if (d.c_38.present) {
      context.handle(
          _c_38Meta, c_38.isAcceptableValue(d.c_38.value, _c_38Meta));
    } else if (c_38.isRequired && isInserting) {
      context.missing(_c_38Meta);
    }
    if (d.c_41.present) {
      context.handle(
          _c_41Meta, c_41.isAcceptableValue(d.c_41.value, _c_41Meta));
    } else if (c_41.isRequired && isInserting) {
      context.missing(_c_41Meta);
    }
    if (d.c_42.present) {
      context.handle(
          _c_42Meta, c_42.isAcceptableValue(d.c_42.value, _c_42Meta));
    } else if (c_42.isRequired && isInserting) {
      context.missing(_c_42Meta);
    }
    if (d.c_43.present) {
      context.handle(
          _c_43Meta, c_43.isAcceptableValue(d.c_43.value, _c_43Meta));
    } else if (c_43.isRequired && isInserting) {
      context.missing(_c_43Meta);
    }
    if (d.c_44.present) {
      context.handle(
          _c_44Meta, c_44.isAcceptableValue(d.c_44.value, _c_44Meta));
    } else if (c_44.isRequired && isInserting) {
      context.missing(_c_44Meta);
    }
    if (d.c_45.present) {
      context.handle(
          _c_45Meta, c_45.isAcceptableValue(d.c_45.value, _c_45Meta));
    } else if (c_45.isRequired && isInserting) {
      context.missing(_c_45Meta);
    }
    if (d.c_46.present) {
      context.handle(
          _c_46Meta, c_46.isAcceptableValue(d.c_46.value, _c_46Meta));
    } else if (c_46.isRequired && isInserting) {
      context.missing(_c_46Meta);
    }
    if (d.c_47.present) {
      context.handle(
          _c_47Meta, c_47.isAcceptableValue(d.c_47.value, _c_47Meta));
    } else if (c_47.isRequired && isInserting) {
      context.missing(_c_47Meta);
    }
    if (d.c_48.present) {
      context.handle(
          _c_48Meta, c_48.isAcceptableValue(d.c_48.value, _c_48Meta));
    } else if (c_48.isRequired && isInserting) {
      context.missing(_c_48Meta);
    }
    if (d.c_51.present) {
      context.handle(
          _c_51Meta, c_51.isAcceptableValue(d.c_51.value, _c_51Meta));
    } else if (c_51.isRequired && isInserting) {
      context.missing(_c_51Meta);
    }
    if (d.c_52.present) {
      context.handle(
          _c_52Meta, c_52.isAcceptableValue(d.c_52.value, _c_52Meta));
    } else if (c_52.isRequired && isInserting) {
      context.missing(_c_52Meta);
    }
    if (d.c_53.present) {
      context.handle(
          _c_53Meta, c_53.isAcceptableValue(d.c_53.value, _c_53Meta));
    } else if (c_53.isRequired && isInserting) {
      context.missing(_c_53Meta);
    }
    if (d.c_54.present) {
      context.handle(
          _c_54Meta, c_54.isAcceptableValue(d.c_54.value, _c_54Meta));
    } else if (c_54.isRequired && isInserting) {
      context.missing(_c_54Meta);
    }
    if (d.c_55.present) {
      context.handle(
          _c_55Meta, c_55.isAcceptableValue(d.c_55.value, _c_55Meta));
    } else if (c_55.isRequired && isInserting) {
      context.missing(_c_55Meta);
    }
    if (d.c_56.present) {
      context.handle(
          _c_56Meta, c_56.isAcceptableValue(d.c_56.value, _c_56Meta));
    } else if (c_56.isRequired && isInserting) {
      context.missing(_c_56Meta);
    }
    if (d.c_57.present) {
      context.handle(
          _c_57Meta, c_57.isAcceptableValue(d.c_57.value, _c_57Meta));
    } else if (c_57.isRequired && isInserting) {
      context.missing(_c_57Meta);
    }
    if (d.c_58.present) {
      context.handle(
          _c_58Meta, c_58.isAcceptableValue(d.c_58.value, _c_58Meta));
    } else if (c_58.isRequired && isInserting) {
      context.missing(_c_58Meta);
    }
    if (d.c_61.present) {
      context.handle(
          _c_61Meta, c_61.isAcceptableValue(d.c_61.value, _c_61Meta));
    } else if (c_61.isRequired && isInserting) {
      context.missing(_c_61Meta);
    }
    if (d.c_62.present) {
      context.handle(
          _c_62Meta, c_62.isAcceptableValue(d.c_62.value, _c_62Meta));
    } else if (c_62.isRequired && isInserting) {
      context.missing(_c_62Meta);
    }
    if (d.c_63.present) {
      context.handle(
          _c_63Meta, c_63.isAcceptableValue(d.c_63.value, _c_63Meta));
    } else if (c_63.isRequired && isInserting) {
      context.missing(_c_63Meta);
    }
    if (d.c_64.present) {
      context.handle(
          _c_64Meta, c_64.isAcceptableValue(d.c_64.value, _c_64Meta));
    } else if (c_64.isRequired && isInserting) {
      context.missing(_c_64Meta);
    }
    if (d.c_65.present) {
      context.handle(
          _c_65Meta, c_65.isAcceptableValue(d.c_65.value, _c_65Meta));
    } else if (c_65.isRequired && isInserting) {
      context.missing(_c_65Meta);
    }
    if (d.c_66.present) {
      context.handle(
          _c_66Meta, c_66.isAcceptableValue(d.c_66.value, _c_66Meta));
    } else if (c_66.isRequired && isInserting) {
      context.missing(_c_66Meta);
    }
    if (d.c_67.present) {
      context.handle(
          _c_67Meta, c_67.isAcceptableValue(d.c_67.value, _c_67Meta));
    } else if (c_67.isRequired && isInserting) {
      context.missing(_c_67Meta);
    }
    if (d.c_68.present) {
      context.handle(
          _c_68Meta, c_68.isAcceptableValue(d.c_68.value, _c_68Meta));
    } else if (c_68.isRequired && isInserting) {
      context.missing(_c_68Meta);
    }
    if (d.c_71.present) {
      context.handle(
          _c_71Meta, c_71.isAcceptableValue(d.c_71.value, _c_71Meta));
    } else if (c_71.isRequired && isInserting) {
      context.missing(_c_71Meta);
    }
    if (d.c_72.present) {
      context.handle(
          _c_72Meta, c_72.isAcceptableValue(d.c_72.value, _c_72Meta));
    } else if (c_72.isRequired && isInserting) {
      context.missing(_c_72Meta);
    }
    if (d.c_73.present) {
      context.handle(
          _c_73Meta, c_73.isAcceptableValue(d.c_73.value, _c_73Meta));
    } else if (c_73.isRequired && isInserting) {
      context.missing(_c_73Meta);
    }
    if (d.c_74.present) {
      context.handle(
          _c_74Meta, c_74.isAcceptableValue(d.c_74.value, _c_74Meta));
    } else if (c_74.isRequired && isInserting) {
      context.missing(_c_74Meta);
    }
    if (d.c_75.present) {
      context.handle(
          _c_75Meta, c_75.isAcceptableValue(d.c_75.value, _c_75Meta));
    } else if (c_75.isRequired && isInserting) {
      context.missing(_c_75Meta);
    }
    if (d.c_76.present) {
      context.handle(
          _c_76Meta, c_76.isAcceptableValue(d.c_76.value, _c_76Meta));
    } else if (c_76.isRequired && isInserting) {
      context.missing(_c_76Meta);
    }
    if (d.c_77.present) {
      context.handle(
          _c_77Meta, c_77.isAcceptableValue(d.c_77.value, _c_77Meta));
    } else if (c_77.isRequired && isInserting) {
      context.missing(_c_77Meta);
    }
    if (d.c_78.present) {
      context.handle(
          _c_78Meta, c_78.isAcceptableValue(d.c_78.value, _c_78Meta));
    } else if (c_78.isRequired && isInserting) {
      context.missing(_c_78Meta);
    }
    if (d.c_81.present) {
      context.handle(
          _c_81Meta, c_81.isAcceptableValue(d.c_81.value, _c_81Meta));
    } else if (c_81.isRequired && isInserting) {
      context.missing(_c_81Meta);
    }
    if (d.c_82.present) {
      context.handle(
          _c_82Meta, c_82.isAcceptableValue(d.c_82.value, _c_82Meta));
    } else if (c_82.isRequired && isInserting) {
      context.missing(_c_82Meta);
    }
    if (d.c_83.present) {
      context.handle(
          _c_83Meta, c_83.isAcceptableValue(d.c_83.value, _c_83Meta));
    } else if (c_83.isRequired && isInserting) {
      context.missing(_c_83Meta);
    }
    if (d.c_84.present) {
      context.handle(
          _c_84Meta, c_84.isAcceptableValue(d.c_84.value, _c_84Meta));
    } else if (c_84.isRequired && isInserting) {
      context.missing(_c_84Meta);
    }
    if (d.c_85.present) {
      context.handle(
          _c_85Meta, c_85.isAcceptableValue(d.c_85.value, _c_85Meta));
    } else if (c_85.isRequired && isInserting) {
      context.missing(_c_85Meta);
    }
    if (d.c_86.present) {
      context.handle(
          _c_86Meta, c_86.isAcceptableValue(d.c_86.value, _c_86Meta));
    } else if (c_86.isRequired && isInserting) {
      context.missing(_c_86Meta);
    }
    if (d.c_87.present) {
      context.handle(
          _c_87Meta, c_87.isAcceptableValue(d.c_87.value, _c_87Meta));
    } else if (c_87.isRequired && isInserting) {
      context.missing(_c_87Meta);
    }
    if (d.c_88.present) {
      context.handle(
          _c_88Meta, c_88.isAcceptableValue(d.c_88.value, _c_88Meta));
    } else if (c_88.isRequired && isInserting) {
      context.missing(_c_88Meta);
    }
    if (d.c_K3.present) {
      context.handle(
          _c_K3Meta, c_K3.isAcceptableValue(d.c_K3.value, _c_K3Meta));
    } else if (c_K3.isRequired && isInserting) {
      context.missing(_c_K3Meta);
    }
    if (d.c_K4.present) {
      context.handle(
          _c_K4Meta, c_K4.isAcceptableValue(d.c_K4.value, _c_K4Meta));
    } else if (c_K4.isRequired && isInserting) {
      context.missing(_c_K4Meta);
    }
    if (d.c_K5.present) {
      context.handle(
          _c_K5Meta, c_K5.isAcceptableValue(d.c_K5.value, _c_K5Meta));
    } else if (c_K5.isRequired && isInserting) {
      context.missing(_c_K5Meta);
    }
    if (d.c_K6.present) {
      context.handle(
          _c_K6Meta, c_K6.isAcceptableValue(d.c_K6.value, _c_K6Meta));
    } else if (c_K6.isRequired && isInserting) {
      context.missing(_c_K6Meta);
    }
    if (d.c_K7.present) {
      context.handle(
          _c_K7Meta, c_K7.isAcceptableValue(d.c_K7.value, _c_K7Meta));
    } else if (c_K7.isRequired && isInserting) {
      context.missing(_c_K7Meta);
    }
    if (d.c_K8.present) {
      context.handle(
          _c_K8Meta, c_K8.isAcceptableValue(d.c_K8.value, _c_K8Meta));
    } else if (c_K8.isRequired && isInserting) {
      context.missing(_c_K8Meta);
    }
    if (d.c_V37.present) {
      context.handle(
          _c_V37Meta, c_V37.isAcceptableValue(d.c_V37.value, _c_V37Meta));
    } else if (c_V37.isRequired && isInserting) {
      context.missing(_c_V37Meta);
    }
    if (d.c_V38.present) {
      context.handle(
          _c_V38Meta, c_V38.isAcceptableValue(d.c_V38.value, _c_V38Meta));
    } else if (c_V38.isRequired && isInserting) {
      context.missing(_c_V38Meta);
    }
    if (d.c_V47.present) {
      context.handle(
          _c_V47Meta, c_V47.isAcceptableValue(d.c_V47.value, _c_V47Meta));
    } else if (c_V47.isRequired && isInserting) {
      context.missing(_c_V47Meta);
    }
    if (d.c_V48.present) {
      context.handle(
          _c_V48Meta, c_V48.isAcceptableValue(d.c_V48.value, _c_V48Meta));
    } else if (c_V48.isRequired && isInserting) {
      context.missing(_c_V48Meta);
    }
    if (d.c_V57.present) {
      context.handle(
          _c_V57Meta, c_V57.isAcceptableValue(d.c_V57.value, _c_V57Meta));
    } else if (c_V57.isRequired && isInserting) {
      context.missing(_c_V57Meta);
    }
    if (d.c_V58.present) {
      context.handle(
          _c_V58Meta, c_V58.isAcceptableValue(d.c_V58.value, _c_V58Meta));
    } else if (c_V58.isRequired && isInserting) {
      context.missing(_c_V58Meta);
    }
    if (d.c_V67.present) {
      context.handle(
          _c_V67Meta, c_V67.isAcceptableValue(d.c_V67.value, _c_V67Meta));
    } else if (c_V67.isRequired && isInserting) {
      context.missing(_c_V67Meta);
    }
    if (d.c_V68.present) {
      context.handle(
          _c_V68Meta, c_V68.isAcceptableValue(d.c_V68.value, _c_V68Meta));
    } else if (c_V68.isRequired && isInserting) {
      context.missing(_c_V68Meta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {index};
  @override
  T4Data map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return T4Data.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(T4Companion d) {
    final map = <String, Variable>{};
    if (d.index.present) {
      map['index'] = Variable<int, IntType>(d.index.value);
    }
    if (d.c_NyRad.present) {
      map['c_NyRad'] = Variable<String, StringType>(d.c_NyRad.value);
    }
    if (d.c_Artsgruppe.present) {
      map['c_Artsgruppe'] = Variable<String, StringType>(d.c_Artsgruppe.value);
    }
    if (d.c_Art.present) {
      map['c_Art'] = Variable<String, StringType>(d.c_Art.value);
    }
    if (d.c_Autor.present) {
      map['c_Autor'] = Variable<String, StringType>(d.c_Autor.value);
    }
    if (d.c_NorskNavn.present) {
      map['c_NorskNavn'] = Variable<String, StringType>(d.c_NorskNavn.value);
    }
    if (d.c_X.present) {
      map['c_X'] = Variable<String, StringType>(d.c_X.value);
    }
    if (d.c_Artskode.present) {
      map['c_Artskode'] = Variable<String, StringType>(d.c_Artskode.value);
    }
    if (d.c_11.present) {
      map['c_11'] = Variable<int, IntType>(d.c_11.value);
    }
    if (d.c_12.present) {
      map['c_12'] = Variable<int, IntType>(d.c_12.value);
    }
    if (d.c_13.present) {
      map['c_13'] = Variable<int, IntType>(d.c_13.value);
    }
    if (d.c_14.present) {
      map['c_14'] = Variable<int, IntType>(d.c_14.value);
    }
    if (d.c_15.present) {
      map['c_15'] = Variable<int, IntType>(d.c_15.value);
    }
    if (d.c_16.present) {
      map['c_16'] = Variable<int, IntType>(d.c_16.value);
    }
    if (d.c_17.present) {
      map['c_17'] = Variable<int, IntType>(d.c_17.value);
    }
    if (d.c_18.present) {
      map['c_18'] = Variable<int, IntType>(d.c_18.value);
    }
    if (d.c_21.present) {
      map['c_21'] = Variable<int, IntType>(d.c_21.value);
    }
    if (d.c_22.present) {
      map['c_22'] = Variable<int, IntType>(d.c_22.value);
    }
    if (d.c_23.present) {
      map['c_23'] = Variable<int, IntType>(d.c_23.value);
    }
    if (d.c_24.present) {
      map['c_24'] = Variable<int, IntType>(d.c_24.value);
    }
    if (d.c_25.present) {
      map['c_25'] = Variable<int, IntType>(d.c_25.value);
    }
    if (d.c_26.present) {
      map['c_26'] = Variable<int, IntType>(d.c_26.value);
    }
    if (d.c_27.present) {
      map['c_27'] = Variable<int, IntType>(d.c_27.value);
    }
    if (d.c_28.present) {
      map['c_28'] = Variable<int, IntType>(d.c_28.value);
    }
    if (d.c_31.present) {
      map['c_31'] = Variable<int, IntType>(d.c_31.value);
    }
    if (d.c_32.present) {
      map['c_32'] = Variable<int, IntType>(d.c_32.value);
    }
    if (d.c_33.present) {
      map['c_33'] = Variable<int, IntType>(d.c_33.value);
    }
    if (d.c_34.present) {
      map['c_34'] = Variable<int, IntType>(d.c_34.value);
    }
    if (d.c_35.present) {
      map['c_35'] = Variable<int, IntType>(d.c_35.value);
    }
    if (d.c_36.present) {
      map['c_36'] = Variable<int, IntType>(d.c_36.value);
    }
    if (d.c_37.present) {
      map['c_37'] = Variable<int, IntType>(d.c_37.value);
    }
    if (d.c_38.present) {
      map['c_38'] = Variable<int, IntType>(d.c_38.value);
    }
    if (d.c_41.present) {
      map['c_41'] = Variable<int, IntType>(d.c_41.value);
    }
    if (d.c_42.present) {
      map['c_42'] = Variable<int, IntType>(d.c_42.value);
    }
    if (d.c_43.present) {
      map['c_43'] = Variable<int, IntType>(d.c_43.value);
    }
    if (d.c_44.present) {
      map['c_44'] = Variable<int, IntType>(d.c_44.value);
    }
    if (d.c_45.present) {
      map['c_45'] = Variable<int, IntType>(d.c_45.value);
    }
    if (d.c_46.present) {
      map['c_46'] = Variable<int, IntType>(d.c_46.value);
    }
    if (d.c_47.present) {
      map['c_47'] = Variable<int, IntType>(d.c_47.value);
    }
    if (d.c_48.present) {
      map['c_48'] = Variable<int, IntType>(d.c_48.value);
    }
    if (d.c_51.present) {
      map['c_51'] = Variable<int, IntType>(d.c_51.value);
    }
    if (d.c_52.present) {
      map['c_52'] = Variable<int, IntType>(d.c_52.value);
    }
    if (d.c_53.present) {
      map['c_53'] = Variable<int, IntType>(d.c_53.value);
    }
    if (d.c_54.present) {
      map['c_54'] = Variable<int, IntType>(d.c_54.value);
    }
    if (d.c_55.present) {
      map['c_55'] = Variable<int, IntType>(d.c_55.value);
    }
    if (d.c_56.present) {
      map['c_56'] = Variable<int, IntType>(d.c_56.value);
    }
    if (d.c_57.present) {
      map['c_57'] = Variable<int, IntType>(d.c_57.value);
    }
    if (d.c_58.present) {
      map['c_58'] = Variable<int, IntType>(d.c_58.value);
    }
    if (d.c_61.present) {
      map['c_61'] = Variable<int, IntType>(d.c_61.value);
    }
    if (d.c_62.present) {
      map['c_62'] = Variable<int, IntType>(d.c_62.value);
    }
    if (d.c_63.present) {
      map['c_63'] = Variable<int, IntType>(d.c_63.value);
    }
    if (d.c_64.present) {
      map['c_64'] = Variable<int, IntType>(d.c_64.value);
    }
    if (d.c_65.present) {
      map['c_65'] = Variable<int, IntType>(d.c_65.value);
    }
    if (d.c_66.present) {
      map['c_66'] = Variable<int, IntType>(d.c_66.value);
    }
    if (d.c_67.present) {
      map['c_67'] = Variable<int, IntType>(d.c_67.value);
    }
    if (d.c_68.present) {
      map['c_68'] = Variable<int, IntType>(d.c_68.value);
    }
    if (d.c_71.present) {
      map['c_71'] = Variable<int, IntType>(d.c_71.value);
    }
    if (d.c_72.present) {
      map['c_72'] = Variable<int, IntType>(d.c_72.value);
    }
    if (d.c_73.present) {
      map['c_73'] = Variable<int, IntType>(d.c_73.value);
    }
    if (d.c_74.present) {
      map['c_74'] = Variable<int, IntType>(d.c_74.value);
    }
    if (d.c_75.present) {
      map['c_75'] = Variable<int, IntType>(d.c_75.value);
    }
    if (d.c_76.present) {
      map['c_76'] = Variable<int, IntType>(d.c_76.value);
    }
    if (d.c_77.present) {
      map['c_77'] = Variable<int, IntType>(d.c_77.value);
    }
    if (d.c_78.present) {
      map['c_78'] = Variable<int, IntType>(d.c_78.value);
    }
    if (d.c_81.present) {
      map['c_81'] = Variable<int, IntType>(d.c_81.value);
    }
    if (d.c_82.present) {
      map['c_82'] = Variable<int, IntType>(d.c_82.value);
    }
    if (d.c_83.present) {
      map['c_83'] = Variable<int, IntType>(d.c_83.value);
    }
    if (d.c_84.present) {
      map['c_84'] = Variable<int, IntType>(d.c_84.value);
    }
    if (d.c_85.present) {
      map['c_85'] = Variable<int, IntType>(d.c_85.value);
    }
    if (d.c_86.present) {
      map['c_86'] = Variable<int, IntType>(d.c_86.value);
    }
    if (d.c_87.present) {
      map['c_87'] = Variable<int, IntType>(d.c_87.value);
    }
    if (d.c_88.present) {
      map['c_88'] = Variable<int, IntType>(d.c_88.value);
    }
    if (d.c_K3.present) {
      map['c_K3'] = Variable<int, IntType>(d.c_K3.value);
    }
    if (d.c_K4.present) {
      map['c_K4'] = Variable<int, IntType>(d.c_K4.value);
    }
    if (d.c_K5.present) {
      map['c_K5'] = Variable<int, IntType>(d.c_K5.value);
    }
    if (d.c_K6.present) {
      map['c_K6'] = Variable<int, IntType>(d.c_K6.value);
    }
    if (d.c_K7.present) {
      map['c_K7'] = Variable<int, IntType>(d.c_K7.value);
    }
    if (d.c_K8.present) {
      map['c_K8'] = Variable<int, IntType>(d.c_K8.value);
    }
    if (d.c_V37.present) {
      map['c_V37'] = Variable<int, IntType>(d.c_V37.value);
    }
    if (d.c_V38.present) {
      map['c_V38'] = Variable<int, IntType>(d.c_V38.value);
    }
    if (d.c_V47.present) {
      map['c_V47'] = Variable<int, IntType>(d.c_V47.value);
    }
    if (d.c_V48.present) {
      map['c_V48'] = Variable<int, IntType>(d.c_V48.value);
    }
    if (d.c_V57.present) {
      map['c_V57'] = Variable<int, IntType>(d.c_V57.value);
    }
    if (d.c_V58.present) {
      map['c_V58'] = Variable<int, IntType>(d.c_V58.value);
    }
    if (d.c_V67.present) {
      map['c_V67'] = Variable<int, IntType>(d.c_V67.value);
    }
    if (d.c_V68.present) {
      map['c_V68'] = Variable<int, IntType>(d.c_V68.value);
    }
    return map;
  }

  @override
  $T4Table createAlias(String alias) {
    return $T4Table(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $T4Table _t4;
  $T4Table get t4 => _t4 ??= $T4Table(this);
  T4Dao _t4Dao;
  T4Dao get t4Dao => _t4Dao ??= T4Dao(this as MyDatabase);
  @override
  List<TableInfo> get allTables => [t4];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$T4DaoMixin on DatabaseAccessor<MyDatabase> {
  $T4Table get t4 => db.t4;
}
