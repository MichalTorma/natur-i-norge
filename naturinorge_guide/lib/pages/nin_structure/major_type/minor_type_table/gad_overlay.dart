import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/gad_cell.dart';
import 'package:provider/provider.dart';

class GadOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var gadArray = Provider.of<MajorTypeProvider>(context).gadArray;
    return Container(
        color: Colors.white70,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: gadArray
              .map((column) => Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: column
                          .map((cell) => GadCell(
                                number: cell,
                              ))
                          .toList()
                          .reversed
                          .toList(),
                    ),
                  ))
              .toList(),
        )
        // child: GridView.builder(
        //     primary: true,
        //     shrinkWrap: false,
        //     physics: NeverScrollableScrollPhysics(),
        //     itemCount: gadArray.length * gadArray.first.length,
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         childAspectRatio: 1, crossAxisCount: gadArray.length),
        //     itemBuilder: (context, index) {
        //       var x = index % gadArray.length;
        //       var y = (index / gadArray.length).floor();
        //       var value = gadArray[x][y];
        //       return Container(
        //         color: Colors.red,
        //         child: Text(value.toString()),
        //       );
        //     }),
        );
  }
}
