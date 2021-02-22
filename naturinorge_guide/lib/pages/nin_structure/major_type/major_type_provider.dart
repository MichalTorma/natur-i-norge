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

  bool _isLoading = false;
  Detailed<NinMajorTypeData> _majorType;
  MajorTypeAdapter _majorTypeAdapter;
  List<AxisBlock> _allAxis = List<AxisBlock>.empty(growable: true);
  // List<AxisBlock> _secondaryAxis = List<AxisBlock>.empty(growable: true);
  List<StandardSegmentAdapter> _selectedZAxisSegments;

  AxisBlock _xAxis;
  AxisBlock _yAxis;
  List<AxisBlock> _zAxis;

  NinMappingScaleData _selectedMappingScale;
  List<NinMappingScaleData> _allMappingScales;

  List<MinorTypeScaledAdapter> _minorTypesScaled;
  dynamic _minorTypesArray;
  List<String> _usedMinorTypeIds;
  List<MinorTypeBlock> _minorTypesScaledBlocks;

  int _showGad = 0;
  GadHelper _gadHelper;
  List<List<num>> _gadArray;

  clear() {
    _xAxis = null;
    _yAxis = null;
    _zAxis = null;
    _gadHelper = null;
    _gadArray = null;
    _selectedZAxisSegments = null;
  }

  Future load(Detailed<NinMajorTypeData> majorType) async {
    _isLoading = true;
    notifyListeners();
    clear();
    _majorType = majorType;
    _majorTypeAdapter = MajorTypeAdapter(majorType, db, locale);
    await _initializeScales();
    await _majorTypeAdapter.getRelations(_selectedMappingScale);
    await _populateAllAxis();
    _initializeAxis();
    if (_xAxis != null) {
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

      // _secondaryAxis = null;
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
    var visibleAxis = List<AxisBlock>.empty(growable: true);

    var mLec = _allAxis
        .where((e) => e.lecAdapter.majorTypeLec.lecTypeId == 'mLEC')
        .toList();
    mLec.sort((a, b) => a.lecAdapter.majorTypeLec.axis
        .compareTo(b.lecAdapter.majorTypeLec.axis));
    var iLec = _allAxis
        .where((e) => e.lecAdapter.majorTypeLec.lecTypeId == 'iLEC')
        .toList();
    iLec.sort((a, b) => a.lecAdapter.majorTypeLec.axis
        .compareTo(b.lecAdapter.majorTypeLec.axis));
    visibleAxis.addAll(mLec);
    visibleAxis.addAll(iLec);
    if (visibleAxis.length == 0) {
      return;
    }
    _xAxis = visibleAxis[0];
    if (visibleAxis.length > 1) {
      _yAxis = visibleAxis[1];
      if (visibleAxis.length > 2) {
        _zAxis = visibleAxis.sublist(2);
      }
    }
    // _zAxis = List<AxisBlock>.empty(growable: true);
    // if (mLec.length > 0) {
    //   _xAxis = mLec.firstWhere((e) => e.lecAdapter.majorTypeLec.axis == 0);
    //   if (mLec.length > 1) {
    //     _yAxis = mLec.firstWhere((e) => e.lecAdapter.majorTypeLec.axis == 1);
    //   }
    //   if (mLec.length > 2) {
    //     _zAxis.addAll(mLec.where((e) => e.lecAdapter.majorTypeLec.axis == 2));
    //   }
    // }

    // _zAxis =
    //     _allAxis.where((e) => e.lecAdapter.majorTypeLec.axis == 2).toList();
    // _secondaryAxis = _allAxis
    //     .where((e) => e.lecAdapter.majorTypeLec.lecTypeId == 'iLEC')
    //     .toList();
    if (_zAxis != null) {
      _selectedZAxisSegments = _zAxis
          .map((e) => e.standardSegments
              .firstWhere((element) => element.standardSegment.data.order == 0))
          .toList();
    }
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
    var minorTypesDims = List<int>.empty(growable: true);
    if (_zAxis != null) {
      minorTypesDims = _zAxis.map((e) => e.standardSegments.length).toList();
    }
    minorTypesDims.add(_xAxis.standardSegments.length);
    if (_yAxis != null) {
      minorTypesDims.add(_yAxis.standardSegments.length);
    }
    _minorTypesArray = createArray(minorTypesDims);

    _minorTypesScaled.forEach((mts) {
      mts.minorTypes.forEach((mt) {
        var xSegments;
        var xOrders;
        var ySegments;
        var yOrders;
        var xySegments;
        var zSegments;

        xSegments = mt.standardSegments.where((element) =>
            element.lec.lec.data.id == xAxis.lecAdapter.lec.data.id);
        xOrders = xSegments.map((e) => e.standardSegment.data.order);
        if (_yAxis != null) {
          ySegments = mt.standardSegments.where((element) =>
              element.lec.lec.data.id == _yAxis.lecAdapter.lec.data.id);
          yOrders = ySegments.map((e) => e.standardSegment.data.order);
          xySegments = [xSegments, ySegments].expand((element) => element);
        } else {
          xySegments = xSegments;
        }

        var zOrdersList;
        if (_zAxis != null) {
          zSegments = mt.standardSegments
              .where((element) => !xySegments.contains(element));
          zOrdersList = _zAxis.map((zAxis) {
            var segment = zSegments.firstWhere(
                (seg) => seg.lec.lec.data.id == zAxis.lecAdapter.lec.data.id);
            return segment.standardSegment.data.order;
          }).toList();
        }
        for (var xOrder in xOrders) {
          if (_yAxis != null) {
            for (var yOrder in yOrders) {
              var coors;
              if (zOrdersList != null) {
                coors = List<int>.from(zOrdersList);
              } else {
                coors = List<int>.empty(growable: true);
              }
              coors.add(xOrder);
              coors.add(yOrder);

              _minorTypesArray =
                  addToArray(_minorTypesArray, coors, mts.minorTypeScaledId);
            }
          } else {
            _minorTypesArray =
                addToArray(_minorTypesArray, [xOrder], mts.minorTypeScaledId);
          }
        }
      });
    });
    _initializeMinorTypeSlice();
  }

  _initializeMinorTypeSlice() {
    dynamic minorTypeSlice = _minorTypesArray;
    if (_zAxis != null) {
      for (var selectedSegment in _selectedZAxisSegments) {
        minorTypeSlice =
            minorTypeSlice[selectedSegment.standardSegment.data.order];
      }
    }

    _minorTypesScaledBlocks = null;

    List<MinorTypeBlock> minorTypesScaledBlocks =
        List<MinorTypeBlock>.empty(growable: true);
    _usedMinorTypeIds = List<String>.empty(growable: true);

    if (_yAxis == null) {
      for (var x
          in List.generate(_xAxis.standardSegments.length, (idx) => idx)) {
        minorTypesScaledBlocks
            .add(_addMinorTypeScaledBlock(minorTypeSlice, x, null));
      }
    } else {
      for (var y
          in List.generate(_yAxis.standardSegments.length, (idx) => idx)) {
        for (var x
            in List.generate(_xAxis.standardSegments.length, (idx) => idx)) {
          minorTypesScaledBlocks
              .add(_addMinorTypeScaledBlock(minorTypeSlice, x, y));
        }
      }
    }
    minorTypesScaledBlocks.removeWhere((mtsb) => mtsb == null);
    _minorTypesScaledBlocks = minorTypesScaledBlocks; //.sublist(0, 2);
  }

  MinorTypeBlock _addMinorTypeScaledBlock(
      dynamic minorTypeSlice, int x, int y) {
    var minorTypeSegmentId;
    if (y == null) {
      minorTypeSegmentId = minorTypeSlice[x];
    } else {
      minorTypeSegmentId = minorTypeSlice[x][y];
    }
    if (minorTypeSegmentId == null) {
      var size = _getEmptyBlockSize(x, y);
      return MinorTypeBlock(size[0], size[1], null);
    } else if (_usedMinorTypeIds.contains(minorTypeSegmentId)) {
      return null;
    } else {
      _usedMinorTypeIds.add(minorTypeSegmentId);
      var mnt = _minorTypesScaled
          .firstWhere((e) => e.minorTypeScaledId == minorTypeSegmentId);

      var size = _getMinorTypeBlockSize(mnt);
      // print("$minorTypeSegmentId $size");
      return MinorTypeBlock(size[0], size[1], mnt);
    }
  }

  List<int> _getEmptyBlockSize(int x, int y) {
    var width = _xAxis.standardSegments[x].elementarySegmentGroups.length;
    var height = 1;
    if (y != null) {
      height = _yAxis.standardSegments[y].elementarySegmentGroups.length;
    }

    return [width, height];
  }

  List<int> _getMinorTypeBlockSize(MinorTypeScaledAdapter mta) {
    List<MinorTypeAdapter> mts;
    if (_selectedZAxisSegments != null) {
      mts = mta.minorTypes
          .where((mt) =>
              _selectedZAxisSegments
                  .map((ss) => ss.standardSegment.data.id)
                  .toSet()
                  .intersection(mt.standardSegments
                      .map((e) => e.standardSegment.data.id)
                      .toSet())
                  .length >
              0)
          .toList();
    } else {
      mts = mta.minorTypes;
    }
    var width = mts
        .expand((mnt) => mnt.standardSegments)
        .where((ss) => ss.lec.lec.data.id == _xAxis.lecAdapter.lec.data.id)
        .expand((ss_f) => ss_f.elementarySegmentGroups)
        .toSet()
        .length;
    var height = 1;
    if (_yAxis != null) {
      height = mts
          .expand((mnt) => mnt.standardSegments)
          .where((ss) => ss.lec.lec.data.id == _yAxis.lecAdapter.lec.data.id)
          .expand((ss_f) => ss_f.elementarySegmentGroups)
          .toSet()
          .length;
    }
    return [width, height];
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
    _getGadArray();
    notifyListeners();
  }

  _getGadArray() {
    if (_gadHelper.selectedSpecies.length > 0) {
      _gadArray = _gadHelper.getSlice(_selectedZAxisSegments);
    } else {
      _gadArray = null;
    }
  }

  addSpecies(NinSpecie specie) async {
    await _gadHelper.addSpecie(specie);
    _getGadArray();
    notifyListeners();
  }

  removeSpecie(NinSpecie specie) {
    _gadHelper.removeSpecie(specie);
    _getGadArray();
    notifyListeners();
  }

  setShowGad(int newValue) {
    if (newValue == _showGad) {
      return;
    } else {
      _showGad = newValue;
      notifyListeners();
    }
  }

  int get numberOfAxis => _majorTypeAdapter.lecs.length;
  AxisBlock get xAxis => _xAxis;
  AxisBlock get yAxis => _yAxis;
  List<AxisBlock> get zAxis => _zAxis;
  bool get isLoading => _isLoading;
  List<NinMappingScaleData> get mappingScales => _allMappingScales;
  int get getSelectedMappingIndex =>
      _allMappingScales.indexOf(_selectedMappingScale);
  List<MinorTypeScaledAdapter> get minorTypes => _minorTypesScaled;
  List<MinorTypeBlock> get minorTypeScaledBlocks => _minorTypesScaledBlocks;
  List<StandardSegmentAdapter> get selectedSecondaryAxisSegments =>
      _selectedZAxisSegments;
  // List<AxisBlock> get secondaryAxis => _secondaryAxis;
  List<SpecieAdapter> get selectedSpecies => _gadHelper.selectedSpecies;
  List<List<num>> get gadArray => _gadArray;
  int get showGad => _showGad;
  Detailed<NinMajorTypeData> get majorType => _majorType;
}
