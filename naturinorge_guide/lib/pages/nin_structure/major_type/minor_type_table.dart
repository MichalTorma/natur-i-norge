import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_table/axis_label.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

class MinorTypeTable extends StatelessWidget {
  const MinorTypeTable({Key key}) : super(key: key);

  List<StaggeredTile> _getStageredTiles(BuildContext context) => [
        StaggeredTile.count(
            1,
            Provider.of<MajorTypeProvider>(context)
                .yAxis
                .lecAdapter
                .gadElementarySegmentGroups
                .length),
        StaggeredTile.count(
            Provider.of<MajorTypeProvider>(context)
                .xAxis
                .lecAdapter
                .gadElementarySegmentGroups
                .length,
            Provider.of<MajorTypeProvider>(context)
                .yAxis
                .lecAdapter
                .gadElementarySegmentGroups
                .length),
        StaggeredTile.count(1, 1),
        StaggeredTile.count(
            Provider.of<MajorTypeProvider>(context)
                .xAxis
                .lecAdapter
                .gadElementarySegmentGroups
                .length,
            1)
      ];
  @override
  Widget build(BuildContext context) {
    if (Provider.of<MajorTypeProvider>(context).isLoading) {
      return Container();
    }
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 300),
      child: Center(
        child: Neumorphic(
          child: StaggeredGridView.count(
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: Provider.of<MajorTypeProvider>(context)
                      .xAxis
                      .lecAdapter
                      .gadElementarySegmentGroups
                      .length +
                  1,
              shrinkWrap: false,
              primary: false,
              scrollDirection: Axis.vertical,
              children: [
                Neumorphic(
                  child: AxisLabel(
                    axisBlock: Provider.of<MajorTypeProvider>(context).yAxis,
                    orientation: Axis.vertical,
                  ),
                ),
                Neumorphic(),
                Neumorphic(),
                Neumorphic(
                  child: AxisLabel(
                    axisBlock: Provider.of<MajorTypeProvider>(context).xAxis,
                    orientation: Axis.horizontal,
                  ),
                ),
              ],
              staggeredTiles: _getStageredTiles(context)),
        ),
      ),
    );
  }
}
