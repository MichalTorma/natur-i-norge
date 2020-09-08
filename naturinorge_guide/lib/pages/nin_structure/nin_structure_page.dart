import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/generated/codegen_loader.g.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_selector.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type_group/major_type_group_button.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type_group/major_type_group_description.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'major_type_group/major_type_group_selector.dart';

class StructurePage extends StatelessWidget {
  const StructurePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text(LocaleKeys.structure).tr(),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Neumorphic(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    MajorTypeGroupSelector(),
                    Divider(),
                    MajorTypeGroupDetails()
                  ],
                ),
              ),
            ),
          ),
          // Neumorphic(
          //   child: Column(
          //     children: [MajorTypeSelector()],
          //   ),
          // )
        ],
      ),
    );
  }
}
