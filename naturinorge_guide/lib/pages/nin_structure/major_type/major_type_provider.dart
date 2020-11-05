import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';

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
  final Detailed<NinMajorTypeData> majorType;
  final Locale locale;
  final NiNDatabase _db;

  MajorTypeProvider(
    this.majorType,
    this.locale,
    this._db,
  ) {
    initialze();
  }

  NinMappingScaleData _activeMappingScale;
  MajorTypeAdapter _majorTypeAdapter;
  int _numberOfAxis = 0;
  List<AxisBlock> _allAxis = List<AxisBlock>();
  AxisBlock _xAxis;
  AxisBlock _yAxis;
  List<AxisBlock> _otherAxis;
  bool _isLoading = true;

  initialze() async {
    _isLoading = true;
    _majorTypeAdapter = MajorTypeAdapter(majorType, _db, locale);
    await _majorTypeAdapter.getRelations();
    await _populateAllAxis();
    _organizeAxis();
    _isLoading = false;
    notifyListeners();
  }

  Future _organizeAxis() {
    // todo implement changing axis
    _xAxis =
        _allAxis.firstWhere((e) => e.lecAdapter.majorTypeLECData.axis == 0);
    _yAxis =
        _allAxis.firstWhere((e) => e.lecAdapter.majorTypeLECData.axis == 1);
    // _otherAxis = _allAxis.where((element) =>
    //     ![0, 1].contains(element.lecAdapter.majorTypeLECData.axis));
  }

  Future _populateAllAxis() async {
    var majorTypeLecs =
        await _db.getMajorTypeLecByMajorTypeId(majorType.data.id);
    for (var element in majorTypeLecs) {
      var lecAdapter = LecAdapter(_db, locale, element);
      await lecAdapter.getRelations();
      var standardSegments =
          await _db.getStandardSegmentsByMajorTypeLec(element, locale);
      var standardSegmentAdapters = List<StandardSegmentAdapter>();
      for (var e in standardSegments) {
        var res = StandardSegmentAdapter(e, _db, locale);
        await res.getRelations();
        standardSegmentAdapters.add(res);
      }

      var res = AxisBlock(standardSegmentAdapters, lecAdapter);
      _allAxis.add(res);
    }

    print(_allAxis.length);
  }

  int get numberOfAxis => _majorTypeAdapter.lecs.length;
  AxisBlock get xAxis => _xAxis;
  AxisBlock get yAxis => _yAxis;
  List<AxisBlock> get otherAxis => _otherAxis;
  bool get isLoading => _isLoading;

  // Widget gridBuilder(int index){
  //   List<int> coordinates = getCoordinatesFromIndex(index);
  //   Detailed<NinStandardSegmentData> standardSegment = getStandardSegment(coordinates);
  //   Widget res;
  //   if (standardSegment == null) {
  //     res = Container(); // (1,1)
  //   }
  //   else {
  //     if (_usedStandardSegments.contains(standardSegment)){

  //     }
  //     return //minor type widget
  //   }
  // }
}
