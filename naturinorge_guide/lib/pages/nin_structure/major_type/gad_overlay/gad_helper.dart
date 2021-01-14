import 'dart:ui';

import 'package:naturinorge_guide/db/db_adapters.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/gad_overlay/specie_adapter.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/axis_block.dart';
import 'package:naturinorge_guide/tools/array_tools.dart';

class GadHelper {
  final Locale locale;
  final NinMajorTypeData majorType;
  final AxisBlock xAxis;
  final AxisBlock yAxis;
  final List<AxisBlock> zAxis;
  // dynamic finalArray;
  List<dynamic> allArrays = List<dynamic>.empty();
  List<int> dims;

  List<SpecieAdapter> selectedSprecies =
      List<SpecieAdapter>.empty(growable: true);

  GadHelper({this.majorType, this.locale, this.xAxis, this.yAxis, this.zAxis}) {
    _generateDims();
  }

  Future addSpecie(NinSpecie specie) async {
    var specieAdapter = SpecieAdapter(specie, locale, majorType);
    await specieAdapter.getRelations();
    if (selectedSprecies.contains(specieAdapter)) {
      print('Specie already added');
      return;
    }
    selectedSprecies.add(specieAdapter);
    var newArray = createArray(dims);
    for (var gadValue in specieAdapter.gadValues) {
      if (gadValue.elementarySegmentCombinations[0].id == 'KA.i/UF.h/KI.0a')
        print(gadValue.elementarySegmentCombinations);
      var xElem = gadValue.elementarySegmentGroupAdapters.firstWhere(
          (element) =>
              xAxis.lecAdapter.gadElementarySegmentGroups.contains(element));
      var xCoor = xAxis.lecAdapter.gadElementarySegmentGroups.indexOf(xElem);

      var yElem = gadValue.elementarySegmentGroupAdapters.firstWhere(
          (element) =>
              yAxis.lecAdapter.gadElementarySegmentGroups.contains(element));
      var yCoor = yAxis.lecAdapter.gadElementarySegmentGroups.indexOf(yElem);

      var coors = List<int>.empty(growable: true);
      for (var axis in zAxis) {
        var zElem = gadValue.elementarySegmentGroupAdapters.firstWhere(
            (element) =>
                axis.lecAdapter.gadElementarySegmentGroups.contains(element));
        var zCoor = axis.lecAdapter.gadElementarySegmentGroups.indexOf(zElem);
        coors.add(zCoor);
      }
      coors.add(xCoor);
      coors.add(yCoor);
      newArray = addToArray(newArray, coors, gadValue.gadValue.valueM7ScaleId);
      print('added');
    }
    allArrays.add(newArray);
  }

  _generateDims() {
    dims = List<int>.empty(growable: true);
    for (var axis in zAxis) {
      dims.add(axis.lecAdapter.gadElementarySegmentGroups.length);
    }
    dims.add(xAxis.lecAdapter.gadElementarySegmentGroups.length);
    dims.add(yAxis.lecAdapter.gadElementarySegmentGroups.length);
  }

  List<List<double>> getArraySliceForSpecie(
      NinSpecie specie, List<StandardSegmentAdapter> selectedZAxisSegments) {
    var specieId = selectedSprecies.indexWhere((element) =>
        element.specie.scientificNameId == specie.scientificNameId);
    dynamic slice = allArrays[specieId];
    for (var selectedStandardSegment in selectedZAxisSegments) {
      slice = slice[selectedStandardSegment.standardSegment.data.order];
    }
    return slice;
  }
}
