import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

class MajorTypeGroupButton extends StatefulWidget {
  MajorTypeGroupButton({Key key, this.ninMajorTypeGroup}) : super(key: key);

  final Detailed<NinMajorTypeGroupData> ninMajorTypeGroup;

  @override
  _MajorTypeGroupButtonState createState() => _MajorTypeGroupButtonState();
}

class _MajorTypeGroupButtonState extends State<MajorTypeGroupButton> {
  var _shape = NeumorphicShape.convex;
  Color _bgColor;
  _initialize(BuildContext context) {
    var selected =
        Provider.of<NinStructureProvider>(context).selectedMajorTypeGroup;

    if (selected != null &&
        selected.data.id == widget.ninMajorTypeGroup.data.id) {
      _shape = NeumorphicShape.concave;
      _bgColor = NeumorphicTheme.of(context).current.accentColor;
    } else {
      _shape = NeumorphicShape.convex;
      _bgColor = NeumorphicTheme.of(context).current.baseColor;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Center(
                child: Text(
              widget.ninMajorTypeGroup.data.id,
              style: Theme.of(context).textTheme.headline6,
            )),
          ),
          Flexible(
              fit: FlexFit.tight,
              child: AutoSizeText(
                widget.ninMajorTypeGroup.name,
                maxLines: 2,
                softWrap: true,
                textAlign: TextAlign.center,
              ))
        ],
      ),
      onPressed: () {
        Provider.of<NinStructureProvider>(context, listen: false)
            .setSelectedMajorTypeGroup(widget.ninMajorTypeGroup);
      },
    );
  }
}
