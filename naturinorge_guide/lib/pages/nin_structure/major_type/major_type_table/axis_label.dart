import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';

class AxisLabel extends StatelessWidget {
  final AxisBlock axisBlock;
  final Axis orientation;
  const AxisLabel({Key key, this.axisBlock, this.orientation})
      : super(key: key);

  int _getQuaterTurns() {
    if (orientation == Axis.horizontal) {
      return 0;
    } else
      return 1;
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      scrollDirection: orientation, //careful
      primary: false,
      itemCount: axisBlock.standardSegments.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return NeumorphicButton(
            child: RotatedBox(
                quarterTurns: _getQuaterTurns(),
                child: Text(axisBlock.lecAdapter.lec.name)),
          );
        } else
          return NeumorphicButton(
            child: RotatedBox(
              quarterTurns: _getQuaterTurns(),
              child: Text(
                  axisBlock.standardSegments[index - 1].standardSegment.name),
            ),
          );
      },
      staggeredTileBuilder: (index) {
        if (index == 0) {
          return StaggeredTile.count(axisBlock.standardSegments.length, 1);
        } else {
          return StaggeredTile.count(1, 1);
        }
      },
    );
  }
}
