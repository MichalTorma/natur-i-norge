import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';

class MajorTypeButton extends StatelessWidget {
  const MajorTypeButton({Key key, this.majorTypeInfoData}) : super(key: key);
  final Detailed<NinMajorTypeData> majorTypeInfoData;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NeumorphicButton(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Text(majorTypeInfoData.data.id),
            Text(majorTypeInfoData.name)
          ],
        ),
      ),
    );
  }
}
