import 'dart:ui';

import 'package:naturinorge_guide/db/nin_db.dart';
import 'package:naturinorge_guide/details/detailed_adapter.dart';

class StandardSegmentAdapter {
  final NiNDatabase db;
  final Locale locale;
  final Detailed<NinStandardSegmentData> standardSegment;
  List<NinElementarySegmentData> elementarySegments;
  LecAdapter lec;

  StandardSegmentAdapter(this.standardSegment, this.db, this.locale);
  Future getRelations() async {
    elementarySegments =
        await db.getElementarySegmentByStandardSegment(standardSegment.data);
    var majorTypeLec =
        await db.getMajorTypeLecByStandardSegment(standardSegment.data);
    lec = LecAdapter(db, locale, majorTypeLec);
    await lec.getRelations();
  }
}

class LecAdapter {
  final NiNDatabase db;
  final Locale locale;
  Detailed<NinLECData> lec;
  final NinMajorTypeLECData majorTypeLECData;

  LecAdapter(this.db, this.locale, this.majorTypeLECData);
  Future getRelations() async {
    lec = await db.getLecById(majorTypeLECData.lecTypeId, locale);
  }
}

class MinorTypeAdapter {
  final NiNDatabase db;
  final Locale locale;
  final Detailed<NinMinorTypeData> minorType;
  List<StandardSegmentAdapter> standardSegments;

  MinorTypeAdapter(this.minorType, this.db, this.locale);
  Future getRelations() async {
    var standardSegmentsOnly =
        await db.getStandardSegmentsByMinorType(minorType.data, locale);
    standardSegments = await Future.forEach(standardSegmentsOnly, (e) async {
      var res = StandardSegmentAdapter(e, db, locale);
      await res.getRelations();
      return res;
    });
  }
}

class MajorTypeAdapter {
  final Detailed<NinMajorTypeData> majorType;
  final NiNDatabase db;
  final Locale locale;
  List<MinorTypeAdapter> minorTypes;
  List<LecAdapter> lecs;
  List<StandardSegmentAdapter> standardSegments;

  MajorTypeAdapter(this.majorType, this.db, this.locale);

  Future getRelations() async {
    var minorTypeDatas =
        await db.getMinorTypesByMajorTypeId(majorType.data.id, locale);
    minorTypes = await Future.forEach(minorTypeDatas, (e) async {
      var res = MinorTypeAdapter(e, db, locale);
      await res.getRelations();
      return res;
    });
    var majorTypeLecs =
        await db.getMajorTypeLecByMajorTypeId(majorType.data.id);
    lecs = await Future.forEach(majorTypeLecs, (element) async {
      var res = LecAdapter(db, locale, element);
      await res.getRelations();
      return res;
    });
    var standardSegmentsData =
        await db.getStandardSegmentsByMajorType(majorType.data, locale);
    standardSegments = await Future.forEach(
        standardSegmentsData, (e) => StandardSegmentAdapter(e, db, locale));
  }
}
