import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:naturinorge_guide/main.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_description_landscape.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_provider.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/major_type_selector_page.dart';
import 'package:naturinorge_guide/pages/nin_structure/major_type/minor_type_table/major_type_page.dart';
import 'package:provider/provider.dart';

enum ButtonState { AVAILABLE, SELECTED, UNAVAILABLE }

class NinStructureProvider extends ChangeNotifier {
  var _ninMajorTypeGroups = List<Detailed<NinMajorTypeGroupData>>.empty();
  var _ninMajorTypes = List<Detailed<NinMajorTypeData>>.empty();

  Detailed<NinMajorTypeGroupData> _selectedMajorTypeGroupData;
  Detailed<NinMajorTypeData> _selectedMajorTypeData;
  Locale _locale;
// Scrolling

// MajorTypeGroup

  NinStructureProvider(Locale locale) {
    _locale = locale;

    _loadMajorTypeGroups();
  }

  Future setSelectedMajorTypeGroup(
      BuildContext context, Detailed<NinMajorTypeGroupData> data) async {
    if (_selectedMajorTypeGroupData != data) {
      _selectedMajorTypeGroupData = data;
      _selectedMajorTypeData = null;
      _ninMajorTypes = await db.filteredMajorTypes(data.data.id, _locale);
      notifyListeners();
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MajorTypeSelectorPage()));
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

  Future _loadMajorTypeGroups() async {
    var majorTypeGroups = await db.allMajorTypeGroups;
    _ninMajorTypeGroups = await Detailed<NinMajorTypeGroupData>()
        .fromList(majorTypeGroups, locale);
    notifyListeners();
  }

  // MajorType
  List<Detailed<NinMajorTypeData>> get majorTypes => _ninMajorTypes;

  setMajorType(BuildContext context, Detailed<NinMajorTypeData> data) async {
    if (_selectedMajorTypeData != data) {
      _selectedMajorTypeData = data;
      await Provider.of<MajorTypeProvider>(context, listen: false).load(data);
      notifyListeners();
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MajorTypePage()));
  }

  Locale get locale => _locale;

  Detailed<NinMajorTypeData> get selectedMajorType => _selectedMajorTypeData;
}
