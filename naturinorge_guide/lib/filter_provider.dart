import 'package:flutter/widgets.dart';
import 'package:naturinorge_guide/db/db_description.dart';

class FilterProvider extends ChangeNotifier {
  List<T4Data> _data = [];
  final T4Dao _databaseProvider;

  FilterProvider(this._databaseProvider){
    filterMask('');
  }

  List<T4Data> get data => _data;
  Future filterMask(String mask) async {
    if (mask == '') {
      _data = await _databaseProvider.allT4;
    } else {
      _data = await _databaseProvider.filteredT4(mask);
    }

    notifyListeners();
  }
}
