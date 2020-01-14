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
            children: [KaUfGradient(
              grid: kaUfGradient,
            )],
          )
        ],
      ),
    );
  }
}

class KaUfGradient extends StatelessWidget {
  final List<List<int>> grid;
  const KaUfGradient({Key key, this.grid}) : super(key: key);
  static final List<String> hHeaders = ['KA-ab', 'KA-c', 'KA-d', 'KA-e', 'KA-f', 'KA-g', 'KA-h', 'KA-i'];
  static final List<String> vHeaders = ['UF-c', 'UF-c', 'UF-c', 'UF-d', 'UF-e', 'UF-f', 'UF-g', 'UF-h'];
  Widget gridBuilder(BuildContext context, int index) {
    Widget res;
    int y = index % 9;
    int x = 8 - index~/9;
    // empty conrner
    if(x == 0 && y == 0){
      res = Container();
    }
    // horizontal headers
    else if (x == 0){
      res = Text(hHeaders[y-1]);
    }
    // vertical headers
    else if (y == 0){
      res = Text(vHeaders[x-1]);
    }
    // numeric values
    else {
      res = Text(grid[y-1][x-1].toString());
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
