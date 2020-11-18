import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';

class StandardSegmentWidget extends StatelessWidget {
  final StandardSegmentAdapter standardSegmentAdapter;
  const StandardSegmentWidget({Key key, this.standardSegmentAdapter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Neumorphic(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: AutoSizeText(
              standardSegmentAdapter.standardSegment.name,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
