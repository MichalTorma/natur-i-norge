import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';

class AxisLabel extends StatelessWidget {
  final AxisBlock axisBlock;
  final Axis orientation;
  const AxisLabel(
      {Key key, @required this.axisBlock, @required this.orientation})
      : super(key: key);

  int _getQuaterTurns() {
    if (orientation == Axis.horizontal) {
      return 0;
    } else
      return 3;
  }

  Axis _invertAxis(Axis axis) {
    if (axis == Axis.horizontal) {
      return Axis.vertical;
    } else {
      return Axis.horizontal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      scrollDirection: orientation, //careful
      primary: false,
      shrinkWrap: true,
      itemCount: axisBlock.standardSegments.length + 1,
      itemBuilder: (context, index) {
        var res;
        if (index == 0) {
          res = NeumorphicButton(
            child: RotatedBox(
                quarterTurns: _getQuaterTurns(),
                child: Text(axisBlock.lecAdapter.lec.name)),
          );
        } else
          res = NeumorphicButton(
            child: RotatedBox(
              quarterTurns: _getQuaterTurns(),
              child: Text(
                  axisBlock.standardSegments[index - 1].standardSegment.name),
            ),
          );
        return Padding(
          padding: EdgeInsets.all(8),
          child: res,
        );
      },
      staggeredTileBuilder: (index) {
        if (index == 0) {
          return StaggeredTile.count(1, axisBlock.standardSegments.length);
        } else {
          return StaggeredTile.count(1, 1);
        }
      },
    );
  }
}
