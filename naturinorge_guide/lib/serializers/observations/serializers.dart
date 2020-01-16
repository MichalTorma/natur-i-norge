library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:naturinorge_guide/serializers/observations/arts_observation.dart';
import 'package:naturinorge_guide/serializers/observations/observations.dart';
import 'package:naturinorge_guide/serializers/observations/property_url.dart';
import 'package:naturinorge_guide/serializers/search_location/crs.dart';
import 'package:naturinorge_guide/serializers/search_location/crs_property.dart';
import 'package:naturinorge_guide/serializers/search_location/feature_geometry.dart';
import 'package:naturinorge_guide/serializers/search_location/feature_property.dart';
import 'package:naturinorge_guide/serializers/search_location/features.dart';
import 'package:naturinorge_guide/serializers/search_location/search_location.dart';
import 'package:naturinorge_guide/serializers/taxons/accepted_name_usage.dart';
import 'package:naturinorge_guide/serializers/taxons/arts_taxon.dart';
import 'package:naturinorge_guide/serializers/taxons/dynamic_properties.dart';

part 'serializers.g.dart';

/// Example of how to use built_value serialization.
///
/// Declare a top level [Serializers] field called serializers. Annotate it
/// with [SerializersFor] and provide a `const` `List` of types you want to
/// be serializable.
///
/// The built_value code generator will provide the implementation. It will
/// contain serializers for all the types asked for explicitly plus all the
/// types needed transitively via fields.
///
/// You usually only need to do this once per project.
@SerializersFor([
  ArtsObservation,
  Observations,
  PropertyUrl,
  AcceptedNameUsage,
  ArtsTaxon,
  DynamicProperties,
  CrsProperty,
  Crs,
  FeatureGeometry,
  FeatureProperty,
  Features,
  SearchLocation
])
final Serializers serializers = _$serializers;
Serializers standardSerializers =
(serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();