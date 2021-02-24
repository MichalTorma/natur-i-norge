import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:naturinorge_guide/pages/nin_structure/app_bar/nin_app_bar.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_selector.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type_group/major_type_group_description.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

class MajorTypeSelectorPage extends StatelessWidget {
  const MajorTypeSelectorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mtg = Provider.of<NinStructureProvider>(context).selectedMajorTypeGroup;
    return Scaffold(
        appBar: AppBar(
          title: AutoSizeText('${mtg.data.id} - ${mtg.name}'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              MajorTypeGroupDetails(),
              Divider(),
              MajorTypeSelector(),
            ],
          ),
        ));
  }
}
