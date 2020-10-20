import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';

enum ButtonState { AVAILABLE, SELECTED, UNAVAILABLE }

class NinStructureProvider extends ChangeNotifier {
  NiNDatabase db;
  var _ninMajorTypeGroups = List<Detailed<NinMajorTypeGroupData>>();
  var _ninMajorTypes = List<Detailed<NinMajorTypeData>>();

  Detailed<NinMajorTypeGroupData> _selectedMajorTypeGroupData;
  Locale _locale;

  NinStructureProvider(Locale locale) {
    _locale = locale;
    db = NiNDatabase();
    _loadMajorTypeGroups();
  }

  set selectedMajorTypeGroup(Detailed<NinMajorTypeGroupData> data) =>
      _selectedMajorTypeGroupData = data;

  Detailed<NinMajorTypeGroupData> get selectedMajorTypeGroup =>
      _selectedMajorTypeGroupData;

  int get getMajorTypeGroupLength {
    if (_ninMajorTypeGroups == null)
      return 0;
    else
      return _ninMajorTypeGroups.length;
  }

  List<Detailed<NinMajorTypeGroupData>> get majorTypeGroups =>
      _ninMajorTypeGroups;

  Future _loadMajorTypeGroups({String filter = ''}) async {
    var majorTypeGroups = await db.allMajorTypeGroups;
    _ninMajorTypeGroups = majorTypeGroups
        .map((e) => Detailed(
              data: e,
              db: db,
              locale: _locale,
              detailId: e.detailId,
            ))
        .toList();
    notifyListeners();
  }
}
