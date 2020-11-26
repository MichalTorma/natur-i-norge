import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:provider/provider.dart';

class SecondaryAxisOptions extends StatelessWidget {
  const SecondaryAxisOptions({Key key}) : super(key: key);

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
                        Expanded(
                            child: AutoSizeText(
                          e.standardSegment.name,
                          textAlign: TextAlign.center,
                        ))
                      ],
                    ),
                    background: Column(
                      children: [
                        Text(e.standardSegment.data.id),
                        Divider(),
                        Expanded(
                            child: AutoSizeText(
                          e.standardSegment.name,
                          textAlign: TextAlign.center,
                        ))
                      ],
                    ),
                  ))
              .toList();
          return Column(children: [
            Text(axis.lecAdapter.lec.name),
            NeumorphicToggle(
              height: 80,
              thumb: Neumorphic(),
              children: standarSegments,
              onChanged: (value) => Provider.of<MajorTypeProvider>(context,
                      listen: false)
                  .setSecondaryStandardSegment(axis.standardSegments[value]),
              selectedIndex: axis.standardSegments.indexWhere((e) =>
                  e.standardSegment.data.id ==
                  Provider.of<MajorTypeProvider>(context)
                      .selectedSecondaryAxisSegments
                      .firstWhere((element) =>
                          element.lec.lec.data.id ==
                          axis.lecAdapter.lec.data.id)
                      .standardSegment
                      .data
                      .id),
            )
          ]);
        },
      ),
    );
  }
}
