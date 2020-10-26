import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

enum ButtonState { AVAILABLE, SELECTED, UNAVAILABLE }

class NinStructureProvider extends ChangeNotifier {
  NiNDatabase db;
  var _ninMajorTypeGroups = List<Detailed<NinMajorTypeGroupData>>();
  var _ninMajorTypes = List<Detailed<NinMajorTypeData>>();

  Detailed<NinMajorTypeGroupData> _selectedMajorTypeGroupData;
  Detailed<NinMajorTypeData> _selectedMajorTypeData;
  Locale _locale;
  int _scrollIndex = 0;
// Scrolling

  int get scrollIndex => _scrollIndex;
// MajorTypeGroup

  NinStructureProvider(Locale locale) {
    _locale = locale;
    db = NiNDatabase();
    _loadMajorTypeGroups();
  }

  setSelectedMajorTypeGroup(Detailed<NinMajorTypeGroupData> data) async {
    if (_selectedMajorTypeGroupData != data) {
      _selectedMajorTypeGroupData = data;
      _selectedMajorTypeData = null;
      _ninMajorTypes = await db.filteredMajorTypes(data.data.id, _locale);
      _scrollIndex = 1;
      notifyListeners();
    }
  }

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

  // MajorType
  List<Detailed<NinMajorTypeData>> get majorTypes => _ninMajorTypes;

  setMajorType(Detailed<NinMajorTypeData> data) async {
    if (_selectedMajorTypeData != data) {
      _selectedMajorTypeData = data;
      _scrollIndex = 2;
      notifyListeners();
    }
  }

  Detailed<NinMajorTypeData> get selectedMajorType => _selectedMajorTypeData;
}
