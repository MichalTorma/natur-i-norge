import 'dart:developer';
import 'dart:ui';

import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'dart:math';
import 'package:quiver/core.dart';
import 'package:naturinorge_guide/main.dart';

class StandardSegmentAdapter {
  final Locale locale;
  final Detailed<NinStandardSegmentData> standardSegment;
  final String majorTypeId;
  // final List<String> allElementarySegmentGroupIds;
  List<NinElementarySegmentData> elementarySegments;
  List<String> elementarySegmentGroups;
  // final LecAdapter lec;

  StandardSegmentAdapter(this.standardSegment, this.locale, this.majorTypeId);
  Future getRelations() async {
    // elementarySegments =
    //     await db.getElementarySegmentByStandardSegment(standardSegment.data);

    // // print(elementarySegments);
    // elementarySegmentGroups =
    //     await db.getGadElementarySegmentGroupIdsByStandardSegment(
    //         standardSegment.data,
    //         allElementarySegmentGroupIds,
    //         elementarySegments.map((e) => e.id).toList());
    Timeline.startSync('get esgs');
    var esgs = await db.getElementarySegmentGroupByStandardSegmentAndMajorType(
        standardSegment.data.id, majorTypeId);
    var esIds = esgs.map((e) => e.elementarySegmentId).toSet().toList();
    Timeline.finishSync();
    Timeline.startSync('get es ids');
    elementarySegments = await db.getElementarySegmentsByIds(esIds);
    Timeline.finishSync();
    elementarySegmentGroups = esgs.map((e) => e.id).toSet().toList();
    // Timeline.startSync('get LEC adapter');
    // // var majorTypeLec =
    // //     await db.getMajorTypeLecByStandardSegment(standardSegment.data);
    // // lec = LecAdapter(locale, majorTypeLec);
    // // await lec.getRelations();
    // Timeline.finishSync();
  }
}

class ElementarySegmentGroupAdapter {
  final Locale locale;
  final String elementarySegmentGroupId;

  List<NinElementarySegmentData> elementarySegments;
  int order;

  ElementarySegmentGroupAdapter(this.locale, this.elementarySegmentGroupId);
  Future getRelations() async {
    // print(elementarySegmentGroupId);
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

class MajorTypeLecAdapter {
  final Locale locale;
  Detailed<NinLECData> lec;
  List<NinElementarySegmentData> elementarySegments;
  List<ElementarySegmentGroupAdapter> gadElementarySegmentGroups =
      List<ElementarySegmentGroupAdapter>.empty(growable: true);

  final NinMajorTypeLECData majorTypeLec;

  MajorTypeLecAdapter(this.locale, this.majorTypeLec);
  Future getRelations() async {
    // print('Get Lec relations, majorTypeLec.id = ${majorTypeLec.id}');
    lec = await db.getLecById(majorTypeLec.lecId, locale);
    elementarySegments = await db.getElementarySegmentsByLec(lec.data);
    var elementarySegmentGroupIds =
        await db.getGadElementarySegmentGroupsIdsByMajorTypeLecId(majorTypeLec);

    for (var esg in elementarySegmentGroupIds) {
      var esga = ElementarySegmentGroupAdapter(locale, esg);
      await esga.getRelations();
      gadElementarySegmentGroups.add(esga);
    }
  }
}

class LecAdapter {
  final Locale locale;
  final NinLECData lec;
  Detailed<NinLECData> detailedLec;
  List<Detailed<NinElementarySegmentGroupDetailData>> elementarySegments;
  List<Detailed<NinMajorTypeData>> majorTypes;

  LecAdapter(this.locale, this.lec);
  Future getRelations() async {
    var ess = await db.getElementarySegmentsGroupDetailsByLec(lec);
    elementarySegments = await Detailed<NinElementarySegmentGroupDetailData>()
        .fromList(ess, locale);
    detailedLec = await Detailed<NinLECData>().initialize(lec, locale);
    majorTypes = await db.getMajorTypesByLec(lec.id, locale);
  }
}

class MinorTypeScaledAdapter {
  final NinMappingScaleData mappingScale;
  final String minorTypeScaledId;
  final Locale locale;
  List<MinorTypeAdapter> minorTypes;
  String name;
  List<NinDetailData> details;

  MinorTypeScaledAdapter(
      this.locale, this.mappingScale, this.minorTypeScaledId);
  Future getRelations() async {
    Timeline.startSync('Get Minor types by minor type scaled id');
    var minorTypesData =
        await db.getMinorTypesByMajorTypeScaledId(minorTypeScaledId, locale);
    Timeline.finishSync();
    var res = List<MinorTypeAdapter>.empty(growable: true);
    for (var minorType in minorTypesData) {
      Timeline.startSync('Initialize Minor type adapter');
      var item = MinorTypeAdapter(locale, minorType);
      await item.getRelations();
      Timeline.finishSync();
      res.add(item);
    }
    minorTypes = res;
    // Get details
    var allDetails =
        await db.getDetailsForMinorTypeScaled(minorTypeScaledId, locale);
    var nameDetail = allDetails.where((element) => element.key == '<name>');
    name = nameDetail.length == 0
        ? null
        : nameDetail.map((e) => e.value).join('/');
    print(name);
    allDetails.removeWhere((element) => element.key == '<name>');
    details = allDetails;
  }
}

class MinorTypeAdapter {
  final Locale locale;
  final Detailed<NinMinorTypeData> minorType;

  List<StandardSegmentAdapter> standardSegments;

  MinorTypeAdapter(this.locale, this.minorType);

  Future getRelations() async {
    Timeline.startSync('Get all standard segments');
    var standardSegmentsData =
        await db.getStandardSegmentsByMinorType(minorType.data, locale);
    Timeline.finishSync();
    var res = List<StandardSegmentAdapter>.empty(growable: true);
    for (var ss in standardSegmentsData) {
      // var majorTypeLec = await db.getMajorTypeLecByStandardSegment(ss.data);
      // var allElementarySegmentGroupIds = await db
      //     .getGadElementarySegmentGroupsIdsByMajorTypeLecId(majorTypeLec);
      var ssa = StandardSegmentAdapter(ss, locale, minorType.data.majorTypeId);
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
  List<MajorTypeLecAdapter> lecs;

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
      var res = MajorTypeLecAdapter(locale, element);
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
