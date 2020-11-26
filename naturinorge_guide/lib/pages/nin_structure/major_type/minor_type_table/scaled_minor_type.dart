import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';

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
        child: Center(
          child: AutoSizeText(minorTypeBlock.minorTypeScaled.minorTypeScaledId),
        ),
      );
  }
}
