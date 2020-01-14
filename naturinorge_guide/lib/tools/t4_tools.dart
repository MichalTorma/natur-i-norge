import 'package:naturinorge_guide/db/db_description.dart';

List<List<int>> getKaUfGradient(T4Data data) {
  //List<int> line = [null, null, null, null, null, null, null, null];
  //List<List<int>> res = [line, line, line, line, line, line, line, line];

  List<List<int>> res = List.generate(8, (i) => List.generate(8, (j) => null));

  // 1
  res[0][0] = data.c_11;
  res[0][1] = data.c_12;
  res[0][2] = data.c_13;
  res[0][3] = data.c_14;
  res[0][4] = data.c_15;
  res[0][5] = data.c_16;
  res[0][6] = data.c_17;
  res[0][7] = data.c_18;
  // 2
  res[1][0] = data.c_21;
  res[1][1] = data.c_22;
  res[1][2] = data.c_23;
  res[1][3] = data.c_24;
  res[1][4] = data.c_25;
  res[1][5] = data.c_26;
  res[1][6] = data.c_27;
  res[1][7] = data.c_28;
  // 3
  res[2][0] = data.c_31;
  res[2][1] = data.c_32;
  res[2][2] = data.c_33;
  res[2][3] = data.c_34;
  res[2][4] = data.c_35;
  res[2][5] = data.c_36;
  res[2][6] = data.c_37;
  res[2][7] = data.c_38;
  // 4
  res[3][0] = data.c_41;
  res[3][1] = data.c_42;
  res[3][2] = data.c_43;
  res[3][3] = data.c_44;
  res[3][4] = data.c_45;
  res[3][5] = data.c_46;
  res[3][6] = data.c_47;
  res[3][7] = data.c_48;
  // 5
  res[4][0] = data.c_51;
  res[4][1] = data.c_52;
  res[4][2] = data.c_53;
  res[4][3] = data.c_54;
  res[4][4] = data.c_55;
  res[4][5] = data.c_56;
  res[4][6] = data.c_57;
  res[4][7] = data.c_58;
  // 6
  res[5][0] = data.c_61;
  res[5][1] = data.c_62;
  res[5][2] = data.c_63;
  res[5][3] = data.c_64;
  res[5][4] = data.c_65;
  res[5][5] = data.c_66;
  res[5][6] = data.c_67;
  res[5][7] = data.c_68;
  // 7
  res[6][0] = data.c_71;
  res[6][1] = data.c_72;
  res[6][2] = data.c_73;
  res[6][3] = data.c_74;
  res[6][4] = data.c_75;
  res[6][5] = data.c_76;
  res[6][6] = data.c_77;
  res[6][7] = data.c_78;
  // 8
  res[7][0] = data.c_81;
  res[7][1] = data.c_82;
  res[7][2] = data.c_83;
  res[7][3] = data.c_84;
  res[7][4] = data.c_85;
  res[7][5] = data.c_86;
  res[7][6] = data.c_87;
  res[7][7] = data.c_88;

  return res;
}
