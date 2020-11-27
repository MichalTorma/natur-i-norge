import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';
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
                    foreground: SecondaryToggleText(
                      standardSegmentAdapter: e,
                      fontWeight: FontWeight.w700,
                    ),
                    background: SecondaryToggleText(
                      standardSegmentAdapter: e,
                      fontWeight: FontWeight.w400,
                    ),
                  ))
              .toList();
          return Column(children: [
            Container(
              height: 50,
              child: Center(child: Text(axis.lecAdapter.lec.name)),
            ),
            NeumorphicToggle(
              height: 90,
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

class SecondaryToggleText extends StatelessWidget {
  final FontWeight fontWeight;
  final StandardSegmentAdapter standardSegmentAdapter;
  const SecondaryToggleText({
    Key key,
    @required this.fontWeight,
    @required this.standardSegmentAdapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            standardSegmentAdapter.standardSegment.data.id.split('-').last,
            style: TextStyle(fontWeight: fontWeight),
          ),
        ),
        Divider(),
        Expanded(
            child: AutoSizeText(
          standardSegmentAdapter.standardSegment.name,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: fontWeight),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ))
      ],
    );
  }
}
