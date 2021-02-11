import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';

class ElementarySegmentWidget extends StatelessWidget {
  final String elementarySegmentGroupId;
  const ElementarySegmentWidget({Key key, this.elementarySegmentGroupId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Neumorphic(
          padding: EdgeInsets.all(2),
          child: Center(
            child: AutoSizeText(elementarySegmentGroupId),
          ),
        ),
      ),
    );
  }
}
