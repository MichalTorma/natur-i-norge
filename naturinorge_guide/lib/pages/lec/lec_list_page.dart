import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';
import 'package:naturinorge_guide/pages/lec/lec_detail_page.dart';
import 'package:naturinorge_guide/pages/lec/lec_provider.dart';
import 'package:provider/provider.dart';

class LecListPage extends StatelessWidget {
  const LecListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<LecProvider>(context, listen: false).initalize();
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.extent(
            primary: false,
            shrinkWrap: true,
            maxCrossAxisExtent: 200,
            childAspectRatio: 2,
            clipBehavior: Clip.none,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: Provider.of<LecProvider>(context)
                .lecAdapters
                .map((e) => LecListTile(
                      lec: e,
                    ))
                .toList(),
          ),
        ));
  }
}

//
class LecListTile extends StatelessWidget {
  const LecListTile({Key key, this.lec}) : super(key: key);
  final LecAdapter lec;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // style: NeumorphicStyle(
      //   shape: _shape,
      //   color: _bgColor,
      // ),
      child: Row(
        children: [
          Text(lec.lec.id),
          VerticalDivider(),
          Flexible(
              child: AutoSizeText(
            lec.detailedLec.name ?? '<<TBF>>',
            maxLines: 4,
            wrapWords: false,
            minFontSize: 8,
          )),
        ],
      ),
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => LecDetailPage(
                lec: lec,
              ))),
    );
  }
}
