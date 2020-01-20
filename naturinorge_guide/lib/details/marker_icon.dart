import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart' as images;
import 'package:naturinorge_guide/details/map_marker.dart';
import 'package:dart_numerics/dart_numerics.dart' as numerics;

const int maxThumbnailWidth = 200;
const int minThumbnailWidth = 100;
const int markerThumbnailWidth = 70;

class MarkerIconGenerator {
  BitmapDescriptor icon =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
  Map<int, BitmapDescriptor> buffer = Map<int, BitmapDescriptor>();
  images.Image image;
  MarkerIconGenerator() {
    _createImage("circle.png").then((newImage) => image = newImage);
    _createImage("marker-tree.png").then((newImage){
      var singleIcon = images.copyResize(newImage, width: markerThumbnailWidth, height: markerThumbnailWidth);
      var png = images.encodePng(singleIcon);
      icon = BitmapDescriptor.fromBytes(png);
    });
  }

  BitmapDescriptor createClusterBitmapDescriptor(MapMarker feature) {
    if (!feature.isCluster) {
      return icon;
    }
    if (buffer.keys.contains(feature.pointsSize)) {
      return buffer[feature.pointsSize];
    }

    int thumbnailWidth = (minThumbnailWidth + ((maxThumbnailWidth - minThumbnailWidth) * (numerics.tanh(feature.pointsSize.toDouble()/100) ))).round();
    // print(thumbnailWidth);
    var child =
        images.copyResize(image, width: thumbnailWidth, height: thumbnailWidth);

    if (child == null) {
      return null;
    }

    // images.brightness(child, -50);
    var yPos =  (thumbnailWidth/2 - 24).round();
    var xPos = (thumbnailWidth/2 - (feature.pointsSize.toString().length /2 * 24)).round();
    images.drawString(child, images.arial_48, xPos, yPos, '${feature.pointsSize}');

    var resized =
        images.copyResize(child, width: thumbnailWidth, height: thumbnailWidth);

    var png = images.encodePng(resized);
    var res = BitmapDescriptor.fromBytes(png);
    buffer[feature.pointsSize] = res;
    return res;
  }

  Future<images.Image> _createImage(String imageFile) async {
    ByteData imageData;
    try {
      imageData = await rootBundle.load('assets/$imageFile');
    } catch (e) {
      print('caught $e');
      return null;
    }

    if (imageData == null) {
      return null;
    }

    List<int> bytes = Uint8List.view(imageData.buffer);
    return images.decodeImage(bytes);
  }
}
