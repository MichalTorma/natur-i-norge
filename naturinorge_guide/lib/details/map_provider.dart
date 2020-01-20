import 'package:fluster/fluster.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naturinorge_guide/api/arts_api.dart';
import 'package:naturinorge_guide/details/map_marker.dart';
import 'package:naturinorge_guide/details/marker_icon.dart';
import 'package:naturinorge_guide/serializers/observations/observations.dart';
import 'package:naturinorge_guide/serializers/search_location/features.dart';
import 'package:naturinorge_guide/serializers/taxons/arts_taxon.dart';
import 'package:naturinorge_guide/tools/crs_converter.dart';

const double REPAINT_RATIO = 0.5;
class MapProvider extends ChangeNotifier {
  
  String _species;
  double _progress = null;
  bool _isLoading = false;
  List<ArtsTaxon> _taxons;
  Set<Marker> _markers = Set<Marker>();
  List<MapMarker> _flusterMarkers = [];
  CameraPosition _currentPosition = CameraPosition(target: LatLng(63.990556, 12.3077779), zoom: 5);
  CameraPosition _newPosition;
  GoogleMapController _controller;
  Fluster<MapMarker> fluster;
  List<double> _showingBoundary;
  MarkerIconGenerator _iconGenerator = MarkerIconGenerator();
  void setSpecies(String species) {
    _species = species;
  }

  void toggleLoading(bool isOn) {
    if (_isLoading != isOn) {
      _isLoading = isOn;
      notifyListeners();
    }
  }

  MapMarker _makeMapMarker(Features f) {
    return MapMarker(
      id: f.id,
      position: CrsConverter.utmToLatLon(f.geometry.coordinates[0].asNum,
          f.geometry.coordinates[1].asNum, 33, true),
    );
  }

  void cameraMoved(CameraPosition position) async {
    _newPosition = position;
    
    if(await _shouldRegenMarkers()){
      await showVisibleClusters();
    }
    

  }

  void cameraStopedMoving() async {
    print("cameraIdle");
    
    if (await _shouldRegenMarkers()) {
      _currentPosition = _newPosition;
      print("repaint");
      await showVisibleClusters();
    }
    
  }

  Future<bool> _shouldRegenMarkers() async{
    if (_isLoading){
      print("NO_GEN : aleready loading");
    }
    if (_showingBoundary == null){
      print("GEN : first");
      return true;
    }
    if (_newPosition.zoom.round() != _currentPosition.zoom.round()){
      print("GEN : different zoom level");
      return true;
    }
    var visibleBoudary = await _controller.getVisibleRegion();
    if (visibleBoudary.southwest.longitude < _showingBoundary[0]){
      print("GEN : SW lon too low");
      return true;
    }
    if (visibleBoudary.southwest.latitude < _showingBoundary[1]){
      print("GEN : SW lat too low");
      return true;
    }
    if (visibleBoudary.northeast.longitude > _showingBoundary[2]){
      print("GEN : NE lon too hi");
      return true;
    }
    if (visibleBoudary.northeast.latitude > _showingBoundary[3]){
      print("GEN : NE lat too low");
      return true;
    }
    print("NO_GEN : all si well");
    return false;
  }

  Future<void> showVisibleClusters() async {
    
    if (fluster == null){
      return;
    }
    toggleLoading(true);
    _showingBoundary = _getRepaintBoundary(await _controller.getVisibleRegion());
    _markers = fluster
        .clusters(_showingBoundary, _currentPosition.zoom.round())
        .map((cluster) => cluster.toMarker(_iconGenerator.createClusterBitmapDescriptor(cluster)))
        .toSet();
    print("Showing ${_markers.length} markers");
    notifyListeners();
    toggleLoading(false);
  }

  List<double> _getRepaintBoundary(LatLngBounds visibleBoundary) {
    var res = List<double>.generate(4, (_) => null);
    var lonStretch = REPAINT_RATIO * (visibleBoundary.northeast.longitude - visibleBoundary.southwest.longitude);
    var latStretch = REPAINT_RATIO * (visibleBoundary.northeast.latitude - visibleBoundary.southwest.latitude);
    res[0] = (visibleBoundary.southwest.longitude - lonStretch);
    res[0] = res[0] < -180 ? -180 : res[0];
    res[1] = (visibleBoundary.southwest.latitude - latStretch);
    res[1] = res[1] < -85 ? -85 : res[1];
    res[2] = (visibleBoundary.northeast.longitude + lonStretch);
    res[2] = res[2] > 180 ? 180 : res[2];
    res[3] = (visibleBoundary.northeast.latitude + latStretch);
    res[3] = res[3] > 85 ? 85 : res[3];

    return res;
  }

  void loadObservations() async {
    if (_isLoading) return;
    toggleLoading(true);
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
      radius: 1024, // Cluster radius in pixels
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
  CameraPosition get initialCameraPosition => _currentPosition;

  set setController(GoogleMapController controller) {
    _controller = controller;
  } 
}
