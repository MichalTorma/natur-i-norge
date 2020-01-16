import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naturinorge_guide/api/arts_api.dart';
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

  void setSpecies(String species) {
    _species = species;
  }

  void loadObservations() async {
    if (_isLoading) return;
    _markers = Set<Marker>();
    notifyListeners();
    _taxons = await ArtsApi.getTaxon(_species);
    print('found ${_taxons.length} matching taxons');

    for (ArtsTaxon taxon in _taxons) {
      _isLoading = true;
      notifyListeners();
      var firstPage = await ArtsApi.getObservationPage(taxon: taxon);
      var filteredObservations =
          firstPage.observations.where((m) => _shouldMakeMarker(m));
      _markers = _markers
          .union(filteredObservations.map((o) => _makeMarker(o)).toSet());
      _progress = 1 / firstPage.totalPages;
      print("$_progress : first out of ${firstPage.totalPages} loaded");
      notifyListeners();
      for (int pageId = 1; pageId < firstPage.totalPages; pageId++) {
        var page =
            await ArtsApi.getObservationPage(taxon: taxon, pageIndex: pageId);
        filteredObservations =
            page.observations.where((m) => _shouldMakeMarker(m));
        _markers = _markers
            .union(filteredObservations.map((o) => _makeMarker(o)).toSet());
        _progress = pageId / firstPage.totalPages;
        print(_progress);
        print(
            "$_progress : ${pageId + 1} out of ${firstPage.totalPages} loaded");
        notifyListeners();
      }
      _progress = null;
      _isLoading = false;
      notifyListeners();
      print("Finished");
    }
  }

  bool _shouldMakeMarker(Observations o) {
    if (o.latitude == null || o.longitude == null) return false;
    return true;
  }

  Marker _makeMarker(Observations o) {
    return Marker(
      markerId: MarkerId(o.id),
      position: LatLng(double.parse(o.latitude.replaceAll(',', '.')),
          double.parse(o.longitude.replaceAll(',', '.'))),
    );
  }

  Marker _makeMarker2(Features f) {
    return Marker(
      markerId: MarkerId(f.id),
      position: CrsConverter.utmToLatLon(
          f.geometry.coordinates[0].asNum, f.geometry.coordinates[1].asNum, 33, true),
    );
  }

  void loadObservationsv2() async {
    if (_isLoading) return;
    _markers = Set<Marker>();
    notifyListeners();
    _taxons = await ArtsApi.getTaxon(_species);
    print('found ${_taxons.length} matching taxons');
    for (ArtsTaxon taxon in _taxons) {
      var locationSearch = await ArtsApi.getAllObservations(taxon);
      print('found ${locationSearch.features.length} observations');
      var pointFeatures = locationSearch.features.where((f) => f.geometry.type == "Point");
      _markers = pointFeatures.map((f) => _makeMarker2(f)).toSet();
      print("${_markers.length} Markers loaded");
      notifyListeners();
    }
  }

  Set<Marker> get markers => _markers;
  double get progress => _progress;
  bool get isLoading => _isLoading;
}
