import 'package:flutter/material.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class MappingScaleWidget extends StatelessWidget {
  const MappingScaleWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ToggleSwitch(
        minWidth: 80,
        labels: Provider.of<MajorTypeProvider>(context)
            .mappingScales
            .map(
              (e) => e.name,
            )
            .toList(),
        onToggle: (value) async {
          await Provider.of<MajorTypeProvider>(context, listen: false)
              .setMappingScale(value);
        },
        initialLabelIndex:
            Provider.of<MajorTypeProvider>(context, listen: false)
                .getSelectedMappingIndex,
      ),
    );
  }
}
