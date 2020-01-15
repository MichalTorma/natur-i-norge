import 'package:flutter/material.dart';
import 'package:naturinorge_guide/db/db_description.dart';
import 'package:naturinorge_guide/tools/t4_tools.dart';

class DetailsView extends StatelessWidget {
  final T4Data data;
  const DetailsView({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kaUfGradient = getKaUfGradient(data);
    return Scaffold(
      appBar: AppBar(
        title: Text(data.c_Art),
      ),
      body: ListView(
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
              HeaderCard()
            ],
          )
        ],
      ),
    );
  }
}

class KaUfGradient extends StatelessWidget {
  final List<List<int>> grid;
  const KaUfGradient({Key key, this.grid}) : super(key: key);
  static final List<String> vHeaders = [
    'KA-ab',
    'KA-c',
    'KA-d',
    'KA-e',
    'KA-f',
    'KA-g',
    'KA-h',
    'KA-i'
  ];
  static final List<String> hHeaders = [
    'UF-c',
    'UF-c',
    'UF-c',
    'UF-d',
    'UF-e',
    'UF-f',
    'UF-g',
    'UF-h'
  ];
  Widget gridBuilder(BuildContext context, int index) {
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
        value: grid[y - 1][x - 1],
        color: Colors.yellow,
      );
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: gridBuilder,
      itemCount: 81,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
    );
  }
}

class NumericalGridValue extends StatelessWidget {
  final int value;
  final Color color;
  const NumericalGridValue({Key key, this.value, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow.withAlpha(42 * value),
      child: Center(
        child: Text(value.toString()),
      ),
    );
  }
}

class HorizontalHeader extends StatelessWidget {
  final String text;
  const HorizontalHeader({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                text,
              ))),
      color: Theme.of(context).primaryColorLight,
    );
  }
}

class VerticalHeader extends StatelessWidget {
  final String text;
  const VerticalHeader({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: Text(
        text,
      )),
      color: Theme.of(context).primaryColorLight,
    );
  }
}

class HeaderCard extends StatelessWidget {
  final String text;
  const HeaderCard({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColorDark,
        child: Center(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline.copyWith(color: Colors.white),
      ),
    )));
  }
}
