import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/minor_type_block.dart';

class ScaledMinorTypeWidgetWidget extends StatelessWidget {
  final MinorTypeBlock minorTypeBlock;
  const ScaledMinorTypeWidgetWidget({Key key, this.minorTypeBlock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (minorTypeBlock.minorTypeScaled == null) {
      return Container();
    } else
      return Neumorphic(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: AutoSizeText(
                    minorTypeBlock.minorTypeScaled.minorTypeScaledId),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: AutoSizeText(
                  minorTypeBlock.minorTypeScaled.minorTypes
                      .map((e) => e.minorType.name)
                      .toList()
                      .join('/'),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            )
          ],
        ),
      );
  }
}
