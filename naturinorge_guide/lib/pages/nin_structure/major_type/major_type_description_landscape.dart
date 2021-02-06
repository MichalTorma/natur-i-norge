import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/generated/codegen_loader.g.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/gad_overlay/add_species_btn.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/gad_overlay/selected_species_list.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/secondary_axis_dialog.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/table_options.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:easy_localization/easy_localization.dart';

class MajorTypeDetailsLandscape extends StatelessWidget {
  const MajorTypeDetailsLandscape({Key key, @required this.ninMajorType})
      : super(key: key);
  final Detailed<NinMajorTypeData> ninMajorType;
  static double sidebarWidth = 450.0;
  @override
  Widget build(BuildContext context) {
    // Provider.of<NinStructureProvider>(context).selectedMajorType;
    if (Provider.of<MajorTypeProvider>(context).isLoading) {
      return Container();
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              width: sidebarWidth,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      ninMajorType.name,
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(),
                  ReadMoreText(
                    ninMajorType.description,
                    trimLines: 10,
                    trimMode: TrimMode.Line,
                    trimExpandedText: LocaleKeys.read_mode.tr(),
                    trimCollapsedText: LocaleKeys.show_less.tr(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Divider(),
                  TableOptions(),
                  Divider(),
                  SecondaryAxisOptions(),
                  Divider(),
                  SelectedSpeciesList(),
                  AddSpecieButtons(),
                ],
              )),
          Container(
            // color: Colors.red,
            width: MediaQuery.of(context).size.width - sidebarWidth - 50,
            child: Center(child: MinorTypeTable()),
          )
        ],
      ),

      // child: Row(mainAxisSize: MainAxisSize.min, children: [
      //   Center(
      //     child: Text(
      //       ninMajorType.name,
      //       style: Theme.of(context).textTheme.headline2,
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      //   Divider(),
      //   Text(ninMajorType.description),
      //   Padding(
      //     padding: const EdgeInsets.only(top: 8.0),
      //     child: TableOptions(),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 4.0),
      //     child: SecondaryAxisOptions(),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.only(top: 8.0),
      //     child: Center(child: MinorTypeTable()),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.only(top: 8.0),
      //     child: AddSpecieButtons(),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.only(top: 8.0),
      //     child: SelectedSpeciesList(),
      //   ),
      // ]),
    );
  }
}
