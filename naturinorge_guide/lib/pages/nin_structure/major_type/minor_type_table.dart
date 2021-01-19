import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/axis_label.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/table_body.dart';
import 'package:provider/provider.dart';

class MinorTypeTable extends StatelessWidget {
  const MinorTypeTable({Key key}) : super(key: key);
  static int spacing = 2;

  @override
  Widget build(BuildContext context) {
    if (Provider.of<MajorTypeProvider>(context).isLoading) {
      return LinearProgressIndicator();
    }
    var sidePadding = 2 * (8 + 2) + spacing + 10;
    var labelWidth = 70.0;
    double xSize;
    double ySize;
    // Portrait mode
    if (MediaQuery.of(context).size.width <
        MediaQuery.of(context).size.height) {
      xSize = MediaQuery.of(context).size.width - sidePadding - labelWidth;
      ySize = Provider.of<MajorTypeProvider>(context)
              .yAxis
              .lecAdapter
              .gadElementarySegmentGroups
              .length /
          Provider.of<MajorTypeProvider>(context)
              .yAxis
              .lecAdapter
              .gadElementarySegmentGroups
              .length *
          xSize;
    } else {
      // Landscape mode
      ySize = MediaQuery.of(context).size.height - sidePadding - labelWidth;
      xSize = Provider.of<MajorTypeProvider>(context)
              .xAxis
              .lecAdapter
              .gadElementarySegmentGroups
              .length /
          Provider.of<MajorTypeProvider>(context)
              .xAxis
              .lecAdapter
              .gadElementarySegmentGroups
              .length *
          ySize;
    }
    return Wrap(
      direction: Axis.vertical,
      children: [
        Row(
          children: [
            Container(
              clipBehavior: Clip.none,
              height: ySize,
              width: labelWidth,
              child: Neumorphic(
                child: AxisLabel(
                  axisBlock: Provider.of<MajorTypeProvider>(context).yAxis,
                  orientation: Axis.vertical,
                ),
              ),
            ),
            Container(
              height: ySize,
              width: xSize,
              child: TableBody(),
            )
          ],
        ),
        Row(
          children: [
            Container(
              height: labelWidth,
              width: labelWidth,
              // child: SecondaryAxisSwitch(),
            ),
            Container(
              padding: EdgeInsets.all(spacing.toDouble()),
              height: labelWidth,
              width: xSize,
              child: Neumorphic(
                child: AxisLabel(
                  axisBlock: Provider.of<MajorTypeProvider>(context).xAxis,
                  orientation: Axis.horizontal,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
