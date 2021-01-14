import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/gad_overlay/add_species_btn.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/secondary_axis_dialog.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/table_options.dart';
import 'package:provider/provider.dart';

class MajorTypeDetails extends StatelessWidget {
  const MajorTypeDetails({Key key, @required this.ninMajorType})
      : super(key: key);
  final Detailed<NinMajorTypeData> ninMajorType;

  @override
  Widget build(BuildContext context) {
    // Provider.of<NinStructureProvider>(context).selectedMajorType;
    if (Provider.of<MajorTypeProvider>(context).isLoading) {
      return Container();
    }
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
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TableOptions(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: SecondaryAxisOptions(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: MinorTypeTable(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: AddSpecieButton(),
        )
      ]),
    );
  }
}
