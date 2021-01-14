import 'dart:ui';

import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'dart:math';
import 'package:quiver/core.dart';
import 'package:naturinorge_guide/main.dart';

class StandardSegmentAdapter {
  final Locale locale;
  final Detailed<NinStandardSegmentData> standardSegment;
  final List<String> allElementarySegmentGroupIds;
  List<NinElementarySegmentData> elementarySegments;
  List<String> elementarySegmentGroups;
  LecAdapter lec;

  StandardSegmentAdapter(
      this.standardSegment, this.locale, this.allElementarySegmentGroupIds);
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
    lec = LecAdapter(locale, majorTypeLec);
    await lec.getRelations();
  }
}

class ElementarySegmentGroupAdapter {
  final Locale locale;
  final String elementarySegmentGroupId;

  List<NinElementarySegmentData> elementarySegments;
  int order;

  ElementarySegmentGroupAdapter(this.locale, this.elementarySegmentGroupId);
  Future getRelations() async {
    elementarySegments =
        await db.getElementarySegmentByElementarySegmentGroupId(
            elementarySegmentGroupId);
    List<int> listOfOrders = elementarySegments.map((e) => e.order).toList();
    order = listOfOrders.reduce(min);
  }

  bool operator ==(o) =>
      o is ElementarySegmentGroupAdapter &&
      o.elementarySegmentGroupId == elementarySegmentGroupId &&
      o.locale == locale;
  int get hashCode => hash2(elementarySegmentGroupId.hashCode, locale.hashCode);
}

class LecAdapter {
  final Locale locale;
  Detailed<NinLECData> lec;
  List<NinElementarySegmentData> elementarySegments;
  List<ElementarySegmentGroupAdapter> gadElementarySegmentGroups =
      List<ElementarySegmentGroupAdapter>.empty(growable: true);

  final NinMajorTypeLECData majorTypeLec;

  LecAdapter(this.locale, this.majorTypeLec);
  Future getRelations() async {
    // print('Get Lec relations, majorTypeLec.id = ${majorTypeLec.id}');
    lec = await db.getLecById(majorTypeLec.lecId, locale);
    elementarySegments = await db.getElementarySegmentsByLec(lec.data);
    var elementarySegmentGroupIds = await db
        .getGadElementarySegmentGroupsIdsByMajorTypeLecId(majorTypeLec.id);

    for (var esg in elementarySegmentGroupIds) {
      var esga = ElementarySegmentGroupAdapter(locale, esg);
      await esga.getRelations();
      gadElementarySegmentGroups.add(esga);
    }
  }
}

class MinorTypeScaledAdapter {
  final NinMappingScaleData mappingScale;
  final String minorTypeScaledId;
  final Locale locale;
  List<MinorTypeAdapter> minorTypes;

  MinorTypeScaledAdapter(
      this.locale, this.mappingScale, this.minorTypeScaledId);
  Future getRelations() async {
    var minorTypesData =
        await db.getMinorTypesByMajorTypeScaledId(minorTypeScaledId, locale);
    var res = List<MinorTypeAdapter>.empty(growable: true);
    for (var minorType in minorTypesData) {
      var item = MinorTypeAdapter(locale, minorType);
      await item.getRelations();
      res.add(item);
    }
    minorTypes = res;
  }
}

class MinorTypeAdapter {
  final Locale locale;
  final Detailed<NinMinorTypeData> minorType;

  List<StandardSegmentAdapter> standardSegments;

  MinorTypeAdapter(this.locale, this.minorType);

  Future getRelations() async {
    var standardSegmentsData =
        await db.getStandardSegmentsByMinorType(minorType.data, locale);
    var res = List<StandardSegmentAdapter>.empty(growable: true);
    for (var ss in standardSegmentsData) {
      var majorTypeLec = await db.getMajorTypeLecByStandardSegment(ss.data);
      var allElementarySegmentGroupIds = await db
          .getGadElementarySegmentGroupsIdsByMajorTypeLecId(majorTypeLec.id);
      var ssa =
          StandardSegmentAdapter(ss, locale, allElementarySegmentGroupIds);
      await ssa.getRelations();
      res.add(ssa);
    }
    standardSegments = res;
  }
}

class MajorTypeAdapter {
  final Detailed<NinMajorTypeData> majorType;

  final Locale locale;
  List<MinorTypeScaledAdapter> minorTypes;
  List<LecAdapter> lecs;

  // List<StandardSegmentAdapter> standardSegments;

  MajorTypeAdapter(this.majorType, db, this.locale);

  Future getRelations(NinMappingScaleData mappingScale) async {
    // print('Start getting relations for ${majorType.data.id}');
    var minorTypeScaledIds = await db.getMinorTypeScaledIdsByMajorTypeAndScale(
        majorType.data, mappingScale);
    var res = List<MinorTypeScaledAdapter>.empty(growable: true);
    for (var minorTypeScaledId in minorTypeScaledIds) {
      res.add(MinorTypeScaledAdapter(locale, mappingScale, minorTypeScaledId));
    }
    minorTypes = await Future.forEach(minorTypeScaledIds, (e) async {
      var res = MinorTypeScaledAdapter(
        locale,
        mappingScale,
        e,
      );
      // await res.getRelations();
      return res;
    });
    var majorTypeLecs =
        await db.getMajorTypeLecByMajorTypeId(majorType.data.id);
    lecs = await Future.forEach(majorTypeLecs, (element) async {
      var res = LecAdapter(locale, element);
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
