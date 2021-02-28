import 'package:flutter/material.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_button.dart';

class LecDetailPage extends StatelessWidget {
  final LecAdapter lec;
  const LecDetailPage({Key key, this.lec}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var body = List<Widget>.empty(growable: true);

    body.add(Text(
      lec.detailedLec.name ?? '',
      style: Theme.of(context).textTheme.headline2,
      textAlign: TextAlign.center,
    ));
    body.add(Text(lec.detailedLec.description ?? '<<TBF>>'));
    if (lec.detailedLec.other != null) {
      lec.detailedLec.other.forEach((key, value) {
        body.add(Text(
          key,
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ));
      });
      body.add(Divider());
      body.add(ElementarySegmentsWidget(
        elementarySegments: lec.elementarySegments,
      ));
      body.add(Divider());
      body.add(GridView.extent(
        primary: false,
        shrinkWrap: true,
        maxCrossAxisExtent: 200,
        childAspectRatio: 2,
        clipBehavior: Clip.none,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: lec.majorTypes
            .map((e) => MajorTypeButton(
                  ninMajorType: e,
                ))
            .toList(),
      ));
    }
    // body.addAll(lec.detailedLec.other.((key, value) => Column()).toList());
    return Scaffold(
      appBar: AppBar(
        title: Text('${lec.lec.id} - ${lec.detailedLec.name ?? ""}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: body,
        ),
      ),
    );
  }
}

class ElementarySegmentsWidget extends StatelessWidget {
  const ElementarySegmentsWidget({Key key, this.elementarySegments})
      : super(key: key);
  final List<Detailed<NinElementarySegmentGroupDetailData>> elementarySegments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: elementarySegments
            .map((e) => ElementarySegmentWidget(
                  elementarySegmemnt: e,
                ))
            .toList(),
      ),
    );
  }
}

class ElementarySegmentWidget extends StatelessWidget {
  const ElementarySegmentWidget({Key key, this.elementarySegmemnt})
      : super(key: key);
  final Detailed<NinElementarySegmentGroupDetailData> elementarySegmemnt;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Material(
              child: Text(
            elementarySegmemnt.data.value,
            style: Theme.of(context).textTheme.headline4,
          )),
          VerticalDivider(),
          Text(elementarySegmemnt.name ?? ''),
          Expanded(child: Text(elementarySegmemnt.description ?? '')),
        ],
      ),
    );
  }
}
