import 'package:flutter/material.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type_group/major_type_group_selector.dart';

class MajorTypeGroupPage extends StatelessWidget {
  const MajorTypeGroupPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            MajorTypeGroupSelector(),
          ],
        ),
      ),
    );
  }
}
