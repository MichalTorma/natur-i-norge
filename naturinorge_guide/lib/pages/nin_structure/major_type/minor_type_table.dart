import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_table/axis_label.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

class MinorTypeTable extends StatelessWidget {
  const MinorTypeTable({Key key}) : super(key: key);
  static int spacing = 2;

  @override
  Widget build(BuildContext context) {
    if (Provider.of<MajorTypeProvider>(context).isLoading) {
      return Container();
    }
    var sidePadding = 2 * (8 + 2) + spacing + 10;
    var labelWidth = 70.0;
    var xSize = MediaQuery.of(context).size.width - sidePadding - labelWidth;
    var ySize = Provider.of<MajorTypeProvider>(context)
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
    return Column(
      children: [
        Row(
          children: [
            Container(
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
              color: Colors.red,
              width: xSize,
              height: ySize,
            )
          ],
        ),
        Row(
          children: [
            Container(
              height: labelWidth,
              width: labelWidth,
            ),
            Container(
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
