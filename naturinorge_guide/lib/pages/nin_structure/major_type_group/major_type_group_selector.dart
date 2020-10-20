import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type_group/major_type_group_button.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

class MajorTypeGroupSelector extends StatelessWidget {
  const MajorTypeGroupSelector({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      shrinkWrap: true,
      maxCrossAxisExtent: 50,
      clipBehavior: Clip.none,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      children: Provider.of<NinStructureProvider>(context)
          .majorTypeGroups
          .map((e) => MajorTypeGroupButton(
                ninMajorTypeGroup: e,
              ))
          .toList(),
    );
  }
}
