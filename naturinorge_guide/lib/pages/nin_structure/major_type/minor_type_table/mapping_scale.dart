import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:provider/provider.dart';

class MappingScaleWidget extends StatelessWidget {
  const MappingScaleWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: NeumorphicToggle(
        children: Provider.of<MajorTypeProvider>(context)
            .mappingScales
            .map((e) => ToggleElement(
                  background: Center(
                      child: Text(
                    e.name,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
                  foreground: Center(
                      child: Text(
                    e.name,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
                ))
            .toList(),
        thumb: Neumorphic(),
        onChanged: (value) {
          Provider.of<MajorTypeProvider>(context, listen: false)
              .setMappingScale(value);
        },
        selectedIndex: Provider.of<MajorTypeProvider>(context, listen: false)
            .getSelectedMappingIndex,
      ),
    );
  }
}
