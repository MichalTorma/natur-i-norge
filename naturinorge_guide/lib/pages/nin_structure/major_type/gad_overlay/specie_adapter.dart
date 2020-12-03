import 'dart:ui';

import 'package:naturinorge_guide/db/db_adapters.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/main.dart';

class SpecieAdapter {
  final NinMajorTypeData majorType;
  final Locale locale;
  final NinSpecie specie;
  List<GadValueAdapter> gadValues;
  List<GadmodifierAdpater> gadModifiers;

  SpecieAdapter(this.specie, this.locale, this.majorType);
  Future getRelations() async {
    var gadValuesData =
        await db.getGadValuesBySpeciesId(specie.scientificNameId, majorType.id);
    gadValues = List<GadValueAdapter>();
    for (var gadValueData in gadValuesData) {
      var gadValue = GadValueAdapter(gadValueData, locale);
      await gadValue.getRelations();
      gadValues.add(gadValue);
    }

    // var gadModifiersData
  }
}

class GadValueAdapter {
  final Locale locale;
  final NinGadValueData gadValue;
  List<NinElementarySegmentCombinationData> elementarySegmentCombinations;
  List<ElementarySegmentGroupAdapter> elementarySegmentGroupAdapters;
  GadValueAdapter(this.gadValue, this.locale);

  Future getRelations() async {
    elementarySegmentCombinations = await db
        .getElementarySegmentCombinationsByElementarySegmentCombinationId(
            gadValue.elementarySegmentCombinationId);
    elementarySegmentGroupAdapters = List<ElementarySegmentGroupAdapter>();
    for (var elementarySegmentCombination in elementarySegmentCombinations) {
      var esg = ElementarySegmentGroupAdapter(
          locale, elementarySegmentCombination.elementarySegmentGroupId);
      await esg.getRelations();
      elementarySegmentGroupAdapters.add(esg);
    }
  }
}

class GadmodifierAdpater {
  NinGadModifierData gadValue;
  LecAdapter lecAdapter;
}
