import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
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
    return Container();
  }
}
