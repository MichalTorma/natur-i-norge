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

  MajorTypeProvider(this.majorType, this.locale) {
    _db = NiNDatabase();
    initialze();
  }

  NiNDatabase _db;
  NinMappingScaleData _activeMappingScale;
  MajorTypeAdapter _majorTypeAdapter;
  int _numberOfAxis = 0;
  List<AxisBlock> _allAxis;
  AxisBlock _xAxis;
  AxisBlock _yAxis;
  List<AxisBlock> _otherAxis;

  initialze() async {
    _majorTypeAdapter = MajorTypeAdapter(majorType, _db, locale);
    await _majorTypeAdapter.getRelations();
    await _populateAllAxis();
    await _organizeAxis();

    notifyListeners();
  }

  Future _organizeAxis() async {
    // todo implement changing axis
    _xAxis =
        _allAxis.firstWhere((e) => e.lecAdapter.majorTypeLECData.axis == 0);
    _yAxis =
        _allAxis.firstWhere((e) => e.lecAdapter.majorTypeLECData.axis == 1);
    _otherAxis = _allAxis.where((element) =>
        ![0, 1].contains(element.lecAdapter.majorTypeLECData.axis));
  }

  Future _populateAllAxis() async {
    var majorTypeLecs =
        await _db.getMajorTypeLecByMajorTypeId(majorType.data.id);
    _allAxis = await Future.forEach(majorTypeLecs, (element) async {
      // var lec = await _db.getLecById(element.data.lecId, locale);
      var lecAdapter = LecAdapter(_db, locale, element.data);
      await lecAdapter.getRelations();
      var standardSegments =
          await _db.getStandardSegmentsByMajorTypeLec(element, locale);
      var standardSegmentAdapters =
          await Future.forEach(standardSegments, (e) async {
        var res = StandardSegmentAdapter(e, _db, locale);
        await res.getRelations();
        return res;
      });
      return AxisBlock(standardSegmentAdapters, lecAdapter);
    });
  }

  int get numberOfAxis => _majorTypeAdapter.lecs.length;
  AxisBlock get xAxis => _xAxis;
  AxisBlock get yAxis => _yAxis;
  List<AxisBlock> get otherAxis => _otherAxis;

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
