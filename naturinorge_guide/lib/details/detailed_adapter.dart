import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/main.dart';

class Detailed<K> {
  K data;
  String name;

  Locale locale;
  String detailId;
  String nameHeader;
  String description;
  String descriptionHeader;
  Map<String, String> other;

  Future initialize(dynamic data, Locale locale) async {
    this.data = data;
    this.locale = locale;
    this.detailId = data.detailId;

    await _getRelations();
    return this;
  }

  Future<List<Detailed<K>>> fromList(
      List<dynamic> dataList, Locale locale) async {
    var res = List<Detailed<K>>.empty(growable: true);
    for (var e in dataList) {
      // print('Get details for detailId: ${e.detailId}');

      var detailed = await Detailed<K>().initialize(e, locale);
      res.add(detailed);
    }
    // var res = await Future.forEach(
    //     dataList, (e) async => await Detailed().initialize(e, locale, db));
    return res;
  }

  _printDetails(List<NinDetailData> details) {
    // for (var detail in details) {
    //   print(
    //       '${detail.id} - ${detail.key} - ${detail.value} - ${detail.languageId}');
    // }
  }

  Future _getRelations() async {
    var details = await db.getDetails(detailId, locale);
    if (details == null || details.length == 0) {
      // print('unable to find details');
      return;
    }

    var nameDetail = details.firstWhere((element) => element.key == '<name>',
        orElse: () => null);
    if (nameDetail != null) {
      name = nameDetail.value;
      nameHeader = tr('<name>');
    }

    var descriptionDetail = details.firstWhere(
        (element) => element.key == '<description>',
        orElse: () => null);
    if (descriptionDetail == null) {
      // _printDetails(details);
      // print('Unable to find <description>');
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
