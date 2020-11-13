import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

enum ButtonState { AVAILABLE, SELECTED, UNAVAILABLE }

class NinStructureProvider extends ChangeNotifier {
  final NiNDatabase db;
  var _ninMajorTypeGroups = List<Detailed<NinMajorTypeGroupData>>();
  var _ninMajorTypes = List<Detailed<NinMajorTypeData>>();

  Detailed<NinMajorTypeGroupData> _selectedMajorTypeGroupData;
  Detailed<NinMajorTypeData> _selectedMajorTypeData;
  Locale _locale;
  int _scrollIndex = 0;
// Scrolling

  int get scrollIndex => _scrollIndex;
// MajorTypeGroup

  NinStructureProvider(Locale locale, this.db) {
    _locale = locale;

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
    _ninMajorTypeGroups = await Detailed<NinMajorTypeGroupData>()
        .fromList(majorTypeGroups, locale, db);
    notifyListeners();
  }

  // MajorType
  List<Detailed<NinMajorTypeData>> get majorTypes => _ninMajorTypes;

  setMajorType(BuildContext context, Detailed<NinMajorTypeData> data) async {
    // if (_selectedMajorTypeData != data) {
    _selectedMajorTypeData = data;
    await Provider.of<MajorTypeProvider>(context, listen: false).load(data);
    _scrollIndex = 2;
    notifyListeners();
    // }
  }

  Locale get locale => _locale;

  Detailed<NinMajorTypeData> get selectedMajorType => _selectedMajorTypeData;
}
