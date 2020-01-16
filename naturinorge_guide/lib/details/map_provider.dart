import 'package:fluster/fluster.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naturinorge_guide/api/arts_api.dart';
import 'package:naturinorge_guide/details/map_marker.dart';
import 'package:naturinorge_guide/serializers/observations/observations.dart';
import 'package:naturinorge_guide/serializers/search_location/features.dart';
import 'package:naturinorge_guide/serializers/taxons/arts_taxon.dart';
import 'package:naturinorge_guide/tools/crs_converter.dart';

class MapProvider extends ChangeNotifier {
  String _species;
  double _progress = null;
  bool _isLoading = false;
  List<ArtsTaxon> _taxons;
  Set<Marker> _markers = Set<Marker>();
  List<MapMarker> _flusterMarkers = [];
  int _currentZoom = 6;

  Fluster<MapMarker> fluster;
  void setSpecies(String species) {
    _species = species;
  }

  MapMarker _makeMapMarker(Features f) {
    return MapMarker(
      icon: BitmapDescriptor.defaultMarker,
      id: f.id,
      position: CrsConverter.utmToLatLon(f.geometry.coordinates[0].asNum,
          f.geometry.coordinates[1].asNum, 33, true),
    );
  }

  void cameraMoved(double zoom) {
    if(zoom.round() != _currentZoom && _flusterMarkers.length > 0){
      _currentZoom = zoom.round();
      showVisibleClusters();
      
    }
    
  }

  void showVisibleClusters() {
    _markers = fluster
      .clusters([-180, -85, 180, 85], _currentZoom)
      .map((cluster) => cluster.toMarker())
      .toSet();
      notifyListeners();
  }

  void loadObservations() async {
    if (_isLoading) return;
    _markers = Set<Marker>();
    notifyListeners();
    _taxons = await ArtsApi.getTaxon(_species);
    print('found ${_taxons.length} matching taxons');
    if (_taxons.length == 0) {
      throw Exception(
          "Unable to find $_species in Artsdatabanken taxa database");
    }
    if (_taxons.length > 1) {
      throw Exception(
          "multiple definisions for $_species in Artsdatabanken taxa database");
    }
    var taxon = _taxons[0];
    var locationSearch = await ArtsApi.getAllObservations(taxon);
    print('found ${locationSearch.features.length} observations');
    var pointFeatures =
        locationSearch.features.where((f) => f.geometry.type == "Point");
    _flusterMarkers = pointFeatures.map((f) => _makeMapMarker(f)).toList();
    print("${_markers.length} Markers loaded");

    fluster = Fluster<MapMarker>(
      minZoom: 1, // The min zoom at clusters will show
      maxZoom: 12, // The max zoom at clusters will show
      radius: 512, // Cluster radius in pixels
      extent: 8192, // Tile extent. Radius is calculated with it.
      nodeSize: 64, // Size of the KD-tree leaf node.
      points: _flusterMarkers, // The list of markers created before
      createCluster: (
        // Create cluster marker
        BaseCluster cluster,
        double lng,
        double lat,
      ) =>
          MapMarker(
        id: cluster.id.toString(),
        position: LatLng(lat, lng),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        isCluster: true,
        clusterId: cluster.id,
        pointsSize: cluster.pointsSize,
        childMarkerId: cluster.childMarkerId,
      ),
    );
    showVisibleClusters();
  }

  Set<Marker> get markers => _markers;
  double get progress => _progress;
  bool get isLoading => _isLoading;
}
