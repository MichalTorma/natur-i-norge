import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';

class MajorTypeButton extends StatelessWidget {
  const MajorTypeButton({Key key, this.majorTypeInfoData}) : super(key: key);
  final NinMajorTypeInfoData majorTypeInfoData;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NeumorphicButton(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Text(majorTypeInfoData.majorTypeId),
            Text(majorTypeInfoData.name)
          ],
        ),
      ),
    );
  }
}
