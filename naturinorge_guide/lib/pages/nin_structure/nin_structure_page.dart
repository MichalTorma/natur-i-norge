import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/generated/codegen_loader.g.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_description.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_selector.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type_group/major_type_group_description.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'major_type_group/major_type_group_selector.dart';

class StructurePage extends StatefulWidget {
  const StructurePage({Key key}) : super(key: key);

  @override
  _StructurePageState createState() => _StructurePageState();
}

class _StructurePageState extends State<StructurePage> {
  AutoScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToIndex(
        Provider.of<NinStructureProvider>(context, listen: false).scrollIndex));
    return Scaffold(
      // appBar: NeumorphicAppBar(
      //   title: Text(LocaleKeys.structure).tr(),
      // ),
      body: CustomScrollView(controller: controller, slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            AutoScrollTag(
              key: ValueKey(0),
              controller: controller,
              index: 0,
              child: Padding(
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
            ),
            if (Provider.of<NinStructureProvider>(context)
                    .selectedMajorTypeGroup !=
                null)
              AutoScrollTag(
                key: ValueKey(1),
                controller: controller,
                index: 1,
                child: Padding(
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
              ),
            if (Provider.of<NinStructureProvider>(context).selectedMajorType !=
                null)
              AutoScrollTag(
                key: ValueKey(2),
                controller: controller,
                index: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Neumorphic(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MajorTypeDetails(
                        ninMajorType: Provider.of<NinStructureProvider>(context)
                            .selectedMajorType,
                      ),
                    ),
                  ),
                ),
              )
          ]),
        ),
      ]),
    );
  }

  Future _scrollToIndex(int index) async {
    await controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
  }
}
