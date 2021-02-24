import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/app_bar/nin_app_bar.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_description.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_description_landscape.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_selector.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type_group/major_type_group_description.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

import 'major_type_group/major_type_group_selector.dart';

class StructurePage extends StatefulWidget {
  const StructurePage({Key key}) : super(key: key);

  @override
  _StructurePageState createState() => _StructurePageState();
}

class _StructurePageState extends State<StructurePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: NeumorphicAppBar(
      //   title: Text(LocaleKeys.structure).tr(),
      // ),
      body: Stack(
        children: [
          CustomScrollView(slivers: [
            NinAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Neumorphic(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          MajorTypeGroupSelector(),
                        ],
                      ),
                    ),
                  ),
                ),
                if (Provider.of<NinStructureProvider>(context)
                        .selectedMajorTypeGroup !=
                    null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Neumorphic(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            MajorTypeGroupDetails(),
                            Divider(),
                            MajorTypeSelector(),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (Provider.of<NinStructureProvider>(context)
                        .selectedMajorType !=
                    null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Neumorphic(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LayoutBuilder(
                            // stream: null,
                            builder: (context, boxConstraints) {
                          if (boxConstraints.maxWidth < 800) {
                            return MajorTypeDetails(
                              ninMajorType: Provider.of<NinStructureProvider>(
                                context,
                              ).selectedMajorType,
                            );
                          } else {
                            return MajorTypeDetailsLandscape(
                              ninMajorType: Provider.of<NinStructureProvider>(
                                context,
                              ).selectedMajorType,
                            );
                          }
                        }),
                      ),
                    ),
                  ),
              ]),
            ),
          ]),
          if (Provider.of<MajorTypeProvider>(context).isLoading)
            AbsorbPointer(
              child: Container(
                  color: Colors.black87, child: CircularProgressIndicator()),
            )
        ],
      ),
    );
  }
}
