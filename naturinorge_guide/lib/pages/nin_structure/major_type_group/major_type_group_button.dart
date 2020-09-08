import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

class MajorTypeGroupButton extends StatefulWidget {
  MajorTypeGroupButton({Key key, this.ninMajorTypeGroupInfoData})
      : super(key: key);

  final NinMajorTypeGroupInfoData ninMajorTypeGroupInfoData;

  @override
  _MajorTypeGroupButtonState createState() => _MajorTypeGroupButtonState();
}

class _MajorTypeGroupButtonState extends State<MajorTypeGroupButton> {
  var _shape = NeumorphicShape.convex;
  Function _onPressed;
  Color _bgColor;
  _initialize(BuildContext context) {
    var selected =
        Provider.of<NinStructureProvider>(context).selectedMajorTypeGroupInfo;

    if (selected == null) {
      _onPressed = () {
        Provider.of<NinStructureProvider>(context, listen: false)
            .setSelectedMajorTypeGroup(widget.ninMajorTypeGroupInfoData);
      };
    }
    if (selected.majorTypeGroupId ==
        widget.ninMajorTypeGroupInfoData.majorTypeGroupId) {
      _shape = NeumorphicShape.flat;
      _onPressed = null;
    } else {
      return ButtonState.AVAILABLE;
    }
  }

  @override
  Widget build(BuildContext context) {
    _initialize(context);
    return NeumorphicButton(
      style: NeumorphicStyle(
        color: _bgColor,
        shape: _shape,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
      ),
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Center(
                child: Text(
              widget.ninMajorTypeGroupInfoData.majorTypeGroupId,
              style: Theme.of(context).textTheme.headline6,
            )),
          ),
          // Center(
          //     child: Text(
          //   widget.ninMajorTypeGroupInfoData.name,
          //   maxLines: 3,
          //   softWrap: true,
          //   textAlign: TextAlign.center,
          // ))
        ],
      ),
      onPressed: _onPressed,
    );
  }
}
