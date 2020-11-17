import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_table/axis_label_name.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_table/standard_segment_widget.dart';

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
        flex: ss.elementarySegments.length,
        child: StandardSegmentWidget(
          standardSegmentAdapter: ss,
        ),
      ));
    }

    List<Widget> bodyParts = [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AxisLabelNameWidget(axisBlock: axisBlock),
        ),
      ),
      Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: standardSegmentWidgets,
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
