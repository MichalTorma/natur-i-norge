import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:tuple/tuple.dart';

enum ButtonState { AVAILABLE, SELECTED, UNAVAILABLE }

class NinStructureProvider extends ChangeNotifier {
  NiNDatabase db;
  var _ninMajorTypeGroups =
      Map<NinMajorTypeGroupData, NinMajorTypeGroupInfoData>();
  var _ninMajorTypes = List<NinMajorTypeInfoData>();

  NinMajorTypeGroupInfoData _selectedMajorTypeGroupInfoData;
  Locale _locale;

  NinStructureProvider(Locale locale) {
    _locale = locale;
    db = NiNDatabase();
    loadMajorTypeGroups();
  }

  Future setSelectedMajorTypeGroup(NinMajorTypeGroupInfoData data) async {
    _selectedMajorTypeGroupInfoData = data;
    notifyListeners();
  }

  NinMajorTypeGroupInfoData get selectedMajorTypeGroupInfo =>
      _selectedMajorTypeGroupInfoData;

  int get getMajorTypeGroupLength {
    if (_ninMajorTypeGroups == null)
      return 0;
    else
      return _ninMajorTypeGroups.length;
  }

  NinMajorTypeGroupInfoData get getSelectedMajorTypeGroup =>
      _selectedMajorTypeGroupInfoData;

  Map<NinMajorTypeGroupData, NinMajorTypeGroupInfoData> get majorTypeGroups =>
      _ninMajorTypeGroups;
  Future loadMajorTypeGroups({String filter = ''}) async {
    var groups = await db.allMajorTypeGroups;
    _ninMajorTypeGroups.clear();
    for (var group in groups) {
      _ninMajorTypeGroups[group] =
          await db.getMajorTypeGroupInfoData(group, _locale);
    }

    notifyListeners();
  }
}
