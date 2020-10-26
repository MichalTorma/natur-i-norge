import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/pages/nin_structure/nin_structure_provider.dart';
import 'package:provider/provider.dart';

class MajorTypeDetails extends StatelessWidget {
  const MajorTypeDetails({Key key, @required this.ninMajorType})
      : super(key: key);
  final Detailed<NinMajorTypeData> ninMajorType;

  @override
  Widget build(BuildContext context) {
    Provider.of<NinStructureProvider>(context).selectedMajorType;
    return Container(
      child: Column(children: [
        Center(
          child: Text(
            ninMajorType.name,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
        Divider(),
        Text(ninMajorType.description),
      ]),
    );
  }
}
