import 'package:flutter/material.dart';
import 'package:naturinorge_guide/details/extra_table_builder.dart';
import 'package:naturinorge_guide/details/gradient_data_point.dart';

class ExtraGradientView extends StatelessWidget {
  final List<SignedGradientDataPoint> data;
  const ExtraGradientView({Key key, this.data}) : super(key: key);

  static List<String> hHeaders = [
    'VM',
    'HI',
    'RU',
    'SU',
    'SS',
    'VS',
    'UE',
    'BK',
    'DK',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 18,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
      itemBuilder: (context, index) => extraTableBuilder(index, hHeaders, data),
    );
  }
}
