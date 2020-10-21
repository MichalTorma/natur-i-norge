import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:moor/moor.dart';
import 'package:naturinorge_guide/db/nin_db.dart';

class Detailed<K> {
  final K data;
  String name;
  String nameHeader;
  String description;
  String descriptionHeader;
  Map<String, String> other;
  Detailed(
      {@required this.data,
      @required Locale locale,
      @required String detailId,
      @required NiNDatabase db}) {
    db.getDetails(detailId, locale).then((details) {
      name = details.firstWhere((element) => element.key == '<name>').value;
      nameHeader = tr('<name>');
      description =
          details.firstWhere((element) => element.key == '<description>').value;
      descriptionHeader = tr('<description>');
      details.removeWhere((element) =>
          element.key == '<name>' || element.key == '<description>');
      other = Map.fromIterable(details,
          key: (e) {
            var header = e.key;
            try {
              header = tr(header);
            } catch (e) {}
            return header;
          },
          value: (e) => e.value);
    });
  }
}
