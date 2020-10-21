import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_button.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

class MajorTypeSelector extends StatelessWidget {
  const MajorTypeSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      primary: false,
      shrinkWrap: true,
      maxCrossAxisExtent: 200,
      childAspectRatio: 2,
      clipBehavior: Clip.none,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: Provider.of<NinStructureProvider>(context)
          .majorTypes
          .map((e) => MajorTypeButton(
                ninMajorType: e,
              ))
          .toList(),
    );
  }
}
