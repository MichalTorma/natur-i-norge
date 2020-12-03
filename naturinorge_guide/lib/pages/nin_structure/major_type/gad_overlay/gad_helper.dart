import 'dart:ui';

import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/main.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/gad_overlay/specie_adapter.dart';

class GadHelper {
  final Locale locale;
  final NinMajorTypeData majorType;
  List<SpecieAdapter> selectedSprecies = List<SpecieAdapter>();

  GadHelper(this.majorType, this.locale);

  Future addSpecie(NinSpecie specie) async {
    var specieAdapter = SpecieAdapter(specie, locale, majorType);
    await specieAdapter.getRelations();
    if (selectedSprecies.contains(specieAdapter)) {
      print('Specie already added');
      return;
    }
  }
}
