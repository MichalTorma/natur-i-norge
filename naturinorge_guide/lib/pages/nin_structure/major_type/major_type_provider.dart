import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/main.dart';

class MinorTypeBlock {
  final int order;
  final int width;
  final int height;
  final MinorTypeAdapter minorType;

  MinorTypeBlock(this.order, this.width, this.height, this.minorType);
}

class AxisBlock {
  final List<StandardSegmentAdapter> standardSegments;
  final LecAdapter lecAdapter;

  AxisBlock(this.standardSegments, this.lecAdapter);
}

class MajorTypeProvider extends ChangeNotifier {
  final Locale locale;

  MajorTypeProvider(this.locale);

  Detailed<NinMajorTypeData> _majorType;
  NinMappingScaleData _activeMappingScale;
  MajorTypeAdapter _majorTypeAdapter;
  int _numberOfAxis = 0;
  List<AxisBlock> _allAxis = List<AxisBlock>();
  List<AxisBlock> _mainAxis = List<AxisBlock>();
  List<AxisBlock> _secondaryAxis = List<AxisBlock>();
  List<AxisBlock> _supplementaryAxis = List<AxisBlock>();
  List<StandardSegmentAdapter> _selectedSecondaryAxisSegments =
      List<StandardSegmentAdapter>();
  AxisBlock _xAxis;
  AxisBlock _yAxis;

  NinMappingScaleData _selectedMappingScale;
  List<NinMappingScaleData> _allMappingScales;

  // List<AxisBlock> _otherAxis;
  bool _isLoading = true;

  Future load(Detailed<NinMajorTypeData> majorType) async {
    _isLoading = true;
    notifyListeners();
    _majorType = majorType;
    _majorTypeAdapter = MajorTypeAdapter(majorType, db, locale);
    await _majorTypeAdapter.getRelations();
    await _populateAllAxis();
    _initializeAxis();
    await _initializeScale();
    _isLoading = false;
    notifyListeners();
  }

  Future _initializeScale() async {
    _selectedMappingScale = await db.getMappingScaleById(5000);
    _allMappingScales = await db.getMappingScales();
  }

  _initializeAxis() {
    if (_allAxis.length < 1) {
      throw Exception('allAxis is empty');
    }
    _xAxis = _allAxis.firstWhere((e) => e.lecAdapter.majorTypeLec.axis == 0);
    _yAxis = _allAxis.firstWhere((e) => e.lecAdapter.majorTypeLec.axis == 1);
    // _otherAxis = _allAxis
    //     .where(
    //         (element) => ![0, 1].contains(element.lecAdapter.majorTypeLec.axis))
    //     .toList();
    _mainAxis = _allAxis
        .where((e) => e.lecAdapter.majorTypeLec.lecTypeId == 'mLEC')
        .toList();
    _secondaryAxis = _allAxis
        .where((e) => e.lecAdapter.majorTypeLec.lecTypeId == 'iLEC')
        .toList();
    _supplementaryAxis = _allAxis
        .where((e) => e.lecAdapter.majorTypeLec.lecTypeId == 'uLEC')
        .toList();

    _selectedSecondaryAxisSegments =
        _secondaryAxis.map((e) => e.standardSegments[0]).toList();
  }

  Future _populateAllAxis() async {
    var majorTypeLecs =
        await db.getMajorTypeLecByMajorTypeId(_majorType.data.id);
    for (var majorTypeLec in majorTypeLecs) {
      var lecAdapter = LecAdapter(db, locale, majorTypeLec);
      await lecAdapter.getRelations();
      var standardSegments =
          await db.getStandardSegmentsByMajorTypeLec(majorTypeLec, locale);
      var standardSegmentAdapters = List<StandardSegmentAdapter>();
      for (var e in standardSegments) {
        var res = StandardSegmentAdapter(
            e,
            db,
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

    print(_allAxis.length);
  }

  setMappingScale(int mappingScaleId) {
    _selectedMappingScale = _allMappingScales[mappingScaleId];
    notifyListeners();
  }

  int get numberOfAxis => _majorTypeAdapter.lecs.length;
  AxisBlock get xAxis => _xAxis;
  AxisBlock get yAxis => _yAxis;
  bool get isLoading => _isLoading;
  List<NinMappingScaleData> get mappingScales => _allMappingScales;
  int get getSelectedMappingIndex =>
      _allMappingScales.indexOf(_selectedMappingScale);
}
