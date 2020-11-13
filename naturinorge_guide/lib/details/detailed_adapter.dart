import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

import 'package:naturinorge_guide/db/nin_db.dart';

class Detailed<K> {
  K data;
  String name;
  NiNDatabase db;
  Locale locale;
  String detailId;
  String nameHeader;
  String description;
  String descriptionHeader;
  Map<String, String> other;

  Future initialize(dynamic data, Locale locale, NiNDatabase db) async {
    this.data = data;
    this.locale = locale;
    this.detailId = data.detailId;
    this.db = db;
    await _getRelations();
    return this;
  }

  Future<List<Detailed<K>>> fromList(
      List<dynamic> dataList, Locale locale, NiNDatabase db) async {
    var res = List<Detailed<K>>();
    for (var e in dataList) {
      print('Get details for detailId: ${e.detailId}');
      try {
        var detailed = await Detailed<K>().initialize(e, locale, db);
        res.add(detailed);
      } catch (e) {
        print(e);
        print('Unable to get deails for ${e.detailId}');
      }
    }
    // var res = await Future.forEach(
    //     dataList, (e) async => await Detailed().initialize(e, locale, db));
    return res;
  }

  _printDetails(List<NinDetailData> details) {
    for (var detail in details) {
      print(
          '${detail.id} - ${detail.key} - ${detail.value} - ${detail.languageId}');
    }
  }

  Future _getRelations() async {
    var details = await db.getDetails(detailId, locale);
    if (details == null || details.length == 0) {
      print('unable to find details');
      return;
    }

    var nameDetail = details.firstWhere((element) => element.key == '<name>',
        orElse: () => null);
    if (nameDetail == null) {
      _printDetails(details);
      throw Exception('Unable to find <name>');
    }
    name = nameDetail.value;
    nameHeader = tr('<name>');
    var descriptionDetail = details.firstWhere(
        (element) => element.key == '<description>',
        orElse: () => null);
    if (descriptionDetail == null) {
      // _printDetails(details);
      print('Unable to find <description>');
    } else {
      description = descriptionDetail.value;
    }
    descriptionHeader = tr('<description>');

    details.removeWhere(
        (element) => element.key == '<name>' || element.key == '<description>');
    other = Map.fromIterable(details,
        key: (e) {
          var header = e.key;
          try {
            header = tr(header);
          } catch (e) {}
          return header;
        },
        value: (e) => e.value);
  }
}
