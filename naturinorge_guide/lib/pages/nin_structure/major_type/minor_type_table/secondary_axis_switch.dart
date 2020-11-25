import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:provider/provider.dart';

class SecondaryAxisSwitch extends StatelessWidget {
  const SecondaryAxisSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      padding: EdgeInsets.all(2.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // direction: Axis.vertical,
        children: [
          Expanded(
            flex: 1,
            child: AutoSizeText(Provider.of<MajorTypeProvider>(context)
                .selectedSecondaryAxisSegment
                .standardSegment
                .data
                .id
                .split('-')[1]),
          ),
          Divider(),
          Expanded(
            flex: 3,
            child: AutoSizeText(
              Provider.of<MajorTypeProvider>(context)
                  .selectedSecondaryAxisSegment
                  .standardSegment
                  .name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              // overflowReplacement: AutoSizeText('...'),
            ),
          ),
        ],
      ),
    );
  }
}
