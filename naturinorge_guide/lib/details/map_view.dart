import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naturinorge_guide/details/map_provider.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  
  MapView({Key key}) : super(key: key);

  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.terrain,
      markers: Provider.of<MapProvider>(context).markers,
        initialCameraPosition:
            CameraPosition(target: LatLng(63.990556, 12.3077779), zoom: 6),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          Provider.of<MapProvider>(context, listen: false).loadObservations();
        });
        
  }
}
