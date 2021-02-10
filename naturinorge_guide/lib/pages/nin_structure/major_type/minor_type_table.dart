import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/axis_label.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/table_body.dart';
import 'package:provider/provider.dart';

class MinorTypeTable extends StatelessWidget {
  const MinorTypeTable({Key key}) : super(key: key);
  static int spacing = 2;
  static int sidePadding = 2 * (8 + 2) + spacing + 10;
  static double labelWidth = 70.0;

  Size getSize(BuildContext context, BoxConstraints boxContrains) {
    if (boxContrains.hasBoundedWidth) {
      var ratio = Provider.of<MajorTypeProvider>(context)
              .xAxis
              .lecAdapter
              .gadElementarySegmentGroups
              .length /
          Provider.of<MajorTypeProvider>(context)
              .yAxis
              .lecAdapter
              .gadElementarySegmentGroups
              .length;
      if (boxContrains.maxWidth > MediaQuery.of(context).size.height) {
        var ySize =
            MediaQuery.of(context).size.height - sidePadding - labelWidth;
        var xSize = ySize * ratio;
        return Size(xSize, ySize);
      } else {
        var xSize = boxContrains.maxWidth - sidePadding - labelWidth;
        var ySize = xSize * ratio;
        return Size(xSize, ySize);
      }
    }
    throw Exception("No width constrain for Table Widget");
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<MajorTypeProvider>(context).isLoading) {
      return LinearProgressIndicator();
    }

    return LayoutBuilder(builder: (context, boxContrains) {
      var size = getSize(context, boxContrains);
      var xSize = size.width;
      var ySize = size.height;
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
    });
  }
}
