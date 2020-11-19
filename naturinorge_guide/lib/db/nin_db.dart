import 'dart:io';
import 'dart:ui';

import 'package:flutter/services.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:moor/moor.dart';
// These imports are only needed to open the database
import 'package:moor/ffi.dart';
import 'package:naturinorge_guide/db/db_adapters.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'nin_db.g.dart';

@UseMoor(
  // relative import for the moor file. Moor also supports `package:`
  // imports
  daos: [],
  include: {'schema.moor'},
)
class NiNDatabase extends _$NiNDatabase {
  NiNDatabase() : super(_openConnection());
  // query's definitions
  Future<List<NinMajorTypeGroupData>> get allMajorTypeGroups =>
      select(ninMajorTypeGroup).get();

  Future<List<Detailed<NinMajorTypeData>>> filteredMajorTypes(
      String majorTypeGroupId, Locale locale) async {
    var majorTypes = await (select(ninMajorType)
          ..where((tbl) => tbl.majorTypeGroupId.equals(majorTypeGroupId)))
        .get();
    return await Detailed<NinMajorTypeData>().fromList(majorTypes, locale);
  }

  Future<List<NinDetailData>> getDetails(String detailId, Locale locale) async {
    var res = (select(ninDetail)
      ..where((tbl) => tbl.id.equals(detailId))
      ..where((tbl) => tbl.languageId.equals(locale.languageCode)));
    return res.get();
  }

  Future<List<NinMajorTypeLECData>> getMajorTypeLecByMajorTypeId(
      String majorTypeId) {
    return (select(ninMajorTypeLEC)
          ..where((tbl) => tbl.majorTypeId.equals(majorTypeId)))
        .get();
  }

  Future<NinMajorTypeLECData> getMajorTypeLecByStandardSegment(
          NinStandardSegmentData standardSegment) =>
      (select(ninMajorTypeLEC)
            ..where((tbl) => tbl.id.equals(standardSegment.majorTypeLECId)))
          .getSingle();

  Future<List<NinMappingScaleData>> getMappingScales() =>
      select(ninMappingScale).get();

  Future<NinMappingScaleData> getMappingScaleById(int id) =>
      (select(ninMappingScale)..where((tbl) => tbl.id.equals(id))).getSingle();

  Future<List<String>> getMinorTypeScaledIdsByMajorTypeAndScale(
      NinMajorTypeData majorType, NinMappingScaleData mappingScale) async {
    var minorTypes = (await (select(ninMinorType)
              ..where((tbl) => tbl.majorTypeId.equals(majorType.id)))
            .get())
        .map((e) => e.id);

    var minorTypesScaled = await (select(ninMinorTypeScaled)
          ..where((tbl) => tbl.minorTypeId.isIn(minorTypes))
          ..where((tbl) => tbl.mappingScaleId.equals(mappingScale.id)))
        .get();
    var res = minorTypesScaled.map((e) => e.id).toSet().toList();
    return res;
  }

  Future<List<Detailed<NinMinorTypeData>>> getMinorTypesByMajorTypeScaledId(
      String majorTypeSacledId, Locale locale) async {
    var minorTypeIds = await (select(ninMinorTypeScaled)
          ..where((tbl) => tbl.id.equals(majorTypeSacledId)))
        .get();
    var minorTypes = await (select(ninMinorType)
          ..where((tbl) => tbl.id.isIn(minorTypeIds.map((e) => e.minorTypeId))))
        .get();

    return Detailed<NinMinorTypeData>().fromList(minorTypes, locale);
  }
  // Future<List<Detailed<NinMinorTypeData>>> getMinorTypesByMajorTypeId(
  //     String majorTypeId, NinMappingScaleData scale, Locale locale) async {
  //   var minorTypesQuery = select(ninMinorType)
  //     ..where((tbl) => tbl.majorTypeId.equals(majorTypeId));
  //   var minorTypes = await minorTypesQuery.get();
  //   var res = Detailed<NinMinorTypeData>().fromList(minorTypes, locale);
  //   return await res;
  // }

  Future<List<Detailed<NinStandardSegmentData>>>
      getStandardSegmentsByMajorTypeLec(
          NinMajorTypeLECData majorTypeLEC, Locale locale) async {
    var standardSegments = await (select(ninStandardSegment)
          ..where((tbl) => tbl.majorTypeLECId.equals(majorTypeLEC.id)))
        .get();
    return await Detailed<NinStandardSegmentData>()
        .fromList(standardSegments, locale);
  }

  Future<List<Detailed<NinStandardSegmentData>>> getStandardSegmentsByMinorType(
      NinMinorTypeData minorType, Locale locale) async {
    var minorTypeStandardSegments = await (select(ninMinorTypeStandardSegment)
          ..where((tbl) => tbl.minorTypeId.equals(minorType.id)))
        .get();
    var standardSegments = await (select(ninStandardSegment)
          ..where((tbl) => tbl.id
              .isIn(minorTypeStandardSegments.map((e) => e.standardSegmentId))))
        .get();
    return await Detailed<NinStandardSegmentData>()
        .fromList(standardSegments, locale);
  }

  Future<List<Detailed<NinStandardSegmentData>>> getStandardSegmentsByMajorType(
      NinMajorTypeData majorType, Locale locale) async {
    var majorTypeLec = await (select(ninMajorTypeLEC)
          ..where((tbl) => tbl.majorTypeId.equals(majorType.id)))
        .get();
    var standardSegments = await (select(ninStandardSegment)
          ..where((tbl) =>
              tbl.majorTypeLECId.isIn(majorTypeLec.map((e) => e.id).toList())))
        .get();
    return await Detailed<NinStandardSegmentData>()
        .fromList(standardSegments, locale);
  }

  Future<NinElementarySegmentData> getElementarySegmentById(String id) =>
      (select(ninElementarySegment)..where((tbl) => tbl.id.equals(id)))
          .getSingle();

  Future<List<NinElementarySegmentData>>
      getElementarySegmentByElementarySegmentGroupId(
          String elementarySegmentGroupId) async {
    var elementarySegmentGroups = await (select(ninElementarySegmentGroup)
          ..where((tbl) => tbl.id.equals(elementarySegmentGroupId)))
        .get();
    var elementarySegmentIds =
        elementarySegmentGroups.map((e) => e.elementarySegmentId);
    return (select(ninElementarySegment)
          ..where((tbl) => tbl.id.isIn(elementarySegmentIds)))
        .get();
  }

  Future<List<NinElementarySegmentData>> getElementarySegmentByStandardSegment(
      NinStandardSegmentData standardSegment) async {
    var standardSegmentElements = await (select(ninStandardSegmentElement)
          ..where((tbl) => tbl.standardSegmentId.equals(standardSegment.id)))
        .get();
    var res = List<NinElementarySegmentData>();
    for (var es in standardSegmentElements) {
      res.add(await this.getElementarySegmentById(es.elementarySegmentId));
    }
    return res;
  }

  Future<List<String>> getGadElementarySegmentGroupIdsByStandardSegment(
      NinStandardSegmentData standardSegment,
      List<String> allElementarySegmentGroupIds,
      List<String> elementarySegments) async {
    var res = select(ninElementarySegmentGroup)
      ..where((tbl) => tbl.id.isIn(allElementarySegmentGroupIds))
      ..where((tbl) => tbl.elementarySegmentId.isIn(elementarySegments));
    return (await res.get()).map((e) => e.id).toSet().toList();
  }

  Future<List<Detailed<NinElementarySegmentGroupDetailData>>>
      getElementarySegmentsByElementarySegmentGroupId(
          String elementarySegmentGroupId, Locale locale) async {
    var elementarySegmentGroupDetails =
        await (select(ninElementarySegmentGroupDetail)
              ..where((tbl) => tbl.elementarySegmentGroupId
                  .equals(elementarySegmentGroupId)))
            .get();
    var res = List<Detailed<NinElementarySegmentGroupDetailData>>();
    for (var esgd in elementarySegmentGroupDetails) {
      var detailed = await Detailed<NinElementarySegmentGroupDetailData>()
          .initialize(esgd, locale);
      res.add(detailed);
    }
    return res;
  }

  Future<List<NinElementarySegmentData>> getElementarySegmentsByLec(
          NinLECData lec) =>
      (select(ninElementarySegment)..where((tbl) => tbl.lecId.equals(lec.id)))
          .get();

  Future<List<String>> getElementarySegmentGroupsByElementarySegments(
      List<NinElementarySegmentData> elementarySegments) async {
    var elementaryIds = elementarySegments.map((e) => e.id);
    var elementarySegmentGroups = await (select(ninElementarySegmentGroup)
          ..where((tbl) => tbl.elementarySegmentId.isIn(elementaryIds)))
        .get();
    var elementarySegmentGroupIds =
        elementarySegmentGroups.map((e) => e.id).toSet().toList();
    return elementarySegmentGroupIds;
  }

  Future<List<String>> getGadElementarySegmentGroupsIdsByMajorTypeLecId(
      String majorTypeLecId) async {
    var res = await (select(ninElementarySegmentCombination)
          ..where((tbl) => tbl.majorTypeLECId.equals(majorTypeLecId)))
        .get();
    return res.map((e) => e.elementarySegmentGroupId).toSet().toList();
  }

  Future<Detailed<NinLECData>> getLecById(String lecId, Locale locale) async {
    var lec = await (select(ninLEC)..where((tbl) => tbl.id.equals(lecId)))
        .getSingle();
    return await Detailed<NinLECData>().initialize(lec, locale);
  }

  @override
  int get schemaVersion => 3;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFile = await rootBundle.load('assets/nin_database.db');
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'nin3.sqlite'));
    await file.writeAsBytes(dbFile.buffer.asUint8List());
    return VmDatabase(file);
  });
}
