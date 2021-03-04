import 'package:flutter/material.dart';
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
      maxCrossAxisExtent: 210,
      childAspectRatio: 1.618,
      clipBehavior: Clip.none,
      // crossAxisSpacing: 12,
      // mainAxisSpacing: 12,
      children: Provider.of<NinStructureProvider>(context)
          .majorTypes
          .map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: MajorTypeButton(
                  ninMajorType: e,
                ),
              ))
          .toList(),
    );
  }
}
