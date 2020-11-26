import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:provider/provider.dart';

class SecondaryAxisDialog extends StatelessWidget {
  const SecondaryAxisDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: Provider.of<MajorTypeProvider>(context).secondaryAxis.length,
        itemBuilder: (ctx, index) {
          var axis =
              Provider.of<MajorTypeProvider>(context).secondaryAxis[index];
          var standarSegments = axis.standardSegments
              .map((e) => ToggleElement(
                    foreground: Column(
                      children: [
                        Text(e.standardSegment.data.id),
                        Divider(),
                        Text(e.standardSegment.name)
                      ],
                    ),
                  ))
              .toList();
          return Column(children: [
            Text(axis.lecAdapter.lec.name),
            NeumorphicToggle(
              thumb: Neumorphic(),
              children: standarSegments,
            )
          ]);
        },
      ),
    );
  }
}
