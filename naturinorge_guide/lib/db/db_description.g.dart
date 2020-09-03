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
  final double c_RU;
  final double c_SU;
  final double c_SS;
  final double c_HI;
  final double c_VMfmax;
  final double c_VMfmin;
  final int c_VFrmax;
  final int c_VFrmin;
  final int c_Unnamed93;
  final String c_Unnamed94;
  final String c_VM;
  final String c_HI1;
  final String c_RU1;
  final String c_SU1;
  final String c_SS1;
  final String c_VS;
  final String c_UE;
  final String c_BK;
  final String c_DK;
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
      this.c_V68,
      this.c_RU,
      this.c_SU,
      this.c_SS,
      this.c_HI,
      this.c_VMfmax,
      this.c_VMfmin,
      this.c_VFrmax,
      this.c_VFrmin,
      this.c_Unnamed93,
      this.c_Unnamed94,
      this.c_VM,
      this.c_HI1,
      this.c_RU1,
      this.c_SU1,
      this.c_SS1,
      this.c_VS,
      this.c_UE,
      this.c_BK,
      this.c_DK});
  factory T4Data.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
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
      c_RU: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}c_RU']),
      c_SU: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}c_SU']),
      c_SS: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}c_SS']),
      c_HI: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}c_HI']),
      c_VMfmax: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}c_VMfmax']),
      c_VMfmin: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}c_VMfmin']),
      c_VFrmax:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}c_VFrmax']),
      c_VFrmin:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}c_VFrmin']),
      c_Unnamed93: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}c_Unnamed93']),
      c_Unnamed94: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}c_Unnamed94']),
      c_VM: stringType.mapFromDatabaseResponse(data['${effectivePrefix}c_VM']),
      c_HI1:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}c_HI1']),
      c_RU1:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}c_RU1']),
      c_SU1:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}c_SU1']),
      c_SS1:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}c_SS1']),
      c_VS: stringType.mapFromDatabaseResponse(data['${effectivePrefix}c_VS']),
      c_UE: stringType.mapFromDatabaseResponse(data['${effectivePrefix}c_UE']),
      c_BK: stringType.mapFromDatabaseResponse(data['${effectivePrefix}c_BK']),
      c_DK: stringType.mapFromDatabaseResponse(data['${effectivePrefix}c_DK']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || index != null) {
      map['index'] = Variable<int>(index);
    }
    if (!nullToAbsent || c_NyRad != null) {
      map['c_NyRad'] = Variable<String>(c_NyRad);
    }
    if (!nullToAbsent || c_Artsgruppe != null) {
      map['c_Artsgruppe'] = Variable<String>(c_Artsgruppe);
    }
    if (!nullToAbsent || c_Art != null) {
      map['c_Art'] = Variable<String>(c_Art);
    }
    if (!nullToAbsent || c_Autor != null) {
      map['c_Autor'] = Variable<String>(c_Autor);
    }
    if (!nullToAbsent || c_NorskNavn != null) {
      map['c_NorskNavn'] = Variable<String>(c_NorskNavn);
    }
    if (!nullToAbsent || c_X != null) {
      map['c_X'] = Variable<String>(c_X);
    }
    if (!nullToAbsent || c_Artskode != null) {
      map['c_Artskode'] = Variable<String>(c_Artskode);
    }
    if (!nullToAbsent || c_11 != null) {
      map['c_11'] = Variable<int>(c_11);
    }
    if (!nullToAbsent || c_12 != null) {
      map['c_12'] = Variable<int>(c_12);
    }
    if (!nullToAbsent || c_13 != null) {
      map['c_13'] = Variable<int>(c_13);
    }
    if (!nullToAbsent || c_14 != null) {
      map['c_14'] = Variable<int>(c_14);
    }
    if (!nullToAbsent || c_15 != null) {
      map['c_15'] = Variable<int>(c_15);
    }
    if (!nullToAbsent || c_16 != null) {
      map['c_16'] = Variable<int>(c_16);
    }
    if (!nullToAbsent || c_17 != null) {
      map['c_17'] = Variable<int>(c_17);
    }
    if (!nullToAbsent || c_18 != null) {
      map['c_18'] = Variable<int>(c_18);
    }
    if (!nullToAbsent || c_21 != null) {
      map['c_21'] = Variable<int>(c_21);
    }
    if (!nullToAbsent || c_22 != null) {
      map['c_22'] = Variable<int>(c_22);
    }
    if (!nullToAbsent || c_23 != null) {
      map['c_23'] = Variable<int>(c_23);
    }
    if (!nullToAbsent || c_24 != null) {
      map['c_24'] = Variable<int>(c_24);
    }
    if (!nullToAbsent || c_25 != null) {
      map['c_25'] = Variable<int>(c_25);
    }
    if (!nullToAbsent || c_26 != null) {
      map['c_26'] = Variable<int>(c_26);
    }
    if (!nullToAbsent || c_27 != null) {
      map['c_27'] = Variable<int>(c_27);
    }
    if (!nullToAbsent || c_28 != null) {
      map['c_28'] = Variable<int>(c_28);
    }
    if (!nullToAbsent || c_31 != null) {
      map['c_31'] = Variable<int>(c_31);
    }
    if (!nullToAbsent || c_32 != null) {
      map['c_32'] = Variable<int>(c_32);
    }
    if (!nullToAbsent || c_33 != null) {
      map['c_33'] = Variable<int>(c_33);
    }
    if (!nullToAbsent || c_34 != null) {
      map['c_34'] = Variable<int>(c_34);
    }
    if (!nullToAbsent || c_35 != null) {
      map['c_35'] = Variable<int>(c_35);
    }
    if (!nullToAbsent || c_36 != null) {
      map['c_36'] = Variable<int>(c_36);
    }
    if (!nullToAbsent || c_37 != null) {
      map['c_37'] = Variable<int>(c_37);
    }
    if (!nullToAbsent || c_38 != null) {
      map['c_38'] = Variable<int>(c_38);
    }
    if (!nullToAbsent || c_41 != null) {
      map['c_41'] = Variable<int>(c_41);
    }
    if (!nullToAbsent || c_42 != null) {
      map['c_42'] = Variable<int>(c_42);
    }
    if (!nullToAbsent || c_43 != null) {
      map['c_43'] = Variable<int>(c_43);
    }
    if (!nullToAbsent || c_44 != null) {
      map['c_44'] = Variable<int>(c_44);
    }
    if (!nullToAbsent || c_45 != null) {
      map['c_45'] = Variable<int>(c_45);
    }
    if (!nullToAbsent || c_46 != null) {
      map['c_46'] = Variable<int>(c_46);
    }
    if (!nullToAbsent || c_47 != null) {
      map['c_47'] = Variable<int>(c_47);
    }
    if (!nullToAbsent || c_48 != null) {
      map['c_48'] = Variable<int>(c_48);
    }
    if (!nullToAbsent || c_51 != null) {
      map['c_51'] = Variable<int>(c_51);
    }
    if (!nullToAbsent || c_52 != null) {
      map['c_52'] = Variable<int>(c_52);
    }
    if (!nullToAbsent || c_53 != null) {
      map['c_53'] = Variable<int>(c_53);
    }
    if (!nullToAbsent || c_54 != null) {
      map['c_54'] = Variable<int>(c_54);
    }
    if (!nullToAbsent || c_55 != null) {
      map['c_55'] = Variable<int>(c_55);
    }
    if (!nullToAbsent || c_56 != null) {
      map['c_56'] = Variable<int>(c_56);
    }
    if (!nullToAbsent || c_57 != null) {
      map['c_57'] = Variable<int>(c_57);
    }
    if (!nullToAbsent || c_58 != null) {
      map['c_58'] = Variable<int>(c_58);
    }
    if (!nullToAbsent || c_61 != null) {
      map['c_61'] = Variable<int>(c_61);
    }
    if (!nullToAbsent || c_62 != null) {
      map['c_62'] = Variable<int>(c_62);
    }
    if (!nullToAbsent || c_63 != null) {
      map['c_63'] = Variable<int>(c_63);
    }
    if (!nullToAbsent || c_64 != null) {
      map['c_64'] = Variable<int>(c_64);
    }
    if (!nullToAbsent || c_65 != null) {
      map['c_65'] = Variable<int>(c_65);
    }
    if (!nullToAbsent || c_66 != null) {
      map['c_66'] = Variable<int>(c_66);
    }
    if (!nullToAbsent || c_67 != null) {
      map['c_67'] = Variable<int>(c_67);
    }
    if (!nullToAbsent || c_68 != null) {
      map['c_68'] = Variable<int>(c_68);
    }
    if (!nullToAbsent || c_71 != null) {
      map['c_71'] = Variable<int>(c_71);
    }
    if (!nullToAbsent || c_72 != null) {
      map['c_72'] = Variable<int>(c_72);
    }
    if (!nullToAbsent || c_73 != null) {
      map['c_73'] = Variable<int>(c_73);
    }
    if (!nullToAbsent || c_74 != null) {
      map['c_74'] = Variable<int>(c_74);
    }
    if (!nullToAbsent || c_75 != null) {
      map['c_75'] = Variable<int>(c_75);
    }
    if (!nullToAbsent || c_76 != null) {
      map['c_76'] = Variable<int>(c_76);
    }
    if (!nullToAbsent || c_77 != null) {
      map['c_77'] = Variable<int>(c_77);
    }
    if (!nullToAbsent || c_78 != null) {
      map['c_78'] = Variable<int>(c_78);
    }
    if (!nullToAbsent || c_81 != null) {
      map['c_81'] = Variable<int>(c_81);
    }
    if (!nullToAbsent || c_82 != null) {
      map['c_82'] = Variable<int>(c_82);
    }
    if (!nullToAbsent || c_83 != null) {
      map['c_83'] = Variable<int>(c_83);
    }
    if (!nullToAbsent || c_84 != null) {
      map['c_84'] = Variable<int>(c_84);
    }
    if (!nullToAbsent || c_85 != null) {
      map['c_85'] = Variable<int>(c_85);
    }
    if (!nullToAbsent || c_86 != null) {
      map['c_86'] = Variable<int>(c_86);
    }
    if (!nullToAbsent || c_87 != null) {
      map['c_87'] = Variable<int>(c_87);
    }
    if (!nullToAbsent || c_88 != null) {
      map['c_88'] = Variable<int>(c_88);
    }
    if (!nullToAbsent || c_K3 != null) {
      map['c_K3'] = Variable<int>(c_K3);
    }
    if (!nullToAbsent || c_K4 != null) {
      map['c_K4'] = Variable<int>(c_K4);
    }
    if (!nullToAbsent || c_K5 != null) {
      map['c_K5'] = Variable<int>(c_K5);
    }
    if (!nullToAbsent || c_K6 != null) {
      map['c_K6'] = Variable<int>(c_K6);
    }
    if (!nullToAbsent || c_K7 != null) {
      map['c_K7'] = Variable<int>(c_K7);
    }
    if (!nullToAbsent || c_K8 != null) {
      map['c_K8'] = Variable<int>(c_K8);
    }
    if (!nullToAbsent || c_V37 != null) {
      map['c_V37'] = Variable<int>(c_V37);
    }
    if (!nullToAbsent || c_V38 != null) {
      map['c_V38'] = Variable<int>(c_V38);
    }
    if (!nullToAbsent || c_V47 != null) {
      map['c_V47'] = Variable<int>(c_V47);
    }
    if (!nullToAbsent || c_V48 != null) {
      map['c_V48'] = Variable<int>(c_V48);
    }
    if (!nullToAbsent || c_V57 != null) {
      map['c_V57'] = Variable<int>(c_V57);
    }
    if (!nullToAbsent || c_V58 != null) {
      map['c_V58'] = Variable<int>(c_V58);
    }
    if (!nullToAbsent || c_V67 != null) {
      map['c_V67'] = Variable<int>(c_V67);
    }
    if (!nullToAbsent || c_V68 != null) {
      map['c_V68'] = Variable<int>(c_V68);
    }
    if (!nullToAbsent || c_RU != null) {
      map['c_RU'] = Variable<double>(c_RU);
    }
    if (!nullToAbsent || c_SU != null) {
      map['c_SU'] = Variable<double>(c_SU);
    }
    if (!nullToAbsent || c_SS != null) {
      map['c_SS'] = Variable<double>(c_SS);
    }
    if (!nullToAbsent || c_HI != null) {
      map['c_HI'] = Variable<double>(c_HI);
    }
    if (!nullToAbsent || c_VMfmax != null) {
      map['c_VMfmax'] = Variable<double>(c_VMfmax);
    }
    if (!nullToAbsent || c_VMfmin != null) {
      map['c_VMfmin'] = Variable<double>(c_VMfmin);
    }
    if (!nullToAbsent || c_VFrmax != null) {
      map['c_VFrmax'] = Variable<int>(c_VFrmax);
    }
    if (!nullToAbsent || c_VFrmin != null) {
      map['c_VFrmin'] = Variable<int>(c_VFrmin);
    }
    if (!nullToAbsent || c_Unnamed93 != null) {
      map['c_Unnamed93'] = Variable<int>(c_Unnamed93);
    }
    if (!nullToAbsent || c_Unnamed94 != null) {
      map['c_Unnamed94'] = Variable<String>(c_Unnamed94);
    }
    if (!nullToAbsent || c_VM != null) {
      map['c_VM'] = Variable<String>(c_VM);
    }
    if (!nullToAbsent || c_HI1 != null) {
      map['c_HI1'] = Variable<String>(c_HI1);
    }
    if (!nullToAbsent || c_RU1 != null) {
      map['c_RU1'] = Variable<String>(c_RU1);
    }
    if (!nullToAbsent || c_SU1 != null) {
      map['c_SU1'] = Variable<String>(c_SU1);
    }
    if (!nullToAbsent || c_SS1 != null) {
      map['c_SS1'] = Variable<String>(c_SS1);
    }
    if (!nullToAbsent || c_VS != null) {
      map['c_VS'] = Variable<String>(c_VS);
    }
    if (!nullToAbsent || c_UE != null) {
      map['c_UE'] = Variable<String>(c_UE);
    }
    if (!nullToAbsent || c_BK != null) {
      map['c_BK'] = Variable<String>(c_BK);
    }
    if (!nullToAbsent || c_DK != null) {
      map['c_DK'] = Variable<String>(c_DK);
    }
    return map;
  }

  T4Companion toCompanion(bool nullToAbsent) {
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
      c_RU: c_RU == null && nullToAbsent ? const Value.absent() : Value(c_RU),
      c_SU: c_SU == null && nullToAbsent ? const Value.absent() : Value(c_SU),
      c_SS: c_SS == null && nullToAbsent ? const Value.absent() : Value(c_SS),
      c_HI: c_HI == null && nullToAbsent ? const Value.absent() : Value(c_HI),
      c_VMfmax: c_VMfmax == null && nullToAbsent
          ? const Value.absent()
          : Value(c_VMfmax),
      c_VMfmin: c_VMfmin == null && nullToAbsent
          ? const Value.absent()
          : Value(c_VMfmin),
      c_VFrmax: c_VFrmax == null && nullToAbsent
          ? const Value.absent()
          : Value(c_VFrmax),
      c_VFrmin: c_VFrmin == null && nullToAbsent
          ? const Value.absent()
          : Value(c_VFrmin),
      c_Unnamed93: c_Unnamed93 == null && nullToAbsent
          ? const Value.absent()
          : Value(c_Unnamed93),
      c_Unnamed94: c_Unnamed94 == null && nullToAbsent
          ? const Value.absent()
          : Value(c_Unnamed94),
      c_VM: c_VM == null && nullToAbsent ? const Value.absent() : Value(c_VM),
      c_HI1:
          c_HI1 == null && nullToAbsent ? const Value.absent() : Value(c_HI1),
      c_RU1:
          c_RU1 == null && nullToAbsent ? const Value.absent() : Value(c_RU1),
      c_SU1:
          c_SU1 == null && nullToAbsent ? const Value.absent() : Value(c_SU1),
      c_SS1:
          c_SS1 == null && nullToAbsent ? const Value.absent() : Value(c_SS1),
      c_VS: c_VS == null && nullToAbsent ? const Value.absent() : Value(c_VS),
      c_UE: c_UE == null && nullToAbsent ? const Value.absent() : Value(c_UE),
      c_BK: c_BK == null && nullToAbsent ? const Value.absent() : Value(c_BK),
      c_DK: c_DK == null && nullToAbsent ? const Value.absent() : Value(c_DK),
    );
  }

  factory T4Data.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
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
      c_RU: serializer.fromJson<double>(json['c_RU']),
      c_SU: serializer.fromJson<double>(json['c_SU']),
      c_SS: serializer.fromJson<double>(json['c_SS']),
      c_HI: serializer.fromJson<double>(json['c_HI']),
      c_VMfmax: serializer.fromJson<double>(json['c_VMfmax']),
      c_VMfmin: serializer.fromJson<double>(json['c_VMfmin']),
      c_VFrmax: serializer.fromJson<int>(json['c_VFrmax']),
      c_VFrmin: serializer.fromJson<int>(json['c_VFrmin']),
      c_Unnamed93: serializer.fromJson<int>(json['c_Unnamed93']),
      c_Unnamed94: serializer.fromJson<String>(json['c_Unnamed94']),
      c_VM: serializer.fromJson<String>(json['c_VM']),
      c_HI1: serializer.fromJson<String>(json['c_HI1']),
      c_RU1: serializer.fromJson<String>(json['c_RU1']),
      c_SU1: serializer.fromJson<String>(json['c_SU1']),
      c_SS1: serializer.fromJson<String>(json['c_SS1']),
      c_VS: serializer.fromJson<String>(json['c_VS']),
      c_UE: serializer.fromJson<String>(json['c_UE']),
      c_BK: serializer.fromJson<String>(json['c_BK']),
      c_DK: serializer.fromJson<String>(json['c_DK']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
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
      'c_RU': serializer.toJson<double>(c_RU),
      'c_SU': serializer.toJson<double>(c_SU),
      'c_SS': serializer.toJson<double>(c_SS),
      'c_HI': serializer.toJson<double>(c_HI),
      'c_VMfmax': serializer.toJson<double>(c_VMfmax),
      'c_VMfmin': serializer.toJson<double>(c_VMfmin),
      'c_VFrmax': serializer.toJson<int>(c_VFrmax),
      'c_VFrmin': serializer.toJson<int>(c_VFrmin),
      'c_Unnamed93': serializer.toJson<int>(c_Unnamed93),
      'c_Unnamed94': serializer.toJson<String>(c_Unnamed94),
      'c_VM': serializer.toJson<String>(c_VM),
      'c_HI1': serializer.toJson<String>(c_HI1),
      'c_RU1': serializer.toJson<String>(c_RU1),
      'c_SU1': serializer.toJson<String>(c_SU1),
      'c_SS1': serializer.toJson<String>(c_SS1),
      'c_VS': serializer.toJson<String>(c_VS),
      'c_UE': serializer.toJson<String>(c_UE),
      'c_BK': serializer.toJson<String>(c_BK),
      'c_DK': serializer.toJson<String>(c_DK),
    };
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
          int c_V68,
          double c_RU,
          double c_SU,
          double c_SS,
          double c_HI,
          double c_VMfmax,
          double c_VMfmin,
          int c_VFrmax,
          int c_VFrmin,
          int c_Unnamed93,
          String c_Unnamed94,
          String c_VM,
          String c_HI1,
          String c_RU1,
          String c_SU1,
          String c_SS1,
          String c_VS,
          String c_UE,
          String c_BK,
          String c_DK}) =>
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
        c_RU: c_RU ?? this.c_RU,
        c_SU: c_SU ?? this.c_SU,
        c_SS: c_SS ?? this.c_SS,
        c_HI: c_HI ?? this.c_HI,
        c_VMfmax: c_VMfmax ?? this.c_VMfmax,
        c_VMfmin: c_VMfmin ?? this.c_VMfmin,
        c_VFrmax: c_VFrmax ?? this.c_VFrmax,
        c_VFrmin: c_VFrmin ?? this.c_VFrmin,
        c_Unnamed93: c_Unnamed93 ?? this.c_Unnamed93,
        c_Unnamed94: c_Unnamed94 ?? this.c_Unnamed94,
        c_VM: c_VM ?? this.c_VM,
        c_HI1: c_HI1 ?? this.c_HI1,
        c_RU1: c_RU1 ?? this.c_RU1,
        c_SU1: c_SU1 ?? this.c_SU1,
        c_SS1: c_SS1 ?? this.c_SS1,
        c_VS: c_VS ?? this.c_VS,
        c_UE: c_UE ?? this.c_UE,
        c_BK: c_BK ?? this.c_BK,
        c_DK: c_DK ?? this.c_DK,
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
          ..write('c_V68: $c_V68, ')
          ..write('c_RU: $c_RU, ')
          ..write('c_SU: $c_SU, ')
          ..write('c_SS: $c_SS, ')
          ..write('c_HI: $c_HI, ')
          ..write('c_VMfmax: $c_VMfmax, ')
          ..write('c_VMfmin: $c_VMfmin, ')
          ..write('c_VFrmax: $c_VFrmax, ')
          ..write('c_VFrmin: $c_VFrmin, ')
          ..write('c_Unnamed93: $c_Unnamed93, ')
          ..write('c_Unnamed94: $c_Unnamed94, ')
          ..write('c_VM: $c_VM, ')
          ..write('c_HI1: $c_HI1, ')
          ..write('c_RU1: $c_RU1, ')
          ..write('c_SU1: $c_SU1, ')
          ..write('c_SS1: $c_SS1, ')
          ..write('c_VS: $c_VS, ')
          ..write('c_UE: $c_UE, ')
          ..write('c_BK: $c_BK, ')
          ..write('c_DK: $c_DK')
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
                                                                              $mrjc(c_24.hashCode, $mrjc(c_25.hashCode, $mrjc(c_26.hashCode, $mrjc(c_27.hashCode, $mrjc(c_28.hashCode, $mrjc(c_31.hashCode, $mrjc(c_32.hashCode, $mrjc(c_33.hashCode, $mrjc(c_34.hashCode, $mrjc(c_35.hashCode, $mrjc(c_36.hashCode, $mrjc(c_37.hashCode, $mrjc(c_38.hashCode, $mrjc(c_41.hashCode, $mrjc(c_42.hashCode, $mrjc(c_43.hashCode, $mrjc(c_44.hashCode, $mrjc(c_45.hashCode, $mrjc(c_46.hashCode, $mrjc(c_47.hashCode, $mrjc(c_48.hashCode, $mrjc(c_51.hashCode, $mrjc(c_52.hashCode, $mrjc(c_53.hashCode, $mrjc(c_54.hashCode, $mrjc(c_55.hashCode, $mrjc(c_56.hashCode, $mrjc(c_57.hashCode, $mrjc(c_58.hashCode, $mrjc(c_61.hashCode, $mrjc(c_62.hashCode, $mrjc(c_63.hashCode, $mrjc(c_64.hashCode, $mrjc(c_65.hashCode, $mrjc(c_66.hashCode, $mrjc(c_67.hashCode, $mrjc(c_68.hashCode, $mrjc(c_71.hashCode, $mrjc(c_72.hashCode, $mrjc(c_73.hashCode, $mrjc(c_74.hashCode, $mrjc(c_75.hashCode, $mrjc(c_76.hashCode, $mrjc(c_77.hashCode, $mrjc(c_78.hashCode, $mrjc(c_81.hashCode, $mrjc(c_82.hashCode, $mrjc(c_83.hashCode, $mrjc(c_84.hashCode, $mrjc(c_85.hashCode, $mrjc(c_86.hashCode, $mrjc(c_87.hashCode, $mrjc(c_88.hashCode, $mrjc(c_K3.hashCode, $mrjc(c_K4.hashCode, $mrjc(c_K5.hashCode, $mrjc(c_K6.hashCode, $mrjc(c_K7.hashCode, $mrjc(c_K8.hashCode, $mrjc(c_V37.hashCode, $mrjc(c_V38.hashCode, $mrjc(c_V47.hashCode, $mrjc(c_V48.hashCode, $mrjc(c_V57.hashCode, $mrjc(c_V58.hashCode, $mrjc(c_V67.hashCode, $mrjc(c_V68.hashCode, $mrjc(c_RU.hashCode, $mrjc(c_SU.hashCode, $mrjc(c_SS.hashCode, $mrjc(c_HI.hashCode, $mrjc(c_VMfmax.hashCode, $mrjc(c_VMfmin.hashCode, $mrjc(c_VFrmax.hashCode, $mrjc(c_VFrmin.hashCode, $mrjc(c_Unnamed93.hashCode, $mrjc(c_Unnamed94.hashCode, $mrjc(c_VM.hashCode, $mrjc(c_HI1.hashCode, $mrjc(c_RU1.hashCode, $mrjc(c_SU1.hashCode, $mrjc(c_SS1.hashCode, $mrjc(c_VS.hashCode, $mrjc(c_UE.hashCode, $mrjc(c_BK.hashCode, c_DK.hashCode)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
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
          other.c_V68 == this.c_V68 &&
          other.c_RU == this.c_RU &&
          other.c_SU == this.c_SU &&
          other.c_SS == this.c_SS &&
          other.c_HI == this.c_HI &&
          other.c_VMfmax == this.c_VMfmax &&
          other.c_VMfmin == this.c_VMfmin &&
          other.c_VFrmax == this.c_VFrmax &&
          other.c_VFrmin == this.c_VFrmin &&
          other.c_Unnamed93 == this.c_Unnamed93 &&
          other.c_Unnamed94 == this.c_Unnamed94 &&
          other.c_VM == this.c_VM &&
          other.c_HI1 == this.c_HI1 &&
          other.c_RU1 == this.c_RU1 &&
          other.c_SU1 == this.c_SU1 &&
          other.c_SS1 == this.c_SS1 &&
          other.c_VS == this.c_VS &&
          other.c_UE == this.c_UE &&
          other.c_BK == this.c_BK &&
          other.c_DK == this.c_DK);
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
  final Value<double> c_RU;
  final Value<double> c_SU;
  final Value<double> c_SS;
  final Value<double> c_HI;
  final Value<double> c_VMfmax;
  final Value<double> c_VMfmin;
  final Value<int> c_VFrmax;
  final Value<int> c_VFrmin;
  final Value<int> c_Unnamed93;
  final Value<String> c_Unnamed94;
  final Value<String> c_VM;
  final Value<String> c_HI1;
  final Value<String> c_RU1;
  final Value<String> c_SU1;
  final Value<String> c_SS1;
  final Value<String> c_VS;
  final Value<String> c_UE;
  final Value<String> c_BK;
  final Value<String> c_DK;
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
    this.c_RU = const Value.absent(),
    this.c_SU = const Value.absent(),
    this.c_SS = const Value.absent(),
    this.c_HI = const Value.absent(),
    this.c_VMfmax = const Value.absent(),
    this.c_VMfmin = const Value.absent(),
    this.c_VFrmax = const Value.absent(),
    this.c_VFrmin = const Value.absent(),
    this.c_Unnamed93 = const Value.absent(),
    this.c_Unnamed94 = const Value.absent(),
    this.c_VM = const Value.absent(),
    this.c_HI1 = const Value.absent(),
    this.c_RU1 = const Value.absent(),
    this.c_SU1 = const Value.absent(),
    this.c_SS1 = const Value.absent(),
    this.c_VS = const Value.absent(),
    this.c_UE = const Value.absent(),
    this.c_BK = const Value.absent(),
    this.c_DK = const Value.absent(),
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
    this.c_RU = const Value.absent(),
    this.c_SU = const Value.absent(),
    this.c_SS = const Value.absent(),
    this.c_HI = const Value.absent(),
    this.c_VMfmax = const Value.absent(),
    this.c_VMfmin = const Value.absent(),
    this.c_VFrmax = const Value.absent(),
    this.c_VFrmin = const Value.absent(),
    this.c_Unnamed93 = const Value.absent(),
    this.c_Unnamed94 = const Value.absent(),
    this.c_VM = const Value.absent(),
    this.c_HI1 = const Value.absent(),
    this.c_RU1 = const Value.absent(),
    this.c_SU1 = const Value.absent(),
    this.c_SS1 = const Value.absent(),
    this.c_VS = const Value.absent(),
    this.c_UE = const Value.absent(),
    this.c_BK = const Value.absent(),
    this.c_DK = const Value.absent(),
  })  : c_NyRad = Value(c_NyRad),
        c_Artsgruppe = Value(c_Artsgruppe),
        c_Art = Value(c_Art),
        c_Autor = Value(c_Autor),
        c_NorskNavn = Value(c_NorskNavn),
        c_X = Value(c_X),
        c_Artskode = Value(c_Artskode);
  static Insertable<T4Data> custom({
    Expression<int> index,
    Expression<String> c_NyRad,
    Expression<String> c_Artsgruppe,
    Expression<String> c_Art,
    Expression<String> c_Autor,
    Expression<String> c_NorskNavn,
    Expression<String> c_X,
    Expression<String> c_Artskode,
    Expression<int> c_11,
    Expression<int> c_12,
    Expression<int> c_13,
    Expression<int> c_14,
    Expression<int> c_15,
    Expression<int> c_16,
    Expression<int> c_17,
    Expression<int> c_18,
    Expression<int> c_21,
    Expression<int> c_22,
    Expression<int> c_23,
    Expression<int> c_24,
    Expression<int> c_25,
    Expression<int> c_26,
    Expression<int> c_27,
    Expression<int> c_28,
    Expression<int> c_31,
    Expression<int> c_32,
    Expression<int> c_33,
    Expression<int> c_34,
    Expression<int> c_35,
    Expression<int> c_36,
    Expression<int> c_37,
    Expression<int> c_38,
    Expression<int> c_41,
    Expression<int> c_42,
    Expression<int> c_43,
    Expression<int> c_44,
    Expression<int> c_45,
    Expression<int> c_46,
    Expression<int> c_47,
    Expression<int> c_48,
    Expression<int> c_51,
    Expression<int> c_52,
    Expression<int> c_53,
    Expression<int> c_54,
    Expression<int> c_55,
    Expression<int> c_56,
    Expression<int> c_57,
    Expression<int> c_58,
    Expression<int> c_61,
    Expression<int> c_62,
    Expression<int> c_63,
    Expression<int> c_64,
    Expression<int> c_65,
    Expression<int> c_66,
    Expression<int> c_67,
    Expression<int> c_68,
    Expression<int> c_71,
    Expression<int> c_72,
    Expression<int> c_73,
    Expression<int> c_74,
    Expression<int> c_75,
    Expression<int> c_76,
    Expression<int> c_77,
    Expression<int> c_78,
    Expression<int> c_81,
    Expression<int> c_82,
    Expression<int> c_83,
    Expression<int> c_84,
    Expression<int> c_85,
    Expression<int> c_86,
    Expression<int> c_87,
    Expression<int> c_88,
    Expression<int> c_K3,
    Expression<int> c_K4,
    Expression<int> c_K5,
    Expression<int> c_K6,
    Expression<int> c_K7,
    Expression<int> c_K8,
    Expression<int> c_V37,
    Expression<int> c_V38,
    Expression<int> c_V47,
    Expression<int> c_V48,
    Expression<int> c_V57,
    Expression<int> c_V58,
    Expression<int> c_V67,
    Expression<int> c_V68,
    Expression<double> c_RU,
    Expression<double> c_SU,
    Expression<double> c_SS,
    Expression<double> c_HI,
    Expression<double> c_VMfmax,
    Expression<double> c_VMfmin,
    Expression<int> c_VFrmax,
    Expression<int> c_VFrmin,
    Expression<int> c_Unnamed93,
    Expression<String> c_Unnamed94,
    Expression<String> c_VM,
    Expression<String> c_HI1,
    Expression<String> c_RU1,
    Expression<String> c_SU1,
    Expression<String> c_SS1,
    Expression<String> c_VS,
    Expression<String> c_UE,
    Expression<String> c_BK,
    Expression<String> c_DK,
  }) {
    return RawValuesInsertable({
      if (index != null) 'index': index,
      if (c_NyRad != null) 'c_NyRad': c_NyRad,
      if (c_Artsgruppe != null) 'c_Artsgruppe': c_Artsgruppe,
      if (c_Art != null) 'c_Art': c_Art,
      if (c_Autor != null) 'c_Autor': c_Autor,
      if (c_NorskNavn != null) 'c_NorskNavn': c_NorskNavn,
      if (c_X != null) 'c_X': c_X,
      if (c_Artskode != null) 'c_Artskode': c_Artskode,
      if (c_11 != null) 'c_11': c_11,
      if (c_12 != null) 'c_12': c_12,
      if (c_13 != null) 'c_13': c_13,
      if (c_14 != null) 'c_14': c_14,
      if (c_15 != null) 'c_15': c_15,
      if (c_16 != null) 'c_16': c_16,
      if (c_17 != null) 'c_17': c_17,
      if (c_18 != null) 'c_18': c_18,
      if (c_21 != null) 'c_21': c_21,
      if (c_22 != null) 'c_22': c_22,
      if (c_23 != null) 'c_23': c_23,
      if (c_24 != null) 'c_24': c_24,
      if (c_25 != null) 'c_25': c_25,
      if (c_26 != null) 'c_26': c_26,
      if (c_27 != null) 'c_27': c_27,
      if (c_28 != null) 'c_28': c_28,
      if (c_31 != null) 'c_31': c_31,
      if (c_32 != null) 'c_32': c_32,
      if (c_33 != null) 'c_33': c_33,
      if (c_34 != null) 'c_34': c_34,
      if (c_35 != null) 'c_35': c_35,
      if (c_36 != null) 'c_36': c_36,
      if (c_37 != null) 'c_37': c_37,
      if (c_38 != null) 'c_38': c_38,
      if (c_41 != null) 'c_41': c_41,
      if (c_42 != null) 'c_42': c_42,
      if (c_43 != null) 'c_43': c_43,
      if (c_44 != null) 'c_44': c_44,
      if (c_45 != null) 'c_45': c_45,
      if (c_46 != null) 'c_46': c_46,
      if (c_47 != null) 'c_47': c_47,
      if (c_48 != null) 'c_48': c_48,
      if (c_51 != null) 'c_51': c_51,
      if (c_52 != null) 'c_52': c_52,
      if (c_53 != null) 'c_53': c_53,
      if (c_54 != null) 'c_54': c_54,
      if (c_55 != null) 'c_55': c_55,
      if (c_56 != null) 'c_56': c_56,
      if (c_57 != null) 'c_57': c_57,
      if (c_58 != null) 'c_58': c_58,
      if (c_61 != null) 'c_61': c_61,
      if (c_62 != null) 'c_62': c_62,
      if (c_63 != null) 'c_63': c_63,
      if (c_64 != null) 'c_64': c_64,
      if (c_65 != null) 'c_65': c_65,
      if (c_66 != null) 'c_66': c_66,
      if (c_67 != null) 'c_67': c_67,
      if (c_68 != null) 'c_68': c_68,
      if (c_71 != null) 'c_71': c_71,
      if (c_72 != null) 'c_72': c_72,
      if (c_73 != null) 'c_73': c_73,
      if (c_74 != null) 'c_74': c_74,
      if (c_75 != null) 'c_75': c_75,
      if (c_76 != null) 'c_76': c_76,
      if (c_77 != null) 'c_77': c_77,
      if (c_78 != null) 'c_78': c_78,
      if (c_81 != null) 'c_81': c_81,
      if (c_82 != null) 'c_82': c_82,
      if (c_83 != null) 'c_83': c_83,
      if (c_84 != null) 'c_84': c_84,
      if (c_85 != null) 'c_85': c_85,
      if (c_86 != null) 'c_86': c_86,
      if (c_87 != null) 'c_87': c_87,
      if (c_88 != null) 'c_88': c_88,
      if (c_K3 != null) 'c_K3': c_K3,
      if (c_K4 != null) 'c_K4': c_K4,
      if (c_K5 != null) 'c_K5': c_K5,
      if (c_K6 != null) 'c_K6': c_K6,
      if (c_K7 != null) 'c_K7': c_K7,
      if (c_K8 != null) 'c_K8': c_K8,
      if (c_V37 != null) 'c_V37': c_V37,
      if (c_V38 != null) 'c_V38': c_V38,
      if (c_V47 != null) 'c_V47': c_V47,
      if (c_V48 != null) 'c_V48': c_V48,
      if (c_V57 != null) 'c_V57': c_V57,
      if (c_V58 != null) 'c_V58': c_V58,
      if (c_V67 != null) 'c_V67': c_V67,
      if (c_V68 != null) 'c_V68': c_V68,
      if (c_RU != null) 'c_RU': c_RU,
      if (c_SU != null) 'c_SU': c_SU,
      if (c_SS != null) 'c_SS': c_SS,
      if (c_HI != null) 'c_HI': c_HI,
      if (c_VMfmax != null) 'c_VMfmax': c_VMfmax,
      if (c_VMfmin != null) 'c_VMfmin': c_VMfmin,
      if (c_VFrmax != null) 'c_VFrmax': c_VFrmax,
      if (c_VFrmin != null) 'c_VFrmin': c_VFrmin,
      if (c_Unnamed93 != null) 'c_Unnamed93': c_Unnamed93,
      if (c_Unnamed94 != null) 'c_Unnamed94': c_Unnamed94,
      if (c_VM != null) 'c_VM': c_VM,
      if (c_HI1 != null) 'c_HI1': c_HI1,
      if (c_RU1 != null) 'c_RU1': c_RU1,
      if (c_SU1 != null) 'c_SU1': c_SU1,
      if (c_SS1 != null) 'c_SS1': c_SS1,
      if (c_VS != null) 'c_VS': c_VS,
      if (c_UE != null) 'c_UE': c_UE,
      if (c_BK != null) 'c_BK': c_BK,
      if (c_DK != null) 'c_DK': c_DK,
    });
  }

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
      Value<int> c_V68,
      Value<double> c_RU,
      Value<double> c_SU,
      Value<double> c_SS,
      Value<double> c_HI,
      Value<double> c_VMfmax,
      Value<double> c_VMfmin,
      Value<int> c_VFrmax,
      Value<int> c_VFrmin,
      Value<int> c_Unnamed93,
      Value<String> c_Unnamed94,
      Value<String> c_VM,
      Value<String> c_HI1,
      Value<String> c_RU1,
      Value<String> c_SU1,
      Value<String> c_SS1,
      Value<String> c_VS,
      Value<String> c_UE,
      Value<String> c_BK,
      Value<String> c_DK}) {
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
      c_RU: c_RU ?? this.c_RU,
      c_SU: c_SU ?? this.c_SU,
      c_SS: c_SS ?? this.c_SS,
      c_HI: c_HI ?? this.c_HI,
      c_VMfmax: c_VMfmax ?? this.c_VMfmax,
      c_VMfmin: c_VMfmin ?? this.c_VMfmin,
      c_VFrmax: c_VFrmax ?? this.c_VFrmax,
      c_VFrmin: c_VFrmin ?? this.c_VFrmin,
      c_Unnamed93: c_Unnamed93 ?? this.c_Unnamed93,
      c_Unnamed94: c_Unnamed94 ?? this.c_Unnamed94,
      c_VM: c_VM ?? this.c_VM,
      c_HI1: c_HI1 ?? this.c_HI1,
      c_RU1: c_RU1 ?? this.c_RU1,
      c_SU1: c_SU1 ?? this.c_SU1,
      c_SS1: c_SS1 ?? this.c_SS1,
      c_VS: c_VS ?? this.c_VS,
      c_UE: c_UE ?? this.c_UE,
      c_BK: c_BK ?? this.c_BK,
      c_DK: c_DK ?? this.c_DK,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (c_NyRad.present) {
      map['c_NyRad'] = Variable<String>(c_NyRad.value);
    }
    if (c_Artsgruppe.present) {
      map['c_Artsgruppe'] = Variable<String>(c_Artsgruppe.value);
    }
    if (c_Art.present) {
      map['c_Art'] = Variable<String>(c_Art.value);
    }
    if (c_Autor.present) {
      map['c_Autor'] = Variable<String>(c_Autor.value);
    }
    if (c_NorskNavn.present) {
      map['c_NorskNavn'] = Variable<String>(c_NorskNavn.value);
    }
    if (c_X.present) {
      map['c_X'] = Variable<String>(c_X.value);
    }
    if (c_Artskode.present) {
      map['c_Artskode'] = Variable<String>(c_Artskode.value);
    }
    if (c_11.present) {
      map['c_11'] = Variable<int>(c_11.value);
    }
    if (c_12.present) {
      map['c_12'] = Variable<int>(c_12.value);
    }
    if (c_13.present) {
      map['c_13'] = Variable<int>(c_13.value);
    }
    if (c_14.present) {
      map['c_14'] = Variable<int>(c_14.value);
    }
    if (c_15.present) {
      map['c_15'] = Variable<int>(c_15.value);
    }
    if (c_16.present) {
      map['c_16'] = Variable<int>(c_16.value);
    }
    if (c_17.present) {
      map['c_17'] = Variable<int>(c_17.value);
    }
    if (c_18.present) {
      map['c_18'] = Variable<int>(c_18.value);
    }
    if (c_21.present) {
      map['c_21'] = Variable<int>(c_21.value);
    }
    if (c_22.present) {
      map['c_22'] = Variable<int>(c_22.value);
    }
    if (c_23.present) {
      map['c_23'] = Variable<int>(c_23.value);
    }
    if (c_24.present) {
      map['c_24'] = Variable<int>(c_24.value);
    }
    if (c_25.present) {
      map['c_25'] = Variable<int>(c_25.value);
    }
    if (c_26.present) {
      map['c_26'] = Variable<int>(c_26.value);
    }
    if (c_27.present) {
      map['c_27'] = Variable<int>(c_27.value);
    }
    if (c_28.present) {
      map['c_28'] = Variable<int>(c_28.value);
    }
    if (c_31.present) {
      map['c_31'] = Variable<int>(c_31.value);
    }
    if (c_32.present) {
      map['c_32'] = Variable<int>(c_32.value);
    }
    if (c_33.present) {
      map['c_33'] = Variable<int>(c_33.value);
    }
    if (c_34.present) {
      map['c_34'] = Variable<int>(c_34.value);
    }
    if (c_35.present) {
      map['c_35'] = Variable<int>(c_35.value);
    }
    if (c_36.present) {
      map['c_36'] = Variable<int>(c_36.value);
    }
    if (c_37.present) {
      map['c_37'] = Variable<int>(c_37.value);
    }
    if (c_38.present) {
      map['c_38'] = Variable<int>(c_38.value);
    }
    if (c_41.present) {
      map['c_41'] = Variable<int>(c_41.value);
    }
    if (c_42.present) {
      map['c_42'] = Variable<int>(c_42.value);
    }
    if (c_43.present) {
      map['c_43'] = Variable<int>(c_43.value);
    }
    if (c_44.present) {
      map['c_44'] = Variable<int>(c_44.value);
    }
    if (c_45.present) {
      map['c_45'] = Variable<int>(c_45.value);
    }
    if (c_46.present) {
      map['c_46'] = Variable<int>(c_46.value);
    }
    if (c_47.present) {
      map['c_47'] = Variable<int>(c_47.value);
    }
    if (c_48.present) {
      map['c_48'] = Variable<int>(c_48.value);
    }
    if (c_51.present) {
      map['c_51'] = Variable<int>(c_51.value);
    }
    if (c_52.present) {
      map['c_52'] = Variable<int>(c_52.value);
    }
    if (c_53.present) {
      map['c_53'] = Variable<int>(c_53.value);
    }
    if (c_54.present) {
      map['c_54'] = Variable<int>(c_54.value);
    }
    if (c_55.present) {
      map['c_55'] = Variable<int>(c_55.value);
    }
    if (c_56.present) {
      map['c_56'] = Variable<int>(c_56.value);
    }
    if (c_57.present) {
      map['c_57'] = Variable<int>(c_57.value);
    }
    if (c_58.present) {
      map['c_58'] = Variable<int>(c_58.value);
    }
    if (c_61.present) {
      map['c_61'] = Variable<int>(c_61.value);
    }
    if (c_62.present) {
      map['c_62'] = Variable<int>(c_62.value);
    }
    if (c_63.present) {
      map['c_63'] = Variable<int>(c_63.value);
    }
    if (c_64.present) {
      map['c_64'] = Variable<int>(c_64.value);
    }
    if (c_65.present) {
      map['c_65'] = Variable<int>(c_65.value);
    }
    if (c_66.present) {
      map['c_66'] = Variable<int>(c_66.value);
    }
    if (c_67.present) {
      map['c_67'] = Variable<int>(c_67.value);
    }
    if (c_68.present) {
      map['c_68'] = Variable<int>(c_68.value);
    }
    if (c_71.present) {
      map['c_71'] = Variable<int>(c_71.value);
    }
    if (c_72.present) {
      map['c_72'] = Variable<int>(c_72.value);
    }
    if (c_73.present) {
      map['c_73'] = Variable<int>(c_73.value);
    }
    if (c_74.present) {
      map['c_74'] = Variable<int>(c_74.value);
    }
    if (c_75.present) {
      map['c_75'] = Variable<int>(c_75.value);
    }
    if (c_76.present) {
      map['c_76'] = Variable<int>(c_76.value);
    }
    if (c_77.present) {
      map['c_77'] = Variable<int>(c_77.value);
    }
    if (c_78.present) {
      map['c_78'] = Variable<int>(c_78.value);
    }
    if (c_81.present) {
      map['c_81'] = Variable<int>(c_81.value);
    }
    if (c_82.present) {
      map['c_82'] = Variable<int>(c_82.value);
    }
    if (c_83.present) {
      map['c_83'] = Variable<int>(c_83.value);
    }
    if (c_84.present) {
      map['c_84'] = Variable<int>(c_84.value);
    }
    if (c_85.present) {
      map['c_85'] = Variable<int>(c_85.value);
    }
    if (c_86.present) {
      map['c_86'] = Variable<int>(c_86.value);
    }
    if (c_87.present) {
      map['c_87'] = Variable<int>(c_87.value);
    }
    if (c_88.present) {
      map['c_88'] = Variable<int>(c_88.value);
    }
    if (c_K3.present) {
      map['c_K3'] = Variable<int>(c_K3.value);
    }
    if (c_K4.present) {
      map['c_K4'] = Variable<int>(c_K4.value);
    }
    if (c_K5.present) {
      map['c_K5'] = Variable<int>(c_K5.value);
    }
    if (c_K6.present) {
      map['c_K6'] = Variable<int>(c_K6.value);
    }
    if (c_K7.present) {
      map['c_K7'] = Variable<int>(c_K7.value);
    }
    if (c_K8.present) {
      map['c_K8'] = Variable<int>(c_K8.value);
    }
    if (c_V37.present) {
      map['c_V37'] = Variable<int>(c_V37.value);
    }
    if (c_V38.present) {
      map['c_V38'] = Variable<int>(c_V38.value);
    }
    if (c_V47.present) {
      map['c_V47'] = Variable<int>(c_V47.value);
    }
    if (c_V48.present) {
      map['c_V48'] = Variable<int>(c_V48.value);
    }
    if (c_V57.present) {
      map['c_V57'] = Variable<int>(c_V57.value);
    }
    if (c_V58.present) {
      map['c_V58'] = Variable<int>(c_V58.value);
    }
    if (c_V67.present) {
      map['c_V67'] = Variable<int>(c_V67.value);
    }
    if (c_V68.present) {
      map['c_V68'] = Variable<int>(c_V68.value);
    }
    if (c_RU.present) {
      map['c_RU'] = Variable<double>(c_RU.value);
    }
    if (c_SU.present) {
      map['c_SU'] = Variable<double>(c_SU.value);
    }
    if (c_SS.present) {
      map['c_SS'] = Variable<double>(c_SS.value);
    }
    if (c_HI.present) {
      map['c_HI'] = Variable<double>(c_HI.value);
    }
    if (c_VMfmax.present) {
      map['c_VMfmax'] = Variable<double>(c_VMfmax.value);
    }
    if (c_VMfmin.present) {
      map['c_VMfmin'] = Variable<double>(c_VMfmin.value);
    }
    if (c_VFrmax.present) {
      map['c_VFrmax'] = Variable<int>(c_VFrmax.value);
    }
    if (c_VFrmin.present) {
      map['c_VFrmin'] = Variable<int>(c_VFrmin.value);
    }
    if (c_Unnamed93.present) {
      map['c_Unnamed93'] = Variable<int>(c_Unnamed93.value);
    }
    if (c_Unnamed94.present) {
      map['c_Unnamed94'] = Variable<String>(c_Unnamed94.value);
    }
    if (c_VM.present) {
      map['c_VM'] = Variable<String>(c_VM.value);
    }
    if (c_HI1.present) {
      map['c_HI1'] = Variable<String>(c_HI1.value);
    }
    if (c_RU1.present) {
      map['c_RU1'] = Variable<String>(c_RU1.value);
    }
    if (c_SU1.present) {
      map['c_SU1'] = Variable<String>(c_SU1.value);
    }
    if (c_SS1.present) {
      map['c_SS1'] = Variable<String>(c_SS1.value);
    }
    if (c_VS.present) {
      map['c_VS'] = Variable<String>(c_VS.value);
    }
    if (c_UE.present) {
      map['c_UE'] = Variable<String>(c_UE.value);
    }
    if (c_BK.present) {
      map['c_BK'] = Variable<String>(c_BK.value);
    }
    if (c_DK.present) {
      map['c_DK'] = Variable<String>(c_DK.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('T4Companion(')
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
          ..write('c_V68: $c_V68, ')
          ..write('c_RU: $c_RU, ')
          ..write('c_SU: $c_SU, ')
          ..write('c_SS: $c_SS, ')
          ..write('c_HI: $c_HI, ')
          ..write('c_VMfmax: $c_VMfmax, ')
          ..write('c_VMfmin: $c_VMfmin, ')
          ..write('c_VFrmax: $c_VFrmax, ')
          ..write('c_VFrmin: $c_VFrmin, ')
          ..write('c_Unnamed93: $c_Unnamed93, ')
          ..write('c_Unnamed94: $c_Unnamed94, ')
          ..write('c_VM: $c_VM, ')
          ..write('c_HI1: $c_HI1, ')
          ..write('c_RU1: $c_RU1, ')
          ..write('c_SU1: $c_SU1, ')
          ..write('c_SS1: $c_SS1, ')
          ..write('c_VS: $c_VS, ')
          ..write('c_UE: $c_UE, ')
          ..write('c_BK: $c_BK, ')
          ..write('c_DK: $c_DK')
          ..write(')'))
        .toString();
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

  final VerificationMeta _c_RUMeta = const VerificationMeta('c_RU');
  GeneratedRealColumn _c_RU;
  @override
  GeneratedRealColumn get c_RU => _c_RU ??= _constructCRU();
  GeneratedRealColumn _constructCRU() {
    return GeneratedRealColumn(
      'c_RU',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_SUMeta = const VerificationMeta('c_SU');
  GeneratedRealColumn _c_SU;
  @override
  GeneratedRealColumn get c_SU => _c_SU ??= _constructCSU();
  GeneratedRealColumn _constructCSU() {
    return GeneratedRealColumn(
      'c_SU',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_SSMeta = const VerificationMeta('c_SS');
  GeneratedRealColumn _c_SS;
  @override
  GeneratedRealColumn get c_SS => _c_SS ??= _constructCSS();
  GeneratedRealColumn _constructCSS() {
    return GeneratedRealColumn(
      'c_SS',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_HIMeta = const VerificationMeta('c_HI');
  GeneratedRealColumn _c_HI;
  @override
  GeneratedRealColumn get c_HI => _c_HI ??= _constructCHI();
  GeneratedRealColumn _constructCHI() {
    return GeneratedRealColumn(
      'c_HI',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_VMfmaxMeta = const VerificationMeta('c_VMfmax');
  GeneratedRealColumn _c_VMfmax;
  @override
  GeneratedRealColumn get c_VMfmax => _c_VMfmax ??= _constructCVMfmax();
  GeneratedRealColumn _constructCVMfmax() {
    return GeneratedRealColumn(
      'c_VMfmax',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_VMfminMeta = const VerificationMeta('c_VMfmin');
  GeneratedRealColumn _c_VMfmin;
  @override
  GeneratedRealColumn get c_VMfmin => _c_VMfmin ??= _constructCVMfmin();
  GeneratedRealColumn _constructCVMfmin() {
    return GeneratedRealColumn(
      'c_VMfmin',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_VFrmaxMeta = const VerificationMeta('c_VFrmax');
  GeneratedIntColumn _c_VFrmax;
  @override
  GeneratedIntColumn get c_VFrmax => _c_VFrmax ??= _constructCVFrmax();
  GeneratedIntColumn _constructCVFrmax() {
    return GeneratedIntColumn(
      'c_VFrmax',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_VFrminMeta = const VerificationMeta('c_VFrmin');
  GeneratedIntColumn _c_VFrmin;
  @override
  GeneratedIntColumn get c_VFrmin => _c_VFrmin ??= _constructCVFrmin();
  GeneratedIntColumn _constructCVFrmin() {
    return GeneratedIntColumn(
      'c_VFrmin',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_Unnamed93Meta =
      const VerificationMeta('c_Unnamed93');
  GeneratedIntColumn _c_Unnamed93;
  @override
  GeneratedIntColumn get c_Unnamed93 => _c_Unnamed93 ??= _constructCUnnamed93();
  GeneratedIntColumn _constructCUnnamed93() {
    return GeneratedIntColumn(
      'c_Unnamed93',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_Unnamed94Meta =
      const VerificationMeta('c_Unnamed94');
  GeneratedTextColumn _c_Unnamed94;
  @override
  GeneratedTextColumn get c_Unnamed94 =>
      _c_Unnamed94 ??= _constructCUnnamed94();
  GeneratedTextColumn _constructCUnnamed94() {
    return GeneratedTextColumn(
      'c_Unnamed94',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_VMMeta = const VerificationMeta('c_VM');
  GeneratedTextColumn _c_VM;
  @override
  GeneratedTextColumn get c_VM => _c_VM ??= _constructCVM();
  GeneratedTextColumn _constructCVM() {
    return GeneratedTextColumn(
      'c_VM',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_HI1Meta = const VerificationMeta('c_HI1');
  GeneratedTextColumn _c_HI1;
  @override
  GeneratedTextColumn get c_HI1 => _c_HI1 ??= _constructCHI1();
  GeneratedTextColumn _constructCHI1() {
    return GeneratedTextColumn(
      'c_HI1',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_RU1Meta = const VerificationMeta('c_RU1');
  GeneratedTextColumn _c_RU1;
  @override
  GeneratedTextColumn get c_RU1 => _c_RU1 ??= _constructCRU1();
  GeneratedTextColumn _constructCRU1() {
    return GeneratedTextColumn(
      'c_RU1',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_SU1Meta = const VerificationMeta('c_SU1');
  GeneratedTextColumn _c_SU1;
  @override
  GeneratedTextColumn get c_SU1 => _c_SU1 ??= _constructCSU1();
  GeneratedTextColumn _constructCSU1() {
    return GeneratedTextColumn(
      'c_SU1',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_SS1Meta = const VerificationMeta('c_SS1');
  GeneratedTextColumn _c_SS1;
  @override
  GeneratedTextColumn get c_SS1 => _c_SS1 ??= _constructCSS1();
  GeneratedTextColumn _constructCSS1() {
    return GeneratedTextColumn(
      'c_SS1',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_VSMeta = const VerificationMeta('c_VS');
  GeneratedTextColumn _c_VS;
  @override
  GeneratedTextColumn get c_VS => _c_VS ??= _constructCVS();
  GeneratedTextColumn _constructCVS() {
    return GeneratedTextColumn(
      'c_VS',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_UEMeta = const VerificationMeta('c_UE');
  GeneratedTextColumn _c_UE;
  @override
  GeneratedTextColumn get c_UE => _c_UE ??= _constructCUE();
  GeneratedTextColumn _constructCUE() {
    return GeneratedTextColumn(
      'c_UE',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_BKMeta = const VerificationMeta('c_BK');
  GeneratedTextColumn _c_BK;
  @override
  GeneratedTextColumn get c_BK => _c_BK ??= _constructCBK();
  GeneratedTextColumn _constructCBK() {
    return GeneratedTextColumn(
      'c_BK',
      $tableName,
      true,
    );
  }

  final VerificationMeta _c_DKMeta = const VerificationMeta('c_DK');
  GeneratedTextColumn _c_DK;
  @override
  GeneratedTextColumn get c_DK => _c_DK ??= _constructCDK();
  GeneratedTextColumn _constructCDK() {
    return GeneratedTextColumn(
      'c_DK',
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
        c_V68,
        c_RU,
        c_SU,
        c_SS,
        c_HI,
        c_VMfmax,
        c_VMfmin,
        c_VFrmax,
        c_VFrmin,
        c_Unnamed93,
        c_Unnamed94,
        c_VM,
        c_HI1,
        c_RU1,
        c_SU1,
        c_SS1,
        c_VS,
        c_UE,
        c_BK,
        c_DK
      ];
  @override
  $T4Table get asDslTable => this;
  @override
  String get $tableName => _alias ?? 't4';
  @override
  final String actualTableName = 't4';
  @override
  VerificationContext validateIntegrity(Insertable<T4Data> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index'], _indexMeta));
    }
    if (data.containsKey('c_NyRad')) {
      context.handle(_c_NyRadMeta,
          c_NyRad.isAcceptableOrUnknown(data['c_NyRad'], _c_NyRadMeta));
    } else if (isInserting) {
      context.missing(_c_NyRadMeta);
    }
    if (data.containsKey('c_Artsgruppe')) {
      context.handle(
          _c_ArtsgruppeMeta,
          c_Artsgruppe.isAcceptableOrUnknown(
              data['c_Artsgruppe'], _c_ArtsgruppeMeta));
    } else if (isInserting) {
      context.missing(_c_ArtsgruppeMeta);
    }
    if (data.containsKey('c_Art')) {
      context.handle(
          _c_ArtMeta, c_Art.isAcceptableOrUnknown(data['c_Art'], _c_ArtMeta));
    } else if (isInserting) {
      context.missing(_c_ArtMeta);
    }
    if (data.containsKey('c_Autor')) {
      context.handle(_c_AutorMeta,
          c_Autor.isAcceptableOrUnknown(data['c_Autor'], _c_AutorMeta));
    } else if (isInserting) {
      context.missing(_c_AutorMeta);
    }
    if (data.containsKey('c_NorskNavn')) {
      context.handle(
          _c_NorskNavnMeta,
          c_NorskNavn.isAcceptableOrUnknown(
              data['c_NorskNavn'], _c_NorskNavnMeta));
    } else if (isInserting) {
      context.missing(_c_NorskNavnMeta);
    }
    if (data.containsKey('c_X')) {
      context.handle(
          _c_XMeta, c_X.isAcceptableOrUnknown(data['c_X'], _c_XMeta));
    } else if (isInserting) {
      context.missing(_c_XMeta);
    }
    if (data.containsKey('c_Artskode')) {
      context.handle(
          _c_ArtskodeMeta,
          c_Artskode.isAcceptableOrUnknown(
              data['c_Artskode'], _c_ArtskodeMeta));
    } else if (isInserting) {
      context.missing(_c_ArtskodeMeta);
    }
    if (data.containsKey('c_11')) {
      context.handle(
          _c_11Meta, c_11.isAcceptableOrUnknown(data['c_11'], _c_11Meta));
    }
    if (data.containsKey('c_12')) {
      context.handle(
          _c_12Meta, c_12.isAcceptableOrUnknown(data['c_12'], _c_12Meta));
    }
    if (data.containsKey('c_13')) {
      context.handle(
          _c_13Meta, c_13.isAcceptableOrUnknown(data['c_13'], _c_13Meta));
    }
    if (data.containsKey('c_14')) {
      context.handle(
          _c_14Meta, c_14.isAcceptableOrUnknown(data['c_14'], _c_14Meta));
    }
    if (data.containsKey('c_15')) {
      context.handle(
          _c_15Meta, c_15.isAcceptableOrUnknown(data['c_15'], _c_15Meta));
    }
    if (data.containsKey('c_16')) {
      context.handle(
          _c_16Meta, c_16.isAcceptableOrUnknown(data['c_16'], _c_16Meta));
    }
    if (data.containsKey('c_17')) {
      context.handle(
          _c_17Meta, c_17.isAcceptableOrUnknown(data['c_17'], _c_17Meta));
    }
    if (data.containsKey('c_18')) {
      context.handle(
          _c_18Meta, c_18.isAcceptableOrUnknown(data['c_18'], _c_18Meta));
    }
    if (data.containsKey('c_21')) {
      context.handle(
          _c_21Meta, c_21.isAcceptableOrUnknown(data['c_21'], _c_21Meta));
    }
    if (data.containsKey('c_22')) {
      context.handle(
          _c_22Meta, c_22.isAcceptableOrUnknown(data['c_22'], _c_22Meta));
    }
    if (data.containsKey('c_23')) {
      context.handle(
          _c_23Meta, c_23.isAcceptableOrUnknown(data['c_23'], _c_23Meta));
    }
    if (data.containsKey('c_24')) {
      context.handle(
          _c_24Meta, c_24.isAcceptableOrUnknown(data['c_24'], _c_24Meta));
    }
    if (data.containsKey('c_25')) {
      context.handle(
          _c_25Meta, c_25.isAcceptableOrUnknown(data['c_25'], _c_25Meta));
    }
    if (data.containsKey('c_26')) {
      context.handle(
          _c_26Meta, c_26.isAcceptableOrUnknown(data['c_26'], _c_26Meta));
    }
    if (data.containsKey('c_27')) {
      context.handle(
          _c_27Meta, c_27.isAcceptableOrUnknown(data['c_27'], _c_27Meta));
    }
    if (data.containsKey('c_28')) {
      context.handle(
          _c_28Meta, c_28.isAcceptableOrUnknown(data['c_28'], _c_28Meta));
    }
    if (data.containsKey('c_31')) {
      context.handle(
          _c_31Meta, c_31.isAcceptableOrUnknown(data['c_31'], _c_31Meta));
    }
    if (data.containsKey('c_32')) {
      context.handle(
          _c_32Meta, c_32.isAcceptableOrUnknown(data['c_32'], _c_32Meta));
    }
    if (data.containsKey('c_33')) {
      context.handle(
          _c_33Meta, c_33.isAcceptableOrUnknown(data['c_33'], _c_33Meta));
    }
    if (data.containsKey('c_34')) {
      context.handle(
          _c_34Meta, c_34.isAcceptableOrUnknown(data['c_34'], _c_34Meta));
    }
    if (data.containsKey('c_35')) {
      context.handle(
          _c_35Meta, c_35.isAcceptableOrUnknown(data['c_35'], _c_35Meta));
    }
    if (data.containsKey('c_36')) {
      context.handle(
          _c_36Meta, c_36.isAcceptableOrUnknown(data['c_36'], _c_36Meta));
    }
    if (data.containsKey('c_37')) {
      context.handle(
          _c_37Meta, c_37.isAcceptableOrUnknown(data['c_37'], _c_37Meta));
    }
    if (data.containsKey('c_38')) {
      context.handle(
          _c_38Meta, c_38.isAcceptableOrUnknown(data['c_38'], _c_38Meta));
    }
    if (data.containsKey('c_41')) {
      context.handle(
          _c_41Meta, c_41.isAcceptableOrUnknown(data['c_41'], _c_41Meta));
    }
    if (data.containsKey('c_42')) {
      context.handle(
          _c_42Meta, c_42.isAcceptableOrUnknown(data['c_42'], _c_42Meta));
    }
    if (data.containsKey('c_43')) {
      context.handle(
          _c_43Meta, c_43.isAcceptableOrUnknown(data['c_43'], _c_43Meta));
    }
    if (data.containsKey('c_44')) {
      context.handle(
          _c_44Meta, c_44.isAcceptableOrUnknown(data['c_44'], _c_44Meta));
    }
    if (data.containsKey('c_45')) {
      context.handle(
          _c_45Meta, c_45.isAcceptableOrUnknown(data['c_45'], _c_45Meta));
    }
    if (data.containsKey('c_46')) {
      context.handle(
          _c_46Meta, c_46.isAcceptableOrUnknown(data['c_46'], _c_46Meta));
    }
    if (data.containsKey('c_47')) {
      context.handle(
          _c_47Meta, c_47.isAcceptableOrUnknown(data['c_47'], _c_47Meta));
    }
    if (data.containsKey('c_48')) {
      context.handle(
          _c_48Meta, c_48.isAcceptableOrUnknown(data['c_48'], _c_48Meta));
    }
    if (data.containsKey('c_51')) {
      context.handle(
          _c_51Meta, c_51.isAcceptableOrUnknown(data['c_51'], _c_51Meta));
    }
    if (data.containsKey('c_52')) {
      context.handle(
          _c_52Meta, c_52.isAcceptableOrUnknown(data['c_52'], _c_52Meta));
    }
    if (data.containsKey('c_53')) {
      context.handle(
          _c_53Meta, c_53.isAcceptableOrUnknown(data['c_53'], _c_53Meta));
    }
    if (data.containsKey('c_54')) {
      context.handle(
          _c_54Meta, c_54.isAcceptableOrUnknown(data['c_54'], _c_54Meta));
    }
    if (data.containsKey('c_55')) {
      context.handle(
          _c_55Meta, c_55.isAcceptableOrUnknown(data['c_55'], _c_55Meta));
    }
    if (data.containsKey('c_56')) {
      context.handle(
          _c_56Meta, c_56.isAcceptableOrUnknown(data['c_56'], _c_56Meta));
    }
    if (data.containsKey('c_57')) {
      context.handle(
          _c_57Meta, c_57.isAcceptableOrUnknown(data['c_57'], _c_57Meta));
    }
    if (data.containsKey('c_58')) {
      context.handle(
          _c_58Meta, c_58.isAcceptableOrUnknown(data['c_58'], _c_58Meta));
    }
    if (data.containsKey('c_61')) {
      context.handle(
          _c_61Meta, c_61.isAcceptableOrUnknown(data['c_61'], _c_61Meta));
    }
    if (data.containsKey('c_62')) {
      context.handle(
          _c_62Meta, c_62.isAcceptableOrUnknown(data['c_62'], _c_62Meta));
    }
    if (data.containsKey('c_63')) {
      context.handle(
          _c_63Meta, c_63.isAcceptableOrUnknown(data['c_63'], _c_63Meta));
    }
    if (data.containsKey('c_64')) {
      context.handle(
          _c_64Meta, c_64.isAcceptableOrUnknown(data['c_64'], _c_64Meta));
    }
    if (data.containsKey('c_65')) {
      context.handle(
          _c_65Meta, c_65.isAcceptableOrUnknown(data['c_65'], _c_65Meta));
    }
    if (data.containsKey('c_66')) {
      context.handle(
          _c_66Meta, c_66.isAcceptableOrUnknown(data['c_66'], _c_66Meta));
    }
    if (data.containsKey('c_67')) {
      context.handle(
          _c_67Meta, c_67.isAcceptableOrUnknown(data['c_67'], _c_67Meta));
    }
    if (data.containsKey('c_68')) {
      context.handle(
          _c_68Meta, c_68.isAcceptableOrUnknown(data['c_68'], _c_68Meta));
    }
    if (data.containsKey('c_71')) {
      context.handle(
          _c_71Meta, c_71.isAcceptableOrUnknown(data['c_71'], _c_71Meta));
    }
    if (data.containsKey('c_72')) {
      context.handle(
          _c_72Meta, c_72.isAcceptableOrUnknown(data['c_72'], _c_72Meta));
    }
    if (data.containsKey('c_73')) {
      context.handle(
          _c_73Meta, c_73.isAcceptableOrUnknown(data['c_73'], _c_73Meta));
    }
    if (data.containsKey('c_74')) {
      context.handle(
          _c_74Meta, c_74.isAcceptableOrUnknown(data['c_74'], _c_74Meta));
    }
    if (data.containsKey('c_75')) {
      context.handle(
          _c_75Meta, c_75.isAcceptableOrUnknown(data['c_75'], _c_75Meta));
    }
    if (data.containsKey('c_76')) {
      context.handle(
          _c_76Meta, c_76.isAcceptableOrUnknown(data['c_76'], _c_76Meta));
    }
    if (data.containsKey('c_77')) {
      context.handle(
          _c_77Meta, c_77.isAcceptableOrUnknown(data['c_77'], _c_77Meta));
    }
    if (data.containsKey('c_78')) {
      context.handle(
          _c_78Meta, c_78.isAcceptableOrUnknown(data['c_78'], _c_78Meta));
    }
    if (data.containsKey('c_81')) {
      context.handle(
          _c_81Meta, c_81.isAcceptableOrUnknown(data['c_81'], _c_81Meta));
    }
    if (data.containsKey('c_82')) {
      context.handle(
          _c_82Meta, c_82.isAcceptableOrUnknown(data['c_82'], _c_82Meta));
    }
    if (data.containsKey('c_83')) {
      context.handle(
          _c_83Meta, c_83.isAcceptableOrUnknown(data['c_83'], _c_83Meta));
    }
    if (data.containsKey('c_84')) {
      context.handle(
          _c_84Meta, c_84.isAcceptableOrUnknown(data['c_84'], _c_84Meta));
    }
    if (data.containsKey('c_85')) {
      context.handle(
          _c_85Meta, c_85.isAcceptableOrUnknown(data['c_85'], _c_85Meta));
    }
    if (data.containsKey('c_86')) {
      context.handle(
          _c_86Meta, c_86.isAcceptableOrUnknown(data['c_86'], _c_86Meta));
    }
    if (data.containsKey('c_87')) {
      context.handle(
          _c_87Meta, c_87.isAcceptableOrUnknown(data['c_87'], _c_87Meta));
    }
    if (data.containsKey('c_88')) {
      context.handle(
          _c_88Meta, c_88.isAcceptableOrUnknown(data['c_88'], _c_88Meta));
    }
    if (data.containsKey('c_K3')) {
      context.handle(
          _c_K3Meta, c_K3.isAcceptableOrUnknown(data['c_K3'], _c_K3Meta));
    }
    if (data.containsKey('c_K4')) {
      context.handle(
          _c_K4Meta, c_K4.isAcceptableOrUnknown(data['c_K4'], _c_K4Meta));
    }
    if (data.containsKey('c_K5')) {
      context.handle(
          _c_K5Meta, c_K5.isAcceptableOrUnknown(data['c_K5'], _c_K5Meta));
    }
    if (data.containsKey('c_K6')) {
      context.handle(
          _c_K6Meta, c_K6.isAcceptableOrUnknown(data['c_K6'], _c_K6Meta));
    }
    if (data.containsKey('c_K7')) {
      context.handle(
          _c_K7Meta, c_K7.isAcceptableOrUnknown(data['c_K7'], _c_K7Meta));
    }
    if (data.containsKey('c_K8')) {
      context.handle(
          _c_K8Meta, c_K8.isAcceptableOrUnknown(data['c_K8'], _c_K8Meta));
    }
    if (data.containsKey('c_V37')) {
      context.handle(
          _c_V37Meta, c_V37.isAcceptableOrUnknown(data['c_V37'], _c_V37Meta));
    }
    if (data.containsKey('c_V38')) {
      context.handle(
          _c_V38Meta, c_V38.isAcceptableOrUnknown(data['c_V38'], _c_V38Meta));
    }
    if (data.containsKey('c_V47')) {
      context.handle(
          _c_V47Meta, c_V47.isAcceptableOrUnknown(data['c_V47'], _c_V47Meta));
    }
    if (data.containsKey('c_V48')) {
      context.handle(
          _c_V48Meta, c_V48.isAcceptableOrUnknown(data['c_V48'], _c_V48Meta));
    }
    if (data.containsKey('c_V57')) {
      context.handle(
          _c_V57Meta, c_V57.isAcceptableOrUnknown(data['c_V57'], _c_V57Meta));
    }
    if (data.containsKey('c_V58')) {
      context.handle(
          _c_V58Meta, c_V58.isAcceptableOrUnknown(data['c_V58'], _c_V58Meta));
    }
    if (data.containsKey('c_V67')) {
      context.handle(
          _c_V67Meta, c_V67.isAcceptableOrUnknown(data['c_V67'], _c_V67Meta));
    }
    if (data.containsKey('c_V68')) {
      context.handle(
          _c_V68Meta, c_V68.isAcceptableOrUnknown(data['c_V68'], _c_V68Meta));
    }
    if (data.containsKey('c_RU')) {
      context.handle(
          _c_RUMeta, c_RU.isAcceptableOrUnknown(data['c_RU'], _c_RUMeta));
    }
    if (data.containsKey('c_SU')) {
      context.handle(
          _c_SUMeta, c_SU.isAcceptableOrUnknown(data['c_SU'], _c_SUMeta));
    }
    if (data.containsKey('c_SS')) {
      context.handle(
          _c_SSMeta, c_SS.isAcceptableOrUnknown(data['c_SS'], _c_SSMeta));
    }
    if (data.containsKey('c_HI')) {
      context.handle(
          _c_HIMeta, c_HI.isAcceptableOrUnknown(data['c_HI'], _c_HIMeta));
    }
    if (data.containsKey('c_VMfmax')) {
      context.handle(_c_VMfmaxMeta,
          c_VMfmax.isAcceptableOrUnknown(data['c_VMfmax'], _c_VMfmaxMeta));
    }
    if (data.containsKey('c_VMfmin')) {
      context.handle(_c_VMfminMeta,
          c_VMfmin.isAcceptableOrUnknown(data['c_VMfmin'], _c_VMfminMeta));
    }
    if (data.containsKey('c_VFrmax')) {
      context.handle(_c_VFrmaxMeta,
          c_VFrmax.isAcceptableOrUnknown(data['c_VFrmax'], _c_VFrmaxMeta));
    }
    if (data.containsKey('c_VFrmin')) {
      context.handle(_c_VFrminMeta,
          c_VFrmin.isAcceptableOrUnknown(data['c_VFrmin'], _c_VFrminMeta));
    }
    if (data.containsKey('c_Unnamed93')) {
      context.handle(
          _c_Unnamed93Meta,
          c_Unnamed93.isAcceptableOrUnknown(
              data['c_Unnamed93'], _c_Unnamed93Meta));
    }
    if (data.containsKey('c_Unnamed94')) {
      context.handle(
          _c_Unnamed94Meta,
          c_Unnamed94.isAcceptableOrUnknown(
              data['c_Unnamed94'], _c_Unnamed94Meta));
    }
    if (data.containsKey('c_VM')) {
      context.handle(
          _c_VMMeta, c_VM.isAcceptableOrUnknown(data['c_VM'], _c_VMMeta));
    }
    if (data.containsKey('c_HI1')) {
      context.handle(
          _c_HI1Meta, c_HI1.isAcceptableOrUnknown(data['c_HI1'], _c_HI1Meta));
    }
    if (data.containsKey('c_RU1')) {
      context.handle(
          _c_RU1Meta, c_RU1.isAcceptableOrUnknown(data['c_RU1'], _c_RU1Meta));
    }
    if (data.containsKey('c_SU1')) {
      context.handle(
          _c_SU1Meta, c_SU1.isAcceptableOrUnknown(data['c_SU1'], _c_SU1Meta));
    }
    if (data.containsKey('c_SS1')) {
      context.handle(
          _c_SS1Meta, c_SS1.isAcceptableOrUnknown(data['c_SS1'], _c_SS1Meta));
    }
    if (data.containsKey('c_VS')) {
      context.handle(
          _c_VSMeta, c_VS.isAcceptableOrUnknown(data['c_VS'], _c_VSMeta));
    }
    if (data.containsKey('c_UE')) {
      context.handle(
          _c_UEMeta, c_UE.isAcceptableOrUnknown(data['c_UE'], _c_UEMeta));
    }
    if (data.containsKey('c_BK')) {
      context.handle(
          _c_BKMeta, c_BK.isAcceptableOrUnknown(data['c_BK'], _c_BKMeta));
    }
    if (data.containsKey('c_DK')) {
      context.handle(
          _c_DKMeta, c_DK.isAcceptableOrUnknown(data['c_DK'], _c_DKMeta));
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
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [t4];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$T4DaoMixin on DatabaseAccessor<MyDatabase> {
  $T4Table get t4 => attachedDatabase.t4;
}
