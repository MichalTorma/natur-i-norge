// GENERATED CODE - DO NOT MODIFY BY HAND

part of observations;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Observations> _$observationsSerializer =
    new _$ObservationsSerializer();

class _$ObservationsSerializer implements StructuredSerializer<Observations> {
  @override
  final Iterable<Type> types = const [Observations, _$Observations];
  @override
  final String wireName = 'Observations';

  @override
  Iterable<Object> serialize(Serializers serializers, Observations object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.species != null) {
      result
        ..add('species')
        ..add(serializers.serialize(object.species,
            specifiedType: const FullType(String)));
    }
    if (object.id != null) {
      result
        ..add('Id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.institution != null) {
      result
        ..add('Institution')
        ..add(serializers.serialize(object.institution,
            specifiedType: const FullType(String)));
    }
    if (object.institutionCode != null) {
      result
        ..add('InstitutionCode')
        ..add(serializers.serialize(object.institutionCode,
            specifiedType: const FullType(String)));
    }
    if (object.institutionUrl != null) {
      result
        ..add('InstitutionUrl')
        ..add(serializers.serialize(object.institutionUrl,
            specifiedType: const FullType(String)));
    }
    if (object.institutionLogoUrl != null) {
      result
        ..add('InstitutionLogoUrl')
        ..add(serializers.serialize(object.institutionLogoUrl,
            specifiedType: const FullType(String)));
    }
    if (object.collection != null) {
      result
        ..add('Collection')
        ..add(serializers.serialize(object.collection,
            specifiedType: const FullType(String)));
    }
    if (object.collectionCode != null) {
      result
        ..add('CollectionCode')
        ..add(serializers.serialize(object.collectionCode,
            specifiedType: const FullType(String)));
    }
    if (object.catalogNumber != null) {
      result
        ..add('CatalogNumber')
        ..add(serializers.serialize(object.catalogNumber,
            specifiedType: const FullType(String)));
    }
    if (object.detailUrl != null) {
      result
        ..add('DetailUrl')
        ..add(serializers.serialize(object.detailUrl,
            specifiedType: const FullType(String)));
    }
    if (object.collector != null) {
      result
        ..add('Collector')
        ..add(serializers.serialize(object.collector,
            specifiedType: const FullType(String)));
    }
    if (object.collectedDate != null) {
      result
        ..add('CollectedDate')
        ..add(serializers.serialize(object.collectedDate,
            specifiedType: const FullType(String)));
    }
    if (object.identifiedBy != null) {
      result
        ..add('IdentifiedBy')
        ..add(serializers.serialize(object.identifiedBy,
            specifiedType: const FullType(String)));
    }
    if (object.datetimeIdentified != null) {
      result
        ..add('DatetimeIdentified')
        ..add(serializers.serialize(object.datetimeIdentified,
            specifiedType: const FullType(String)));
    }
    if (object.basisOfRecord != null) {
      result
        ..add('BasisOfRecord')
        ..add(serializers.serialize(object.basisOfRecord,
            specifiedType: const FullType(String)));
    }
    if (object.taxonId != null) {
      result
        ..add('TaxonId')
        ..add(serializers.serialize(object.taxonId,
            specifiedType: const FullType(int)));
    }
    if (object.habitat != null) {
      result
        ..add('Habitat')
        ..add(serializers.serialize(object.habitat,
            specifiedType: const FullType(String)));
    }
    if (object.datasetId != null) {
      result
        ..add('DatasetId')
        ..add(serializers.serialize(object.datasetId,
            specifiedType: const FullType(String)));
    }
    if (object.datasetName != null) {
      result
        ..add('DatasetName')
        ..add(serializers.serialize(object.datasetName,
            specifiedType: const FullType(String)));
    }
    if (object.obsUrl != null) {
      result
        ..add('ObsUrl')
        ..add(serializers.serialize(object.obsUrl,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('Name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.scientificName != null) {
      result
        ..add('ScientificName')
        ..add(serializers.serialize(object.scientificName,
            specifiedType: const FullType(String)));
    }
    if (object.author != null) {
      result
        ..add('Author')
        ..add(serializers.serialize(object.author,
            specifiedType: const FullType(String)));
    }
    if (object.kingdom != null) {
      result
        ..add('kingdom')
        ..add(serializers.serialize(object.kingdom,
            specifiedType: const FullType(String)));
    }
    if (object.phylum != null) {
      result
        ..add('phylum')
        ..add(serializers.serialize(object.phylum,
            specifiedType: const FullType(String)));
    }
    if (object.klass != null) {
      result
        ..add('klass')
        ..add(serializers.serialize(object.klass,
            specifiedType: const FullType(String)));
    }
    if (object.order != null) {
      result
        ..add('order')
        ..add(serializers.serialize(object.order,
            specifiedType: const FullType(String)));
    }
    if (object.family != null) {
      result
        ..add('family')
        ..add(serializers.serialize(object.family,
            specifiedType: const FullType(String)));
    }
    if (object.genus != null) {
      result
        ..add('genus')
        ..add(serializers.serialize(object.genus,
            specifiedType: const FullType(String)));
    }
    if (object.subspecies != null) {
      result
        ..add('subspecies')
        ..add(serializers.serialize(object.subspecies,
            specifiedType: const FullType(String)));
    }
    if (object.specificEpithet != null) {
      result
        ..add('specificEpithet')
        ..add(serializers.serialize(object.specificEpithet,
            specifiedType: const FullType(String)));
    }
    if (object.infraspecificEpithet != null) {
      result
        ..add('infraspecificEpithet')
        ..add(serializers.serialize(object.infraspecificEpithet,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('Status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.typeObj != null) {
      result
        ..add('TypeObj')
        ..add(serializers.serialize(object.typeObj,
            specifiedType: const FullType(String)));
    }
    if (object.sex != null) {
      result
        ..add('Sex')
        ..add(serializers.serialize(object.sex,
            specifiedType: const FullType(String)));
    }
    if (object.count != null) {
      result
        ..add('Count')
        ..add(serializers.serialize(object.count,
            specifiedType: const FullType(String)));
    }
    if (object.notes != null) {
      result
        ..add('Notes')
        ..add(serializers.serialize(object.notes,
            specifiedType: const FullType(String)));
    }
    if (object.country != null) {
      result
        ..add('Country')
        ..add(serializers.serialize(object.country,
            specifiedType: const FullType(String)));
    }
    if (object.county != null) {
      result
        ..add('County')
        ..add(serializers.serialize(object.county,
            specifiedType: const FullType(String)));
    }
    if (object.countyId != null) {
      result
        ..add('CountyId')
        ..add(serializers.serialize(object.countyId,
            specifiedType: const FullType(int)));
    }
    if (object.municipality != null) {
      result
        ..add('Municipality')
        ..add(serializers.serialize(object.municipality,
            specifiedType: const FullType(String)));
    }
    if (object.municipalityId != null) {
      result
        ..add('MunicipalityId')
        ..add(serializers.serialize(object.municipalityId,
            specifiedType: const FullType(int)));
    }
    if (object.locality != null) {
      result
        ..add('Locality')
        ..add(serializers.serialize(object.locality,
            specifiedType: const FullType(String)));
    }
    if (object.longitude != null) {
      result
        ..add('Longitude')
        ..add(serializers.serialize(object.longitude,
            specifiedType: const FullType(String)));
    }
    if (object.latitude != null) {
      result
        ..add('Latitude')
        ..add(serializers.serialize(object.latitude,
            specifiedType: const FullType(String)));
    }
    if (object.precision != null) {
      result
        ..add('Precision')
        ..add(serializers.serialize(object.precision,
            specifiedType: const FullType(String)));
    }
    if (object.footprintWKT != null) {
      result
        ..add('FootprintWKT')
        ..add(serializers.serialize(object.footprintWKT,
            specifiedType: const FullType(String)));
    }
    if (object.east != null) {
      result
        ..add('East')
        ..add(serializers.serialize(object.east,
            specifiedType: const FullType(double)));
    }
    if (object.north != null) {
      result
        ..add('North')
        ..add(serializers.serialize(object.north,
            specifiedType: const FullType(double)));
    }
    if (object.projection != null) {
      result
        ..add('Projection')
        ..add(serializers.serialize(object.projection,
            specifiedType: const FullType(int)));
    }
    if (object.info != null) {
      result
        ..add('Info')
        ..add(serializers.serialize(object.info,
            specifiedType: const FullType(String)));
    }
    if (object.propertyUrls != null) {
      result
        ..add('PropertyUrls')
        ..add(serializers.serialize(object.propertyUrls,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PropertyUrl)])));
    }
    if (object.thumbImgUrls != null) {
      result
        ..add('ThumbImgUrls')
        ..add(serializers.serialize(object.thumbImgUrls,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.behavior != null) {
      result
        ..add('Behavior')
        ..add(serializers.serialize(object.behavior,
            specifiedType: const FullType(String)));
    }
    if (object.otherCatalogNumbers != null) {
      result
        ..add('OtherCatalogNumbers')
        ..add(serializers.serialize(object.otherCatalogNumbers,
            specifiedType: const FullType(String)));
    }
    if (object.trackDateTime != null) {
      result
        ..add('TrackDateTime')
        ..add(serializers.serialize(object.trackDateTime,
            specifiedType: const FullType(String)));
    }
    if (object.scientificNameId != null) {
      result
        ..add('ScientificNameId')
        ..add(serializers.serialize(object.scientificNameId,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Observations deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ObservationsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'species':
          result.species = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Institution':
          result.institution = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'InstitutionCode':
          result.institutionCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'InstitutionUrl':
          result.institutionUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'InstitutionLogoUrl':
          result.institutionLogoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Collection':
          result.collection = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'CollectionCode':
          result.collectionCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'CatalogNumber':
          result.catalogNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'DetailUrl':
          result.detailUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Collector':
          result.collector = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'CollectedDate':
          result.collectedDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'IdentifiedBy':
          result.identifiedBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'DatetimeIdentified':
          result.datetimeIdentified = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'BasisOfRecord':
          result.basisOfRecord = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'TaxonId':
          result.taxonId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Habitat':
          result.habitat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'DatasetId':
          result.datasetId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'DatasetName':
          result.datasetName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ObsUrl':
          result.obsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ScientificName':
          result.scientificName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'kingdom':
          result.kingdom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phylum':
          result.phylum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'klass':
          result.klass = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'family':
          result.family = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'genus':
          result.genus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subspecies':
          result.subspecies = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'specificEpithet':
          result.specificEpithet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'infraspecificEpithet':
          result.infraspecificEpithet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'TypeObj':
          result.typeObj = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Sex':
          result.sex = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Notes':
          result.notes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'County':
          result.county = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'CountyId':
          result.countyId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Municipality':
          result.municipality = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'MunicipalityId':
          result.municipalityId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Locality':
          result.locality = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Precision':
          result.precision = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'FootprintWKT':
          result.footprintWKT = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'East':
          result.east = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'North':
          result.north = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'Projection':
          result.projection = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Info':
          result.info = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'PropertyUrls':
          result.propertyUrls.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PropertyUrl)]))
              as BuiltList<Object>);
          break;
        case 'ThumbImgUrls':
          result.thumbImgUrls.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'Behavior':
          result.behavior = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'OtherCatalogNumbers':
          result.otherCatalogNumbers = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'TrackDateTime':
          result.trackDateTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ScientificNameId':
          result.scientificNameId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Observations extends Observations {
  @override
  final String species;
  @override
  final String id;
  @override
  final String institution;
  @override
  final String institutionCode;
  @override
  final String institutionUrl;
  @override
  final String institutionLogoUrl;
  @override
  final String collection;
  @override
  final String collectionCode;
  @override
  final String catalogNumber;
  @override
  final String detailUrl;
  @override
  final String collector;
  @override
  final String collectedDate;
  @override
  final String identifiedBy;
  @override
  final String datetimeIdentified;
  @override
  final String basisOfRecord;
  @override
  final int taxonId;
  @override
  final String habitat;
  @override
  final String datasetId;
  @override
  final String datasetName;
  @override
  final String obsUrl;
  @override
  final String name;
  @override
  final String scientificName;
  @override
  final String author;
  @override
  final String kingdom;
  @override
  final String phylum;
  @override
  final String klass;
  @override
  final String order;
  @override
  final String family;
  @override
  final String genus;
  @override
  final String subspecies;
  @override
  final String specificEpithet;
  @override
  final String infraspecificEpithet;
  @override
  final String status;
  @override
  final String typeObj;
  @override
  final String sex;
  @override
  final String count;
  @override
  final String notes;
  @override
  final String country;
  @override
  final String county;
  @override
  final int countyId;
  @override
  final String municipality;
  @override
  final int municipalityId;
  @override
  final String locality;
  @override
  final String longitude;
  @override
  final String latitude;
  @override
  final String precision;
  @override
  final String footprintWKT;
  @override
  final double east;
  @override
  final double north;
  @override
  final int projection;
  @override
  final String info;
  @override
  final BuiltList<PropertyUrl> propertyUrls;
  @override
  final BuiltList<String> thumbImgUrls;
  @override
  final String behavior;
  @override
  final String otherCatalogNumbers;
  @override
  final String trackDateTime;
  @override
  final int scientificNameId;

  factory _$Observations([void Function(ObservationsBuilder) updates]) =>
      (new ObservationsBuilder()..update(updates)).build();

  _$Observations._(
      {this.species,
      this.id,
      this.institution,
      this.institutionCode,
      this.institutionUrl,
      this.institutionLogoUrl,
      this.collection,
      this.collectionCode,
      this.catalogNumber,
      this.detailUrl,
      this.collector,
      this.collectedDate,
      this.identifiedBy,
      this.datetimeIdentified,
      this.basisOfRecord,
      this.taxonId,
      this.habitat,
      this.datasetId,
      this.datasetName,
      this.obsUrl,
      this.name,
      this.scientificName,
      this.author,
      this.kingdom,
      this.phylum,
      this.klass,
      this.order,
      this.family,
      this.genus,
      this.subspecies,
      this.specificEpithet,
      this.infraspecificEpithet,
      this.status,
      this.typeObj,
      this.sex,
      this.count,
      this.notes,
      this.country,
      this.county,
      this.countyId,
      this.municipality,
      this.municipalityId,
      this.locality,
      this.longitude,
      this.latitude,
      this.precision,
      this.footprintWKT,
      this.east,
      this.north,
      this.projection,
      this.info,
      this.propertyUrls,
      this.thumbImgUrls,
      this.behavior,
      this.otherCatalogNumbers,
      this.trackDateTime,
      this.scientificNameId})
      : super._();

  @override
  Observations rebuild(void Function(ObservationsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ObservationsBuilder toBuilder() => new ObservationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Observations &&
        species == other.species &&
        id == other.id &&
        institution == other.institution &&
        institutionCode == other.institutionCode &&
        institutionUrl == other.institutionUrl &&
        institutionLogoUrl == other.institutionLogoUrl &&
        collection == other.collection &&
        collectionCode == other.collectionCode &&
        catalogNumber == other.catalogNumber &&
        detailUrl == other.detailUrl &&
        collector == other.collector &&
        collectedDate == other.collectedDate &&
        identifiedBy == other.identifiedBy &&
        datetimeIdentified == other.datetimeIdentified &&
        basisOfRecord == other.basisOfRecord &&
        taxonId == other.taxonId &&
        habitat == other.habitat &&
        datasetId == other.datasetId &&
        datasetName == other.datasetName &&
        obsUrl == other.obsUrl &&
        name == other.name &&
        scientificName == other.scientificName &&
        author == other.author &&
        kingdom == other.kingdom &&
        phylum == other.phylum &&
        klass == other.klass &&
        order == other.order &&
        family == other.family &&
        genus == other.genus &&
        subspecies == other.subspecies &&
        specificEpithet == other.specificEpithet &&
        infraspecificEpithet == other.infraspecificEpithet &&
        status == other.status &&
        typeObj == other.typeObj &&
        sex == other.sex &&
        count == other.count &&
        notes == other.notes &&
        country == other.country &&
        county == other.county &&
        countyId == other.countyId &&
        municipality == other.municipality &&
        municipalityId == other.municipalityId &&
        locality == other.locality &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        precision == other.precision &&
        footprintWKT == other.footprintWKT &&
        east == other.east &&
        north == other.north &&
        projection == other.projection &&
        info == other.info &&
        propertyUrls == other.propertyUrls &&
        thumbImgUrls == other.thumbImgUrls &&
        behavior == other.behavior &&
        otherCatalogNumbers == other.otherCatalogNumbers &&
        trackDateTime == other.trackDateTime &&
        scientificNameId == other.scientificNameId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, species.hashCode), id.hashCode), institution.hashCode), institutionCode.hashCode), institutionUrl.hashCode), institutionLogoUrl.hashCode), collection.hashCode), collectionCode.hashCode), catalogNumber.hashCode), detailUrl.hashCode), collector.hashCode), collectedDate.hashCode), identifiedBy.hashCode), datetimeIdentified.hashCode), basisOfRecord.hashCode), taxonId.hashCode), habitat.hashCode), datasetId.hashCode), datasetName.hashCode), obsUrl.hashCode), name.hashCode), scientificName.hashCode), author.hashCode), kingdom.hashCode), phylum.hashCode), klass.hashCode), order.hashCode), family.hashCode), genus.hashCode), subspecies.hashCode), specificEpithet.hashCode), infraspecificEpithet.hashCode), status.hashCode), typeObj.hashCode), sex.hashCode), count.hashCode), notes.hashCode), country.hashCode),
                                                                                county.hashCode),
                                                                            countyId.hashCode),
                                                                        municipality.hashCode),
                                                                    municipalityId.hashCode),
                                                                locality.hashCode),
                                                            longitude.hashCode),
                                                        latitude.hashCode),
                                                    precision.hashCode),
                                                footprintWKT.hashCode),
                                            east.hashCode),
                                        north.hashCode),
                                    projection.hashCode),
                                info.hashCode),
                            propertyUrls.hashCode),
                        thumbImgUrls.hashCode),
                    behavior.hashCode),
                otherCatalogNumbers.hashCode),
            trackDateTime.hashCode),
        scientificNameId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Observations')
          ..add('species', species)
          ..add('id', id)
          ..add('institution', institution)
          ..add('institutionCode', institutionCode)
          ..add('institutionUrl', institutionUrl)
          ..add('institutionLogoUrl', institutionLogoUrl)
          ..add('collection', collection)
          ..add('collectionCode', collectionCode)
          ..add('catalogNumber', catalogNumber)
          ..add('detailUrl', detailUrl)
          ..add('collector', collector)
          ..add('collectedDate', collectedDate)
          ..add('identifiedBy', identifiedBy)
          ..add('datetimeIdentified', datetimeIdentified)
          ..add('basisOfRecord', basisOfRecord)
          ..add('taxonId', taxonId)
          ..add('habitat', habitat)
          ..add('datasetId', datasetId)
          ..add('datasetName', datasetName)
          ..add('obsUrl', obsUrl)
          ..add('name', name)
          ..add('scientificName', scientificName)
          ..add('author', author)
          ..add('kingdom', kingdom)
          ..add('phylum', phylum)
          ..add('klass', klass)
          ..add('order', order)
          ..add('family', family)
          ..add('genus', genus)
          ..add('subspecies', subspecies)
          ..add('specificEpithet', specificEpithet)
          ..add('infraspecificEpithet', infraspecificEpithet)
          ..add('status', status)
          ..add('typeObj', typeObj)
          ..add('sex', sex)
          ..add('count', count)
          ..add('notes', notes)
          ..add('country', country)
          ..add('county', county)
          ..add('countyId', countyId)
          ..add('municipality', municipality)
          ..add('municipalityId', municipalityId)
          ..add('locality', locality)
          ..add('longitude', longitude)
          ..add('latitude', latitude)
          ..add('precision', precision)
          ..add('footprintWKT', footprintWKT)
          ..add('east', east)
          ..add('north', north)
          ..add('projection', projection)
          ..add('info', info)
          ..add('propertyUrls', propertyUrls)
          ..add('thumbImgUrls', thumbImgUrls)
          ..add('behavior', behavior)
          ..add('otherCatalogNumbers', otherCatalogNumbers)
          ..add('trackDateTime', trackDateTime)
          ..add('scientificNameId', scientificNameId))
        .toString();
  }
}

class ObservationsBuilder
    implements Builder<Observations, ObservationsBuilder> {
  _$Observations _$v;

  String _species;
  String get species => _$this._species;
  set species(String species) => _$this._species = species;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _institution;
  String get institution => _$this._institution;
  set institution(String institution) => _$this._institution = institution;

  String _institutionCode;
  String get institutionCode => _$this._institutionCode;
  set institutionCode(String institutionCode) =>
      _$this._institutionCode = institutionCode;

  String _institutionUrl;
  String get institutionUrl => _$this._institutionUrl;
  set institutionUrl(String institutionUrl) =>
      _$this._institutionUrl = institutionUrl;

  String _institutionLogoUrl;
  String get institutionLogoUrl => _$this._institutionLogoUrl;
  set institutionLogoUrl(String institutionLogoUrl) =>
      _$this._institutionLogoUrl = institutionLogoUrl;

  String _collection;
  String get collection => _$this._collection;
  set collection(String collection) => _$this._collection = collection;

  String _collectionCode;
  String get collectionCode => _$this._collectionCode;
  set collectionCode(String collectionCode) =>
      _$this._collectionCode = collectionCode;

  String _catalogNumber;
  String get catalogNumber => _$this._catalogNumber;
  set catalogNumber(String catalogNumber) =>
      _$this._catalogNumber = catalogNumber;

  String _detailUrl;
  String get detailUrl => _$this._detailUrl;
  set detailUrl(String detailUrl) => _$this._detailUrl = detailUrl;

  String _collector;
  String get collector => _$this._collector;
  set collector(String collector) => _$this._collector = collector;

  String _collectedDate;
  String get collectedDate => _$this._collectedDate;
  set collectedDate(String collectedDate) =>
      _$this._collectedDate = collectedDate;

  String _identifiedBy;
  String get identifiedBy => _$this._identifiedBy;
  set identifiedBy(String identifiedBy) => _$this._identifiedBy = identifiedBy;

  String _datetimeIdentified;
  String get datetimeIdentified => _$this._datetimeIdentified;
  set datetimeIdentified(String datetimeIdentified) =>
      _$this._datetimeIdentified = datetimeIdentified;

  String _basisOfRecord;
  String get basisOfRecord => _$this._basisOfRecord;
  set basisOfRecord(String basisOfRecord) =>
      _$this._basisOfRecord = basisOfRecord;

  int _taxonId;
  int get taxonId => _$this._taxonId;
  set taxonId(int taxonId) => _$this._taxonId = taxonId;

  String _habitat;
  String get habitat => _$this._habitat;
  set habitat(String habitat) => _$this._habitat = habitat;

  String _datasetId;
  String get datasetId => _$this._datasetId;
  set datasetId(String datasetId) => _$this._datasetId = datasetId;

  String _datasetName;
  String get datasetName => _$this._datasetName;
  set datasetName(String datasetName) => _$this._datasetName = datasetName;

  String _obsUrl;
  String get obsUrl => _$this._obsUrl;
  set obsUrl(String obsUrl) => _$this._obsUrl = obsUrl;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _scientificName;
  String get scientificName => _$this._scientificName;
  set scientificName(String scientificName) =>
      _$this._scientificName = scientificName;

  String _author;
  String get author => _$this._author;
  set author(String author) => _$this._author = author;

  String _kingdom;
  String get kingdom => _$this._kingdom;
  set kingdom(String kingdom) => _$this._kingdom = kingdom;

  String _phylum;
  String get phylum => _$this._phylum;
  set phylum(String phylum) => _$this._phylum = phylum;

  String _klass;
  String get klass => _$this._klass;
  set klass(String klass) => _$this._klass = klass;

  String _order;
  String get order => _$this._order;
  set order(String order) => _$this._order = order;

  String _family;
  String get family => _$this._family;
  set family(String family) => _$this._family = family;

  String _genus;
  String get genus => _$this._genus;
  set genus(String genus) => _$this._genus = genus;

  String _subspecies;
  String get subspecies => _$this._subspecies;
  set subspecies(String subspecies) => _$this._subspecies = subspecies;

  String _specificEpithet;
  String get specificEpithet => _$this._specificEpithet;
  set specificEpithet(String specificEpithet) =>
      _$this._specificEpithet = specificEpithet;

  String _infraspecificEpithet;
  String get infraspecificEpithet => _$this._infraspecificEpithet;
  set infraspecificEpithet(String infraspecificEpithet) =>
      _$this._infraspecificEpithet = infraspecificEpithet;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _typeObj;
  String get typeObj => _$this._typeObj;
  set typeObj(String typeObj) => _$this._typeObj = typeObj;

  String _sex;
  String get sex => _$this._sex;
  set sex(String sex) => _$this._sex = sex;

  String _count;
  String get count => _$this._count;
  set count(String count) => _$this._count = count;

  String _notes;
  String get notes => _$this._notes;
  set notes(String notes) => _$this._notes = notes;

  String _country;
  String get country => _$this._country;
  set country(String country) => _$this._country = country;

  String _county;
  String get county => _$this._county;
  set county(String county) => _$this._county = county;

  int _countyId;
  int get countyId => _$this._countyId;
  set countyId(int countyId) => _$this._countyId = countyId;

  String _municipality;
  String get municipality => _$this._municipality;
  set municipality(String municipality) => _$this._municipality = municipality;

  int _municipalityId;
  int get municipalityId => _$this._municipalityId;
  set municipalityId(int municipalityId) =>
      _$this._municipalityId = municipalityId;

  String _locality;
  String get locality => _$this._locality;
  set locality(String locality) => _$this._locality = locality;

  String _longitude;
  String get longitude => _$this._longitude;
  set longitude(String longitude) => _$this._longitude = longitude;

  String _latitude;
  String get latitude => _$this._latitude;
  set latitude(String latitude) => _$this._latitude = latitude;

  String _precision;
  String get precision => _$this._precision;
  set precision(String precision) => _$this._precision = precision;

  String _footprintWKT;
  String get footprintWKT => _$this._footprintWKT;
  set footprintWKT(String footprintWKT) => _$this._footprintWKT = footprintWKT;

  double _east;
  double get east => _$this._east;
  set east(double east) => _$this._east = east;

  double _north;
  double get north => _$this._north;
  set north(double north) => _$this._north = north;

  int _projection;
  int get projection => _$this._projection;
  set projection(int projection) => _$this._projection = projection;

  String _info;
  String get info => _$this._info;
  set info(String info) => _$this._info = info;

  ListBuilder<PropertyUrl> _propertyUrls;
  ListBuilder<PropertyUrl> get propertyUrls =>
      _$this._propertyUrls ??= new ListBuilder<PropertyUrl>();
  set propertyUrls(ListBuilder<PropertyUrl> propertyUrls) =>
      _$this._propertyUrls = propertyUrls;

  ListBuilder<String> _thumbImgUrls;
  ListBuilder<String> get thumbImgUrls =>
      _$this._thumbImgUrls ??= new ListBuilder<String>();
  set thumbImgUrls(ListBuilder<String> thumbImgUrls) =>
      _$this._thumbImgUrls = thumbImgUrls;

  String _behavior;
  String get behavior => _$this._behavior;
  set behavior(String behavior) => _$this._behavior = behavior;

  String _otherCatalogNumbers;
  String get otherCatalogNumbers => _$this._otherCatalogNumbers;
  set otherCatalogNumbers(String otherCatalogNumbers) =>
      _$this._otherCatalogNumbers = otherCatalogNumbers;

  String _trackDateTime;
  String get trackDateTime => _$this._trackDateTime;
  set trackDateTime(String trackDateTime) =>
      _$this._trackDateTime = trackDateTime;

  int _scientificNameId;
  int get scientificNameId => _$this._scientificNameId;
  set scientificNameId(int scientificNameId) =>
      _$this._scientificNameId = scientificNameId;

  ObservationsBuilder();

  ObservationsBuilder get _$this {
    if (_$v != null) {
      _species = _$v.species;
      _id = _$v.id;
      _institution = _$v.institution;
      _institutionCode = _$v.institutionCode;
      _institutionUrl = _$v.institutionUrl;
      _institutionLogoUrl = _$v.institutionLogoUrl;
      _collection = _$v.collection;
      _collectionCode = _$v.collectionCode;
      _catalogNumber = _$v.catalogNumber;
      _detailUrl = _$v.detailUrl;
      _collector = _$v.collector;
      _collectedDate = _$v.collectedDate;
      _identifiedBy = _$v.identifiedBy;
      _datetimeIdentified = _$v.datetimeIdentified;
      _basisOfRecord = _$v.basisOfRecord;
      _taxonId = _$v.taxonId;
      _habitat = _$v.habitat;
      _datasetId = _$v.datasetId;
      _datasetName = _$v.datasetName;
      _obsUrl = _$v.obsUrl;
      _name = _$v.name;
      _scientificName = _$v.scientificName;
      _author = _$v.author;
      _kingdom = _$v.kingdom;
      _phylum = _$v.phylum;
      _klass = _$v.klass;
      _order = _$v.order;
      _family = _$v.family;
      _genus = _$v.genus;
      _subspecies = _$v.subspecies;
      _specificEpithet = _$v.specificEpithet;
      _infraspecificEpithet = _$v.infraspecificEpithet;
      _status = _$v.status;
      _typeObj = _$v.typeObj;
      _sex = _$v.sex;
      _count = _$v.count;
      _notes = _$v.notes;
      _country = _$v.country;
      _county = _$v.county;
      _countyId = _$v.countyId;
      _municipality = _$v.municipality;
      _municipalityId = _$v.municipalityId;
      _locality = _$v.locality;
      _longitude = _$v.longitude;
      _latitude = _$v.latitude;
      _precision = _$v.precision;
      _footprintWKT = _$v.footprintWKT;
      _east = _$v.east;
      _north = _$v.north;
      _projection = _$v.projection;
      _info = _$v.info;
      _propertyUrls = _$v.propertyUrls?.toBuilder();
      _thumbImgUrls = _$v.thumbImgUrls?.toBuilder();
      _behavior = _$v.behavior;
      _otherCatalogNumbers = _$v.otherCatalogNumbers;
      _trackDateTime = _$v.trackDateTime;
      _scientificNameId = _$v.scientificNameId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Observations other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Observations;
  }

  @override
  void update(void Function(ObservationsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Observations build() {
    _$Observations _$result;
    try {
      _$result = _$v ??
          new _$Observations._(
              species: species,
              id: id,
              institution: institution,
              institutionCode: institutionCode,
              institutionUrl: institutionUrl,
              institutionLogoUrl: institutionLogoUrl,
              collection: collection,
              collectionCode: collectionCode,
              catalogNumber: catalogNumber,
              detailUrl: detailUrl,
              collector: collector,
              collectedDate: collectedDate,
              identifiedBy: identifiedBy,
              datetimeIdentified: datetimeIdentified,
              basisOfRecord: basisOfRecord,
              taxonId: taxonId,
              habitat: habitat,
              datasetId: datasetId,
              datasetName: datasetName,
              obsUrl: obsUrl,
              name: name,
              scientificName: scientificName,
              author: author,
              kingdom: kingdom,
              phylum: phylum,
              klass: klass,
              order: order,
              family: family,
              genus: genus,
              subspecies: subspecies,
              specificEpithet: specificEpithet,
              infraspecificEpithet: infraspecificEpithet,
              status: status,
              typeObj: typeObj,
              sex: sex,
              count: count,
              notes: notes,
              country: country,
              county: county,
              countyId: countyId,
              municipality: municipality,
              municipalityId: municipalityId,
              locality: locality,
              longitude: longitude,
              latitude: latitude,
              precision: precision,
              footprintWKT: footprintWKT,
              east: east,
              north: north,
              projection: projection,
              info: info,
              propertyUrls: _propertyUrls?.build(),
              thumbImgUrls: _thumbImgUrls?.build(),
              behavior: behavior,
              otherCatalogNumbers: otherCatalogNumbers,
              trackDateTime: trackDateTime,
              scientificNameId: scientificNameId);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'propertyUrls';
        _propertyUrls?.build();
        _$failedField = 'thumbImgUrls';
        _thumbImgUrls?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Observations', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
