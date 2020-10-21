import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';

class MajorTypeButton extends StatelessWidget {
  const MajorTypeButton({Key key, this.ninMajorType}) : super(key: key);
  final Detailed<NinMajorTypeData> ninMajorType;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NeumorphicButton(
        style: NeumorphicStyle(shape: NeumorphicShape.convex),
        child: Row(
          children: [
            Text(ninMajorType.data.id),
            VerticalDivider(),
            Flexible(child: AutoSizeText(ninMajorType.name)),
          ],
        ),
      ),
    );
  }
}
