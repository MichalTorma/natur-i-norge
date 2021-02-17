import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SecondaryAxisOptions extends StatelessWidget {
  const SecondaryAxisOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Widget> body = List<Widget>.empty(growable: true);
    if (Provider.of<MajorTypeProvider>(context).zAxis == null) {
      return Container();
    }
    var body = Provider.of<MajorTypeProvider>(context).zAxis.map((axis) {
      var standarSegments = axis.standardSegments
          .map((e) => ToggleElement(
                foreground: SecondaryToggleText(
                  standardSegmentAdapter: e,
                  fontWeight: FontWeight.w700,
                ),
                background: SecondaryToggleText(
                  standardSegmentAdapter: e,
                  fontWeight: FontWeight.w400,
                ),
              ))
          .toList();
      return Container(
        child: Column(children: [
          Container(
            height: 30,
            child: Center(
                child: Text(
              axis.lecAdapter.lec.name,
              style: Theme.of(context).textTheme.subtitle1,
            )),
          ),
          NeumorphicToggle(
            // height: 100,
            thumb: Neumorphic(),
            children: standarSegments,
            onChanged: (value) =>
                Provider.of<MajorTypeProvider>(context, listen: false)
                    .setSecondaryStandardSegment(axis.standardSegments[value]),
            selectedIndex: axis.standardSegments.indexWhere((e) =>
                e.standardSegment.data.id ==
                Provider.of<MajorTypeProvider>(context)
                    .selectedSecondaryAxisSegments
                    .firstWhere((element) =>
                        element.lec.lec.data.id == axis.lecAdapter.lec.data.id)
                    .standardSegment
                    .data
                    .id),
          )
        ]),
      );
    }).toList();
    return Column(
      children: body,
    );
  }
}

class SecondaryToggleText extends StatelessWidget {
  final FontWeight fontWeight;
  final StandardSegmentAdapter standardSegmentAdapter;
  const SecondaryToggleText({
    Key key,
    @required this.fontWeight,
    @required this.standardSegmentAdapter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = standardSegmentAdapter.standardSegment.name;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            standardSegmentAdapter.standardSegment.data.id.split('-').last,
            style: TextStyle(fontWeight: fontWeight),
          ),
          // if (name != null) Divider(),
          // if (name != null)
          //   Expanded(
          //       child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //     child: AutoSizeText(
          //       name,
          //       textAlign: TextAlign.center,
          //       style: TextStyle(fontWeight: fontWeight),
          //       maxLines: 3,
          //       overflow: TextOverflow.ellipsis,
          //     ),
          //   ))
        ],
      ),
    );
  }
}
