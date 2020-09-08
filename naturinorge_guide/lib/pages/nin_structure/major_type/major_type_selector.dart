import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MajorTypeSelector extends StatelessWidget {
  const MajorTypeSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 100,
      children: [
        Container(
          height: 50,
        )
      ],
    );
  }
}
