import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';

enum ButtonState { AVAILABLE, SELECTED, UNAVAILABLE }

class NinStructureProvider extends ChangeNotifier {
  NiNDatabase db;
  NinStructureProvider() {
    db = NiNDatabase();
    loadMajorTypeGroups();
  }

  NinMajorTypeGroupData _selectedMajorTypeGroup;
  set setSelectedMajorTypeGroup(NinMajorTypeGroupData data) {
    _selectedMajorTypeGroup = data;
    notifyListeners();
  }

  ButtonState getMajorTypeGroupState(NinMajorTypeGroupData majorTypeGroupData) {
    if (_selectedMajorTypeGroup == null) {
      return ButtonState.AVAILABLE;
    }
    if (_selectedMajorTypeGroup.id == majorTypeGroupData.id) {
      return ButtonState.SELECTED;
    } else {
      return ButtonState.AVAILABLE;
    }
  }

  NinMajorTypeGroupData get getSelectedMajorTypeGroup =>
      _selectedMajorTypeGroup;

  List<NinMajorTypeGroupData> get majorTypeGroups => _ninMajorTypeGroups;
  var _ninMajorTypeGroups = List<NinMajorTypeGroupData>();
  Future loadMajorTypeGroups({String filter = ''}) async {
    _ninMajorTypeGroups = await db.allMajorTypeGroups;
    notifyListeners();
  }
}
