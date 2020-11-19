import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/mapping_scale.dart';

class TableOptions extends StatelessWidget {
  const TableOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Column(
        children: [MappingScaleWidget()],
      ),
    );
  }
}
