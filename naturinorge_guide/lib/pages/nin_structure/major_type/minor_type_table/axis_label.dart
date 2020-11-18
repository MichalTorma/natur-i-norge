import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/axis_label_name.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/elementary_segment_widget.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/standard_segment_widget.dart';

class AxisLabel extends StatelessWidget {
  final AxisBlock axisBlock;
  final Axis orientation;
  const AxisLabel(
      {Key key, @required this.axisBlock, @required this.orientation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var standardSegmentWidgets = List<Widget>();
    for (var ss in axisBlock.standardSegments) {
      print(ss.elementarySegments.length);
      standardSegmentWidgets.add(Expanded(
        flex: ss.elementarySegmentGroups.length,
        child: StandardSegmentWidget(
          standardSegmentAdapter: ss,
        ),
      ));
    }

    List<Widget> bodyParts = [
      Expanded(
        flex: 1,
        child: AxisLabelNameWidget(axisBlock: axisBlock),
      ),
      Expanded(
        flex: 1,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: standardSegmentWidgets,
        ),
      ),
      Expanded(
        flex: 1,
        child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: axisBlock.lecAdapter.gadElementarySegmentGroups
                .map((e) => ElementarySegmentWidget(
                      elementarySegmentGroupAdapter: e,
                    ))
                .toList()),
      )
    ];

    if (orientation == Axis.horizontal) {
      bodyParts = bodyParts.reversed.toList();
    }

    var body = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: bodyParts,
    );

    if (orientation == Axis.vertical)
      return RotatedBox(
        quarterTurns: 3,
        child: body,
      );
    else
      return body;
  }
}
