import 'package:flutter/material.dart';
import 'package:naturinorge_guide/db/db_description.dart';
import 'package:naturinorge_guide/details/gradient_data_point.dart';


List<List<GradientDataPoint>> getKaUfGradient(T4Data data) {
  //List<int> line = [null, null, null, null, null, null, null, null];
  //List<List<int>> res = [line, line, line, line, line, line, line, line];

  List<List<GradientDataPoint>> res = List.generate(8, (i) => List.generate(8, (j) => null));
  const Color _color = Colors.yellow;
  // 1
  res[0][0] = GradientDataPoint(data.c_11, _color);
  res[0][1] = GradientDataPoint(data.c_12, _color);
  res[0][2] = GradientDataPoint(data.c_13, _color);
  res[0][3] = GradientDataPoint(data.c_14, _color);
  res[0][4] = GradientDataPoint(data.c_15, _color);
  res[0][5] = GradientDataPoint(data.c_16, _color);
  res[0][6] = GradientDataPoint(data.c_17, _color);
  res[0][7] = GradientDataPoint(data.c_18, _color);
  // 2GradientDataPoint(
  res[1][0] = GradientDataPoint(data.c_21, _color);
  res[1][1] = GradientDataPoint(data.c_22, _color);
  res[1][2] = GradientDataPoint(data.c_23, _color);
  res[1][3] = GradientDataPoint(data.c_24, _color);
  res[1][4] = GradientDataPoint(data.c_25, _color);
  res[1][5] = GradientDataPoint(data.c_26, _color);
  res[1][6] = GradientDataPoint(data.c_27, _color);
  res[1][7] = GradientDataPoint(data.c_28, _color);
  // 3GradientDataPoint(
  res[2][0] = GradientDataPoint(data.c_31, _color);
  res[2][1] = GradientDataPoint(data.c_32, _color);
  res[2][2] = GradientDataPoint(data.c_33, _color);
  res[2][3] = GradientDataPoint(data.c_34, _color);
  res[2][4] = GradientDataPoint(data.c_35, _color);
  res[2][5] = GradientDataPoint(data.c_36, _color);
  res[2][6] = GradientDataPoint(data.c_37, _color);
  res[2][7] = GradientDataPoint(data.c_38, _color);
  // 4GradientDataPoint(
  res[3][0] = GradientDataPoint(data.c_41, _color);
  res[3][1] = GradientDataPoint(data.c_42, _color);
  res[3][2] = GradientDataPoint(data.c_43, _color);
  res[3][3] = GradientDataPoint(data.c_44, _color);
  res[3][4] = GradientDataPoint(data.c_45, _color);
  res[3][5] = GradientDataPoint(data.c_46, _color);
  res[3][6] = GradientDataPoint(data.c_47, _color);
  res[3][7] = GradientDataPoint(data.c_48, _color);
  // 5GradientDataPoint(
  res[4][0] = GradientDataPoint(data.c_51, _color);
  res[4][1] = GradientDataPoint(data.c_52, _color);
  res[4][2] = GradientDataPoint(data.c_53, _color);
  res[4][3] = GradientDataPoint(data.c_54, _color);
  res[4][4] = GradientDataPoint(data.c_55, _color);
  res[4][5] = GradientDataPoint(data.c_56, _color);
  res[4][6] = GradientDataPoint(data.c_57, _color);
  res[4][7] = GradientDataPoint(data.c_58, _color);
  // 6GradientDataPoint(
  res[5][0] = GradientDataPoint(data.c_61, _color);
  res[5][1] = GradientDataPoint(data.c_62, _color);
  res[5][2] = GradientDataPoint(data.c_63, _color);
  res[5][3] = GradientDataPoint(data.c_64, _color);
  res[5][4] = GradientDataPoint(data.c_65, _color);
  res[5][5] = GradientDataPoint(data.c_66, _color);
  res[5][6] = GradientDataPoint(data.c_67, _color);
  res[5][7] = GradientDataPoint(data.c_68, _color);
  // 7GradientDataPoint(
  res[6][0] = GradientDataPoint(data.c_71, _color);
  res[6][1] = GradientDataPoint(data.c_72, _color);
  res[6][2] = GradientDataPoint(data.c_73, _color);
  res[6][3] = GradientDataPoint(data.c_74, _color);
  res[6][4] = GradientDataPoint(data.c_75, _color);
  res[6][5] = GradientDataPoint(data.c_76, _color);
  res[6][6] = GradientDataPoint(data.c_77, _color);
  res[6][7] = GradientDataPoint(data.c_78, _color);
  // 8GradientDataPoint(
  res[7][0] = GradientDataPoint(data.c_81, _color);
  res[7][1] = GradientDataPoint(data.c_82, _color);
  res[7][2] = GradientDataPoint(data.c_83, _color);
  res[7][3] = GradientDataPoint(data.c_84, _color);
  res[7][4] = GradientDataPoint(data.c_85, _color);
  res[7][5] = GradientDataPoint(data.c_86, _color);
  res[7][6] = GradientDataPoint(data.c_87, _color);
  res[7][7] = GradientDataPoint(data.c_88, _color);

  return res;
}

List<List<GradientDataPoint>> getKaUf2Gradient(T4Data data) {
  //List<int> line = [null, null, null, null, null, null, null, null];
  //List<List<int>> res = [line, line, line, line, line, line, line, line];

  List<List<GradientDataPoint>> res = List.generate(8, (i) => List.generate(8, (j) => null));
  const Color _k_color = Colors.green;
  const Color _v_color = Colors.blue;

  res[1][2] = GradientDataPoint(data.c_K3, _k_color);
  res[1][3] = GradientDataPoint(data.c_K4, _k_color);
  res[1][4] = GradientDataPoint(data.c_K5, _k_color);
  res[1][5] = GradientDataPoint(data.c_K6, _k_color);
  res[1][6] = GradientDataPoint(data.c_K7, _k_color);
  res[1][7] = GradientDataPoint(data.c_K8, _k_color);

  res[2][6] = GradientDataPoint(data.c_V37, _v_color);
  res[3][6] = GradientDataPoint(data.c_V47, _v_color);
  res[4][6] = GradientDataPoint(data.c_V57, _v_color);
  res[5][6] = GradientDataPoint(data.c_V67, _v_color);

  res[2][7] = GradientDataPoint(data.c_V38, _v_color);
  res[3][7] = GradientDataPoint(data.c_V48, _v_color);
  res[4][7] = GradientDataPoint(data.c_V58, _v_color);
  res[5][7] = GradientDataPoint(data.c_V68, _v_color);

  return res;
}

List<SignedGradientDataPoint> getUlkmGradient(T4Data data){
  var res = List<SignedGradientDataPoint>.generate(9, (_) => null);
  const Color _pos_color = Colors.green;
  const Color _neg_color = Colors.red;

  res[0] = SignedGradientDataPoint(data.c_VM, _pos_color, _neg_color);
  res[1] = SignedGradientDataPoint(data.c_HI1, _pos_color, _neg_color);
  res[2] = SignedGradientDataPoint(data.c_RU1, _pos_color, _neg_color);
  res[3] = SignedGradientDataPoint(data.c_SU1, _pos_color, _neg_color);
  res[4] = SignedGradientDataPoint(data.c_SS1, _pos_color, _neg_color);
  res[5] = SignedGradientDataPoint(data.c_VS, _pos_color, _neg_color);
  res[6] = SignedGradientDataPoint(data.c_UE, _pos_color, _neg_color);
  res[7] = SignedGradientDataPoint(data.c_BK, _pos_color, _neg_color);
  res[8] = SignedGradientDataPoint(data.c_DK, _pos_color, _neg_color);

  return res;
}