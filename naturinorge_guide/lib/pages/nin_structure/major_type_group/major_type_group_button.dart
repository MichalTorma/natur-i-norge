import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

class MajorTypeGroupButton extends StatefulWidget {
  MajorTypeGroupButton({Key? key, this.ninMajorTypeGroup}) : super(key: key);

  final Detailed<NinMajorTypeGroupData>? ninMajorTypeGroup;

  @override
  _MajorTypeGroupButtonState createState() => _MajorTypeGroupButtonState();
}

class _MajorTypeGroupButtonState extends State<MajorTypeGroupButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Center(
                child: Text(
              widget.ninMajorTypeGroup!.data!.id!,
              textScaleFactor: 2,
            )),
          ),
          Flexible(
              fit: FlexFit.tight,
              child: AutoSizeText(
                widget.ninMajorTypeGroup!.name!,
                maxLines: 3,
                wrapWords: false,
                minFontSize: 10,
                textAlign: TextAlign.center,
              ))
        ],
      ),
      onPressed: () {
        Provider.of<NinStructureProvider>(context, listen: false)
            .setSelectedMajorTypeGroup(context, widget.ninMajorTypeGroup);
      },
    );
  }
}
