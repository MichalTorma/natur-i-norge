import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

class MajorTypeGroupButton extends StatefulWidget {
  MajorTypeGroupButton({Key key, this.ninMajorTypeGroupData}) : super(key: key);
  final NinMajorTypeGroupData ninMajorTypeGroupData;

  @override
  _MajorTypeGroupButtonState createState() => _MajorTypeGroupButtonState();
}

class _MajorTypeGroupButtonState extends State<MajorTypeGroupButton> {
  var _shape = NeumorphicShape.convex;
  Function _onPressed;
  Color _bgColor;
  _initialize(BuildContext context) {
    switch (Provider.of<NinStructureProvider>(context)
        .getMajorTypeGroupState(widget.ninMajorTypeGroupData)) {
      case ButtonState.UNAVAILABLE:
        _shape = NeumorphicShape.flat;
        _onPressed = null;

        break;
      case ButtonState.SELECTED:
        _shape = NeumorphicShape.concave;
        _onPressed = null;

        break;
      case ButtonState.AVAILABLE:
        _onPressed = () {
          Provider.of<NinStructureProvider>(context, listen: false)
              .setSelectedMajorTypeGroup = widget.ninMajorTypeGroupData;
        };

        break;
      default:
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
      child: Text(widget.ninMajorTypeGroupData.id),
      onPressed: _onPressed,
    );
  }
}
