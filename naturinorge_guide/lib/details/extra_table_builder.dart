import 'package:dart_numerics/dart_numerics.dart';
import 'package:flutter/material.dart';
import 'package:naturinorge_guide/details/gradient_data_point.dart';
import 'package:naturinorge_guide/details/headers.dart';
import 'package:naturinorge_guide/details/numerical_grid_value_card.dart';

Widget extraTableBuilder(int index, List<String> hHeaders, List<SignedGradientDataPoint> data){
  if (index < hHeaders.length){
    return VerticalHeader(text: hHeaders[index],);
  }
  int value = int.tryParse(data[index - 9].value);
  if (value == null){
    return NumericalGridValue();
  }
  else if(value > 0){
    return NumericalGridValue(
      data: GradientDataPoint(value, data[index - 9].positiveColor),
    );
  }
  return NumericalGridValue(
      data: GradientDataPoint(value, data[index - 9].negativeColor),
    );
}