import 'dart:typed_data';

import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:image/image.dart' as images;

class MapMarker extends Clusterable {
   final String id;
   final LatLng position;
MapMarker({
     @required this.id,
     @required this.position,
     isCluster = false,
     clusterId,
     pointsSize,
     childMarkerId,
   }) : super(
          markerId: id,
          latitude: position.latitude,
          longitude: position.longitude,
          isCluster: isCluster,
          clusterId: clusterId,
          pointsSize: pointsSize,
          childMarkerId: childMarkerId,
       );
Marker toMarker(BitmapDescriptor icon) => Marker(
         markerId: MarkerId(id),
         position: LatLng(
           position.latitude,
           position.longitude,
         ),
         icon: icon,
        );
  
}