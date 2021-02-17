import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/minor_type_block.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/minor_type_description.dart';

class ScaledMinorTypeWidget extends StatelessWidget {
  final MinorTypeBlock minorTypeBlock;
  const ScaledMinorTypeWidget({Key key, this.minorTypeBlock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (minorTypeBlock.minorTypeScaled == null) {
      return Container();
    } else
      return GestureDetector(
        onTap: () => showDialog(
            context: context,
            builder: (context) => MinorTypeDescription(
                  minorTypes: minorTypeBlock.minorTypeScaled.minorTypes,
                )),
        child: Neumorphic(
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
                    wrapWords: false,
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }
}
