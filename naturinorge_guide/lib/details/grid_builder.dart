import 'package:flutter/material.dart';
import 'package:naturinorge_guide/details/gradient_data_point.dart';
import 'package:naturinorge_guide/details/headers.dart';
import 'package:naturinorge_guide/details/numerical_grid_value_card.dart';

Widget gridBuilder(BuildContext context, int index, List<String> hHeaders,
      List<String> vHeaders, List<List<GradientDataPoint>> grid) {
    Widget res;
    int y = index % 9;
    int x = 8 - index ~/ 9;
    // empty conrner
    if (x == 0 && y == 0) {
      res = Container();
    }
    // horizontal headers
    else if (x == 0) {
      res = HorizontalHeader(text: vHeaders[y - 1]);
    }
    // vertical headers
    else if (y == 0) {
      res = VerticalHeader(text: hHeaders[x - 1]);
    }
    // numeric values
    else {
      res = NumericalGridValue(
        value: grid[y - 1][x - 1].value,
        color: grid[y - 1][x - 1].color,
      );
    }
    return res;
  }