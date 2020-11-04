import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_table/axis_label.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

class MinorTypeTable extends StatelessWidget {
  const MinorTypeTable({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(crossAxisCount: 2, children: [
      AxisLabel(
        axisBlock: Provider.of<MajorTypeProvider>(context).yAxis,
      ),
      Container(),
      Container(),
      AxisLabel(
        axisBlock: Provider.of<MajorTypeProvider>(context).xAxis,
      ),
    ], staggeredTiles: [
      StaggeredTile.count(
          1,
          Provider.of<MajorTypeProvider>(context)
              .yAxis
              .standardSegments
              .length),
      StaggeredTile.count(
          Provider.of<MajorTypeProvider>(context).xAxis.standardSegments.length,
          Provider.of<MajorTypeProvider>(context)
              .yAxis
              .standardSegments
              .length),
      StaggeredTile.count(1, 1),
      StaggeredTile.count(
          Provider.of<MajorTypeProvider>(context).xAxis.standardSegments.length,
          1),
    ]);
  }
}
