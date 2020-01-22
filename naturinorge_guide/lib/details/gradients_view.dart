import 'package:flutter/material.dart';
import 'package:naturinorge_guide/db/db_description.dart';
import 'package:naturinorge_guide/details/extra_gradient_view.dart';
import 'package:naturinorge_guide/details/gradient_data_point.dart';
import 'package:naturinorge_guide/details/grid_builder.dart';
import 'package:naturinorge_guide/details/headers.dart';
import 'package:naturinorge_guide/tools/t4_tools.dart';

class GradientsView extends StatelessWidget {
  final T4Data data;

  const GradientsView({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kaUfGradient = getKaUfGradient(data);
    var kaUf2Gradient = getKaUf2Gradient(data);
    var uLKMGradient = getUlkmGradient(data);
    return Container(
        child: ListView(
      shrinkWrap: true,
      children: <Widget>[
        Flex(
          direction: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeaderCard(
                text: 'Ka-Uf Gradient',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: KaUfGradient(
                grid: kaUfGradient,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeaderCard(
                text: "Ka-Uf Gradient 2",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: KaUfGradient(
                grid: kaUf2Gradient,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeaderCard(
                text: "uLKM Gradient",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExtraGradientView(
                data: uLKMGradient,
              ),
            )
          ],
        )
      ],
    ));
  }
}

class KaUfGradient extends StatelessWidget {
  final List<List<GradientDataPoint>> grid;
  const KaUfGradient({Key key, this.grid}) : super(key: key);
  static final List<String> _vHeaders = [
    'KA-ab',
    'KA-c',
    'KA-d',
    'KA-e',
    'KA-f',
    'KA-g',
    'KA-h',
    'KA-i'
  ];
  static final List<String> _hHeaders = [
    'UF-c',
    'UF-c',
    'UF-c',
    'UF-d',
    'UF-e',
    'UF-f',
    'UF-g',
    'UF-h'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) =>
          gridBuilder(context, index, _hHeaders, _vHeaders, grid),
      itemCount: 81,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
    );
  }
}
