import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';

class StandardSegmentWidget extends StatelessWidget {
  final StandardSegmentAdapter standardSegmentAdapter;
  const StandardSegmentWidget({Key key, this.standardSegmentAdapter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Neumorphic(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AutoSizeText(
                  standardSegmentAdapter.standardSegment.name,
                  textAlign: TextAlign.center,
                ),
                Divider(),
                AutoSizeText(
                  standardSegmentAdapter.standardSegment.data.id,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
