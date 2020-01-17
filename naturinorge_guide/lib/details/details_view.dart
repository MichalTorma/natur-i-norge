import 'package:flutter/material.dart';
import 'package:naturinorge_guide/db/db_description.dart';
import 'package:naturinorge_guide/details/gradients_view.dart';
import 'package:naturinorge_guide/details/map_provider.dart';
import 'package:naturinorge_guide/details/map_view.dart';
import 'package:naturinorge_guide/tools/t4_tools.dart';
import 'package:provider/provider.dart';

class DetailsView extends StatelessWidget {
  final T4Data data;
  const DetailsView({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var kaUfGradient = getKaUfGradient(data);
    Provider.of<MapProvider>(context).setSpecies(data.c_Art);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          indicatorColor: Theme.of(context).primaryColorDark,
          unselectedLabelColor: Theme.of(context).primaryColorLight,
          labelColor: Theme.of(context).primaryColorDark,
          tabs: <Widget>[
            Tab(
              text: "Gradients",
            ),
            Tab(
              text: "Map",
            )
          ],
        ),
        appBar: AppBar(
          title: Text(data.c_Art),
          // bottom: PreferredSize(
          //   preferredSize: Provider.of<MapProvider>(context).isLoading ? Size.fromHeight(8) : Size.fromHeight(0),
          //   child: Provider.of<MapProvider>(context).isLoading ? LinearProgressIndicator(value: Provider.of<MapProvider>(context).progress,) : Container(),
          // ),
        ),
        body: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
          GradientsView(kaUfGradient: kaUfGradient),
          Stack(
            children: <Widget>[
              MapView(),
              Provider.of<MapProvider>(context).isLoading ? Center(child: CircularProgressIndicator()) : Container(),
              
              
            ],
          ),
        ]),
      ),
    );
  }
}
