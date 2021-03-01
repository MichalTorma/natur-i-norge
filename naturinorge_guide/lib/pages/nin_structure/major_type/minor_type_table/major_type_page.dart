import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_description.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_description_landscape.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/other/loading.dart';
import 'package:provider/provider.dart';

class MajorTypePage extends StatelessWidget {
  final Detailed<NinMajorTypeData> majorType;
  const MajorTypePage({Key key, @required this.majorType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var majorType = Provider.of<NinStructureProvider>(
    //   context,
    // ).selectedMajorType;
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          '${majorType.data.id} ${majorType.name}',
          // style: Theme.of(context).textTheme.headline3,
        ),
        bottom: LoadingWidget(),
        actions: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () => Navigator.of(context)
                  .popUntil((route) => !route.navigator.canPop()))
        ],
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
              ninMajorType: majorType,
            );
          } else {
            return MajorTypeDetailsLandscape(
              ninMajorType: majorType,
            );
          }
        }),
      ),
    );
  }
}
