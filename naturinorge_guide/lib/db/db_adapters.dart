import 'dart:ui';

import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'dart:math';

class StandardSegmentAdapter {
  final NiNDatabase db;
  final Locale locale;
  final Detailed<NinStandardSegmentData> standardSegment;
  final List<String> allElementarySegmentGroupIds;
  List<NinElementarySegmentData> elementarySegments;
  List<String> elementarySegmentGroups;
  LecAdapter lec;

  StandardSegmentAdapter(this.standardSegment, this.db, this.locale,
      this.allElementarySegmentGroupIds);
  Future getRelations() async {
    elementarySegments =
        await db.getElementarySegmentByStandardSegment(standardSegment.data);
    elementarySegmentGroups =
        await db.getGadElementarySegmentGroupIdsByStandardSegment(
            standardSegment.data,
            allElementarySegmentGroupIds,
            elementarySegments.map((e) => e.id).toList());
    var majorTypeLec =
        await db.getMajorTypeLecByStandardSegment(standardSegment.data);
    lec = LecAdapter(db, locale, majorTypeLec);
    await lec.getRelations();
  }
}

class ElementarySegmentGroupAdapter {
  final NiNDatabase db;
  final Locale locale;
  final String elementarySegmentGroupId;

  List<NinElementarySegmentData> elementarySegments;
  int order;

  ElementarySegmentGroupAdapter(
      this.db, this.locale, this.elementarySegmentGroupId);
  Future getRelations() async {
    elementarySegments =
        await db.getElementarySegmentByElementarySegmentGroupId(
            elementarySegmentGroupId);
    List<int> listOfOrders = elementarySegments.map((e) => e.order).toList();
    order = listOfOrders.reduce(min);
  }
}

class LecAdapter {
  final NiNDatabase db;
  final Locale locale;
  Detailed<NinLECData> lec;
  List<NinElementarySegmentData> elementarySegments;
  List<ElementarySegmentGroupAdapter> gadElementarySegmentGroups =
      List<ElementarySegmentGroupAdapter>();

  final NinMajorTypeLECData majorTypeLec;

  LecAdapter(this.db, this.locale, this.majorTypeLec);
  Future getRelations() async {
    print('Get Lec relations, majorTypeLec.id = ${majorTypeLec.id}');
    lec = await db.getLecById(majorTypeLec.lecId, locale);
    elementarySegments = await db.getElementarySegmentsByLec(lec.data);
    var elementarySegmentGroupIds = await db
        .getGadElementarySegmentGroupsIdsByMajorTypeLecId(majorTypeLec.id);

    for (var esg in elementarySegmentGroupIds) {
      var esga = ElementarySegmentGroupAdapter(db, locale, esg);
      await esga.getRelations();
      gadElementarySegmentGroups.add(esga);
    }
  }
}

class MinorTypeAdapter {
  final NiNDatabase db;
  final Locale locale;
  final Detailed<NinMinorTypeData> minorType;
  // List<StandardSegmentAdapter> standardSegments;

  MinorTypeAdapter(this.minorType, this.db, this.locale);
  // Future getRelations() async {
  //   // var standardSegmentsOnly =
  //   //     await db.getStandardSegmentsByMinorType(minorType.data, locale);
  //   // standardSegments = await Future.forEach(standardSegmentsOnly, (e) async {
  //   //   var res = StandardSegmentAdapter(e, db, locale);
  //   //   await res.getRelations();
  //   //   return res;
  //   // });
  // }
}

class MajorTypeAdapter {
  final Detailed<NinMajorTypeData> majorType;
  final NiNDatabase db;
  final Locale locale;
  List<MinorTypeAdapter> minorTypes;
  List<LecAdapter> lecs;
  // List<StandardSegmentAdapter> standardSegments;

  MajorTypeAdapter(this.majorType, this.db, this.locale);

  Future getRelations() async {
    print('Start getting relations for ${majorType.data.id}');
    var minorTypeDatas =
        await db.getMinorTypesByMajorTypeId(majorType.data.id, locale);
    minorTypes = await Future.forEach(minorTypeDatas, (e) async {
      var res = MinorTypeAdapter(e, db, locale);
      // await res.getRelations();
      return res;
    });
    var majorTypeLecs =
        await db.getMajorTypeLecByMajorTypeId(majorType.data.id);
    lecs = await Future.forEach(majorTypeLecs, (element) async {
      var res = LecAdapter(db, locale, element);
      await res.getRelations();
      return res;
    });
    // var standardSegmentsData =
    //     await db.getStandardSegmentsByMajorType(majorType.data, locale);
    // standardSegments = await Future.forEach(
    //     standardSegmentsData, (e) => StandardSegmentAdapter(e, db, locale));
    return;
  }
}
