import 'package:flutter/material.dart';
import 'package:naturinorge_guide/db/db_description.dart';

class DetailsView extends StatelessWidget {
  final T4Data data;
  const DetailsView({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.c_Art),
      ),
      body: ListView(children: <Widget>[
        
      ],),
    );
  }
}