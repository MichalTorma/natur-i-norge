import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_description.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_description_landscape.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/other/loading.dart';
import 'package:provider/provider.dart';

class MajorTypePage extends StatelessWidget {
  const MajorTypePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mt = Provider.of<NinStructureProvider>(
      context,
    ).selectedMajorType;
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          '${mt.data.id} ${mt.name}',
          // style: Theme.of(context).textTheme.headline3,
        ),
        bottom: LoadingWidget(),
      ),
      // appBar: PreferredSize(
      //     preferredSize: Size(MediaQuery.of(context).size.width, 60),
      //     child: NinAppBar()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
            // stream: null,
            builder: (context, boxConstraints) {
          if (boxConstraints.maxWidth < 800) {
            return MajorTypeDetails(
              ninMajorType: mt,
            );
          } else {
            return MajorTypeDetailsLandscape(
              ninMajorType: mt,
            );
          }
        }),
      ),
    );
  }
}
