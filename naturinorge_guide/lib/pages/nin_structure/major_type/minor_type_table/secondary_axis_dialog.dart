import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:provider/provider.dart';

class SecondaryAxisOptions extends StatelessWidget {
  const SecondaryAxisOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Widget> body = List<Widget>.empty(growable: true);
    var body =
        Provider.of<MajorTypeProvider>(context).secondaryAxis.map((axis) {
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
      return Container(
        child: Column(children: [
          Container(
            height: 30,
            child: Center(child: Text(axis.lecAdapter.lec.name)),
          ),
          NeumorphicToggle(
            height: 90,
            thumb: Neumorphic(),
            children: standarSegments,
            onChanged: (value) =>
                Provider.of<MajorTypeProvider>(context, listen: false)
                    .setSecondaryStandardSegment(axis.standardSegments[value]),
            selectedIndex: axis.standardSegments.indexWhere((e) =>
                e.standardSegment.data.id ==
                Provider.of<MajorTypeProvider>(context)
                    .selectedSecondaryAxisSegments
                    .firstWhere((element) =>
                        element.lec.lec.data.id == axis.lecAdapter.lec.data.id)
                    .standardSegment
                    .data
                    .id),
          )
        ]),
      );
    }).toList();
    return Neumorphic(
        child: Column(
      children: body,
    ));
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
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AutoSizeText(
            standardSegmentAdapter.standardSegment.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: fontWeight),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ))
      ],
    );
  }
}
