import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';

class AxisLabelNameWidget extends StatelessWidget {
  const AxisLabelNameWidget({
    Key key,
    @required this.axisBlock,
  }) : super(key: key);

  final AxisBlock axisBlock;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      // padding: EdgeInsets.all(4),
      child: AutoSizeText(
        '${axisBlock.lecAdapter.lec.data.id} - ${axisBlock.lecAdapter.lec.name}',
        textAlign: TextAlign.center,
      ),
    );
  }
}
