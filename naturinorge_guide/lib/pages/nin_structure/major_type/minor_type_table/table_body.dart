import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/gad_overlay.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/scaled_minor_type.dart';
import 'package:provider/provider.dart';

class TableBody extends StatelessWidget {
  const TableBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Provider.of<MajorTypeProvider>(context).minorTypes == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    var minorTypesBlocks = Provider.of<MajorTypeProvider>(context)
        .minorTypeScaledBlocks
        .map((e) => ScaledMinorTypeWidgetWidget(minorTypeBlock: e))
        .toList();
    var staggeredTiles = Provider.of<MajorTypeProvider>(context)
        .minorTypeScaledBlocks
        .map((e) => StaggeredTile.count(e.width, e.height))
        .toList();
    return Stack(
      children: [
        StaggeredGridView.count(
          addAutomaticKeepAlives: true,
          padding: EdgeInsets.all(4.0),
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          physics: new NeverScrollableScrollPhysics(),
          crossAxisCount: Provider.of<MajorTypeProvider>(context)
              .xAxis
              .standardSegments
              .length,
          reverse: true,
          primary: true,
          // shrinkWrap: true,
          children: minorTypesBlocks,
          staggeredTiles: staggeredTiles,
        ),
        if (Provider.of<MajorTypeProvider>(context).gadArray != null)
          GadOverlay(),
      ],
    );
  }
}
