import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/home_page_lib/home_page_button.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type_group_button.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

class StructurePage extends StatelessWidget {
  const StructurePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text("Structure"),
      ),
      body: ListView(
        children: [
          Neumorphic(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GridView.builder(
                      itemCount: Provider.of<NinStructureProvider>(context)
                          .majorTypeGroups
                          .length,
                      shrinkWrap: true,
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24),
                      itemBuilder: (context, idx) {
                        var majorTypeGroup =
                            Provider.of<NinStructureProvider>(context)
                                .majorTypeGroups[idx];
                        return MajorTypeGroupButton(
                          ninMajorTypeGroupData: majorTypeGroup,
                        );
                      }),
                  Container(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
