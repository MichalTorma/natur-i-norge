import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/main.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/gad_overlay/gad_helper.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/gad_overlay/specie_adapter.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/axis_block.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/minor_type_block.dart';
import 'package:naturinorge_guide/tools/array_tools.dart';

class MajorTypeProvider extends ChangeNotifier {
  final Locale locale;

  MajorTypeProvider(this.locale);

  bool _isLoading = true;
  Detailed<NinMajorTypeData> _majorType;
  MajorTypeAdapter _majorTypeAdapter;
  List<AxisBlock> _allAxis = List<AxisBlock>.empty(growable: true);
  // List<AxisBlock> _mainAxis = List<AxisBlock>.empty();
  List<AxisBlock> _secondaryAxis = List<AxisBlock>.empty(growable: true);
  // List<AxisBlock> _supplementaryAxis = List<AxisBlock>.empty();
  List<StandardSegmentAdapter> _selectedZAxisSegments;

  AxisBlock _xAxis;
  AxisBlock _yAxis;
  List<AxisBlock> _zAxis;

  NinMappingScaleData _selectedMappingScale;
  List<NinMappingScaleData> _allMappingScales;

  List<MinorTypeScaledAdapter> _minorTypesScaled;
  dynamic _minorTypesArray;
  List<MinorTypeBlock> _minorTypesScaledBlocks;

  GadHelper _gadHelper;
  List<List<dynamic>> gadArray;

  Future load(Detailed<NinMajorTypeData> majorType) async {
    _isLoading = true;
    notifyListeners();
    _majorType = majorType;
    _majorTypeAdapter = MajorTypeAdapter(majorType, db, locale);
    await _initializeScales();
    await _majorTypeAdapter.getRelations(_selectedMappingScale);
    await _populateAllAxis();
    if (_allAxis.length > 0) {
      _initializeAxis();
      await _initializeMinorTypes();
      _initializeMinorTypesArray();
      _gadHelper = GadHelper(
        locale: locale,
        majorType: _majorType.data,
        xAxis: _xAxis,
        yAxis: _yAxis,
        zAxis: _zAxis,
      );
    } else {
      //TODO remove once DB is complete
      _xAxis = null;
      _yAxis = null;
      _zAxis = null;
      _secondaryAxis = null;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future _initializeScales() async {
    _selectedMappingScale = await db.getMappingScaleById(5000);
    _allMappingScales = await db.getMappingScales();
  }

  _initializeAxis() {
    if (_allAxis.length < 1) {
      throw Exception('allAxis is empty');
    }
    _xAxis = _allAxis.firstWhere((e) => e.lecAdapter.majorTypeLec.axis == 0);
    _yAxis = _allAxis.firstWhere((e) => e.lecAdapter.majorTypeLec.axis == 1);
    _zAxis =
        _allAxis.where((e) => e.lecAdapter.majorTypeLec.axis == 2).toList();
    // _zAxisStandardSegments = _zAxis.expand((e) => e.standardSegments).toList();

    // _mainAxis = _allAxis
    //     .where((e) => e.lecAdapter.majorTypeLec.lecTypeId == 'mLEC')
    //     .toList();
    _secondaryAxis = _allAxis
        .where((e) => e.lecAdapter.majorTypeLec.lecTypeId == 'iLEC')
        .toList();
    // _supplementaryAxis = _allAxis
    //     .where((e) => e.lecAdapter.majorTypeLec.lecTypeId == 'uLEC')
    //     .toList();

    _selectedZAxisSegments =
        _secondaryAxis.map((e) => e.standardSegments[0]).toList();
  }

  Future _populateAllAxis() async {
    _allAxis = List<AxisBlock>.empty(growable: true);
    var majorTypeLecs =
        await db.getMajorTypeLecByMajorTypeId(_majorType.data.id);
    for (var majorTypeLec in majorTypeLecs) {
      var lecAdapter = LecAdapter(locale, majorTypeLec);
      await lecAdapter.getRelations();
      var standardSegments =
          await db.getStandardSegmentsByMajorTypeLec(majorTypeLec, locale);
      var standardSegmentAdapters =
          List<StandardSegmentAdapter>.empty(growable: true);
      for (var e in standardSegments) {
        var res = StandardSegmentAdapter(
            e,
            locale,
            lecAdapter.gadElementarySegmentGroups
                .map((e) => e.elementarySegmentGroupId)
                .toList());
        await res.getRelations();
        standardSegmentAdapters.add(res);
      }

      var res = AxisBlock(standardSegmentAdapters, lecAdapter);
      _allAxis.add(res);
    }

    // print(_allAxis.length);
  }

  Future _initializeMinorTypes() async {
    var minorTypesScaledIds = await db.getMinorTypeScaledIdsByMajorTypeAndScale(
        _majorType.data, _selectedMappingScale);
    var res = List<MinorTypeScaledAdapter>.empty(growable: true);
    for (var minorTypeScaledId in minorTypesScaledIds) {
      var minorTypeScaled = MinorTypeScaledAdapter(
          locale, _selectedMappingScale, minorTypeScaledId);
      await minorTypeScaled.getRelations();
      res.add(minorTypeScaled);
    }
    _minorTypesScaled = res;
  }

  _initializeMinorTypesArray() {
    var minorTypesDims = _zAxis.map((e) => e.standardSegments.length).toList();
    minorTypesDims.add(xAxis.standardSegments.length);
    minorTypesDims.add(yAxis.standardSegments.length);

    _minorTypesArray = createArray(minorTypesDims);

    _minorTypesScaled.forEach((mts) {
      mts.minorTypes.forEach((mt) {
        var xSegments = mt.standardSegments.where((element) =>
            element.lec.lec.data.id == xAxis.lecAdapter.lec.data.id);
        var xOrders = xSegments.map((e) => e.standardSegment.data.order);

        var ySegments = mt.standardSegments.where((element) =>
            element.lec.lec.data.id == yAxis.lecAdapter.lec.data.id);
        var yOrders = ySegments.map((e) => e.standardSegment.data.order);

        var xySegments = [xSegments, ySegments].expand((element) => element);

        var zSegments = mt.standardSegments
            .where((element) => !xySegments.contains(element));
        var zOrdersList = _zAxis.map((zAxis) {
          var segment = zSegments.firstWhere(
              (seg) => seg.lec.lec.data.id == zAxis.lecAdapter.lec.data.id);
          return segment.standardSegment.data.order;
        }).toList();

        for (var xOrder in xOrders) {
          for (var yOrder in yOrders) {
            // print('$xOrder $yOrder $zOrder');
            var coors = List<int>.from(zOrdersList);
            coors.add(xOrder);
            coors.add(yOrder);

            _minorTypesArray =
                addToArray(_minorTypesArray, coors, mts.minorTypeScaledId);
          }
        }
      });
    });
    _initializeMinorTypeSlice();
  }

  _initializeMinorTypeSlice() {
    dynamic minorTypeSlice = _minorTypesArray;

    for (var selectedSegment in _selectedZAxisSegments) {
      minorTypeSlice =
          minorTypeSlice[selectedSegment.standardSegment.data.order];
    }

    _minorTypesScaledBlocks = List<MinorTypeBlock>.empty(growable: true);

    List<MinorTypeBlock> minorTypesScaledBlocks =
        List<MinorTypeBlock>.empty(growable: true);
    var usedMinorTypeIds = List<String>.empty(growable: true);
    for (var y in List.generate(_yAxis.standardSegments.length, (idx) => idx)) {
      for (var x
          in List.generate(_xAxis.standardSegments.length, (idx) => idx)) {
        var minorTypeSegmentId = minorTypeSlice[x][y];
        if (minorTypeSegmentId == null) {
          minorTypesScaledBlocks.add(MinorTypeBlock(1, 1, null));
        } else if (usedMinorTypeIds.contains(minorTypeSegmentId)) {
          continue;
        } else {
          usedMinorTypeIds.add(minorTypeSegmentId);
          minorTypesScaledBlocks.add(MinorTypeBlock(
              _getMinorTypeBlockWidth(minorTypeSlice, x, y),
              _getMinorTypeBlockHeight(minorTypeSlice, x, y),
              _minorTypesScaled.firstWhere(
                  (e) => e.minorTypeScaledId == minorTypeSegmentId)));
        }
      }
    }
    _minorTypesScaledBlocks = minorTypesScaledBlocks;
  }

  int _getMinorTypeBlockWidth(List<dynamic> slice, int x, int y) {
    var mtsId = slice[x][y];
    var xPointer = x;
    var width = 0;
    while (xPointer < slice.length && slice[xPointer][y] == mtsId) {
      width++;
      xPointer++;
    }
    return width;
  }

  int _getMinorTypeBlockHeight(List<dynamic> slice, int x, int y) {
    var mtsId = slice[x][y];
    var yPointer = y;
    var height = 0;
    while (yPointer < slice[x].length && slice[x][yPointer] == mtsId) {
      height++;
      yPointer++;
    }
    return height;
  }

  setMappingScale(int mappingScaleId) async {
    _selectedMappingScale = _allMappingScales[mappingScaleId];
    await _initializeMinorTypes();
    _initializeMinorTypesArray();
    notifyListeners();
  }

  setSecondaryStandardSegment(StandardSegmentAdapter standardSegment) {
    var ssIndex = _selectedZAxisSegments.indexWhere((element) =>
        element.lec.lec.data.id == standardSegment.lec.lec.data.id);
    _selectedZAxisSegments[ssIndex] = standardSegment;
    _initializeMinorTypeSlice();
    notifyListeners();
  }

  addSpecies(NinSpecie specie) async {
    await _gadHelper.addSpecie(specie);
    if (_gadHelper.selectedSpecies.length > 0) {
      gadArray = _gadHelper.getSlice(_selectedZAxisSegments);
    } else {
      gadArray = null;
    }
    notifyListeners();
  }

  removeSpecie(NinSpecie specie) {
    _gadHelper.removeSpecie(specie);
    if (_gadHelper.selectedSpecies.length > 0) {
      gadArray = _gadHelper.getSlice(_selectedZAxisSegments);
    } else {
      gadArray = null;
    }
    notifyListeners();
  }

  int get numberOfAxis => _majorTypeAdapter.lecs.length;
  AxisBlock get xAxis => _xAxis;
  AxisBlock get yAxis => _yAxis;
  bool get isLoading => _isLoading;
  List<NinMappingScaleData> get mappingScales => _allMappingScales;
  int get getSelectedMappingIndex =>
      _allMappingScales.indexOf(_selectedMappingScale);
  List<MinorTypeScaledAdapter> get minorTypes => _minorTypesScaled;
  List<MinorTypeBlock> get minorTypeScaledBlocks => _minorTypesScaledBlocks;
  List<StandardSegmentAdapter> get selectedSecondaryAxisSegments =>
      _selectedZAxisSegments;
  List<AxisBlock> get secondaryAxis => _secondaryAxis;
  List<SpecieAdapter> get selectedSpecies => _gadHelper.selectedSpecies;
}
