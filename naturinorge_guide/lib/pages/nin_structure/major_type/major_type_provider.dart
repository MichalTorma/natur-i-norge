import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/main.dart';

class MinorTypeBlock {
  final int width;
  final int height;
  final MinorTypeScaledAdapter minorTypeScaled;

  MinorTypeBlock(this.width, this.height, this.minorTypeScaled);
}

class AxisBlock {
  final List<StandardSegmentAdapter> standardSegments;
  final LecAdapter lecAdapter;

  AxisBlock(this.standardSegments, this.lecAdapter);
}

class MajorTypeProvider extends ChangeNotifier {
  final Locale locale;

  MajorTypeProvider(this.locale);

  bool _isLoading = true;
  Detailed<NinMajorTypeData> _majorType;
  MajorTypeAdapter _majorTypeAdapter;
  int _numberOfAxis = 0;
  List<AxisBlock> _allAxis = List<AxisBlock>();
  List<AxisBlock> _mainAxis = List<AxisBlock>();
  List<AxisBlock> _secondaryAxis = List<AxisBlock>();
  List<AxisBlock> _supplementaryAxis = List<AxisBlock>();
  List<StandardSegmentAdapter> _selectedZAxisSegments;

  AxisBlock _xAxis;
  AxisBlock _yAxis;
  List<AxisBlock> _zAxis;

  NinMappingScaleData _selectedMappingScale;
  List<NinMappingScaleData> _allMappingScales;

  List<MinorTypeScaledAdapter> _minorTypesScaled;
  dynamic _minorTypesArray;
  List<MinorTypeBlock> _minorTypesScaledBlocks;

  Future load(Detailed<NinMajorTypeData> majorType) async {
    _isLoading = true;
    notifyListeners();
    _majorType = majorType;
    _majorTypeAdapter = MajorTypeAdapter(majorType, db, locale);
    await _initializeScales();
    await _majorTypeAdapter.getRelations(_selectedMappingScale);
    await _populateAllAxis();
    _initializeAxis();
    await _initializeMinorTypes();
    _initializeMinorTypesArray();
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

    _mainAxis = _allAxis
        .where((e) => e.lecAdapter.majorTypeLec.lecTypeId == 'mLEC')
        .toList();
    _secondaryAxis = _allAxis
        .where((e) => e.lecAdapter.majorTypeLec.lecTypeId == 'iLEC')
        .toList();
    _supplementaryAxis = _allAxis
        .where((e) => e.lecAdapter.majorTypeLec.lecTypeId == 'uLEC')
        .toList();

    _selectedZAxisSegments =
        _secondaryAxis.map((e) => e.standardSegments[0]).toList();
  }

  Future _populateAllAxis() async {
    var majorTypeLecs =
        await db.getMajorTypeLecByMajorTypeId(_majorType.data.id);
    for (var majorTypeLec in majorTypeLecs) {
      var lecAdapter = LecAdapter(locale, majorTypeLec);
      await lecAdapter.getRelations();
      var standardSegments =
          await db.getStandardSegmentsByMajorTypeLec(majorTypeLec, locale);
      var standardSegmentAdapters = List<StandardSegmentAdapter>();
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
    var res = List<MinorTypeScaledAdapter>();
    for (var minorTypeScaledId in minorTypesScaledIds) {
      var minorTypeScaled = MinorTypeScaledAdapter(
          locale, _selectedMappingScale, minorTypeScaledId);
      await minorTypeScaled.getRelations();
      res.add(minorTypeScaled);
    }
    _minorTypesScaled = res;
  }

  dynamic _addToArray(dynamic array, List<int> coors, String value) {
    if (coors.length > 0) {
      var index = coors[0];
      var newArray = array[index];
      coors.removeAt(0);

      array[index] = _addToArray(newArray, coors, value);
      return array;
    } else {
      return value;
    }
  }

  _initializeMinorTypesArray() {
    _minorTypesArray = List.generate(xAxis.standardSegments.length,
        (index) => List.generate(yAxis.standardSegments.length, (index) => ''));

    for (var zAxis in _zAxis) {
      _minorTypesArray = List.generate(
          zAxis.standardSegments.length, (index) => _minorTypesArray);
    }

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
                _addToArray(_minorTypesArray, coors, mts.minorTypeScaledId);
          }
        }
      });
    });

    dynamic minorTypeSlice = _minorTypesArray;

    for (var selectedSegment in _selectedZAxisSegments) {
      minorTypeSlice =
          minorTypeSlice[selectedSegment.standardSegment.data.order];
    }

    _minorTypesScaledBlocks = List<MinorTypeBlock>();
    // var numberOfBlocks =
    //     minorTypeSlice.expand((element) => element).toSet().length +
    //         minorTypeSlice
    //             .expand((element) => element)
    //             .where((e) => e == null)
    //             .length;

    List<MinorTypeBlock> minorTypesScaledBlocks = List<MinorTypeBlock>();
    var usedMinorTypeIds = List<String>();
    for (var y in List.generate(yAxis.standardSegments.length, (idx) => idx)) {
      for (var x
          in List.generate(xAxis.standardSegments.length, (idx) => idx)) {
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

  int _getMinorTypeBlockWidth(List<List<String>> slice, int x, int y) {
    var mtsId = slice[x][y];
    var xPointer = x;
    var width = 0;
    while (xPointer < slice.length && slice[xPointer][y] == mtsId) {
      width++;
      xPointer++;
    }
    return width;
  }

  int _getMinorTypeBlockHeight(List<List<String>> slice, int x, int y) {
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

  int get numberOfAxis => _majorTypeAdapter.lecs.length;
  AxisBlock get xAxis => _xAxis;
  AxisBlock get yAxis => _yAxis;
  bool get isLoading => _isLoading;
  List<NinMappingScaleData> get mappingScales => _allMappingScales;
  int get getSelectedMappingIndex =>
      _allMappingScales.indexOf(_selectedMappingScale);
  List<MinorTypeScaledAdapter> get minorTypes => _minorTypesScaled;
  List<MinorTypeBlock> get minorTypeSclaedBlocks => _minorTypesScaledBlocks;
  List<StandardSegmentAdapter> get selectedSecondaryAxisSegments =>
      _selectedZAxisSegments;
  List<AxisBlock> get secondaryAxis => _secondaryAxis;
}
