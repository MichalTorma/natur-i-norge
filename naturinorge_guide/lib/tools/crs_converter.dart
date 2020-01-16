// Copyright 2018 Google LLC.

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

// https://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class CrsConverter {
  static List<double> DatumEqRad = [
    6378137.0,
    6378137.0,
    6378137.0,
    6378135.0,
    6378160.0,
    6378245.0,
    6378206.4,
    6378388.0,
    6378388.0,
    6378249.1,
    6378206.4,
    6377563.4,
    6377397.2,
    6377276.3
  ];
  static List<double> DatumFlat = [
    298.2572236,
    298.2572236,
    298.2572215,
    298.2597208,
    298.2497323,
    298.2997381,
    294.9786982,
    296.9993621,
    296.9993621,
    293.4660167,
    294.9786982,
    299.3247788,
    299.1527052,
    300.8021499
  ];

  static int item = 0; // default
  static double a = DatumEqRad[item]; // equatorial radius (meters)
  static double f = 1 / DatumFlat[item]; // polar flattening
  static double drad = pi / 180; // convert degrees to radians

// Mor finalants, extracted from the function:
  static double k0 = 0.9996; // scale on central meridian
  static double b = a * (1 - f); // polar axis
  static double e = sqrt(1 - (b / a) * (b / a)); // eccentricity
  static double e0 = e / sqrt(1 - e * e); // called e' in reference
  static double esq = (1 - (b / a) * (b / a)); // e² for use in expansions
  static double e0sq = e * e / (1 - e * e); // e0² — always even powers

  static LatLng utmToLatLon(x, y, utmz, north) {
    // First some validation:
    // if (x < 160000 || x > 840000) {
    //   throw Exception("Outside permissible range of easting values.");
    // }
    if (y < 0) {
      throw Exception("Negative values are not allowed for northing.");
    }
    if (y > 10000000) {
      throw Exception("Northing may not exceed 10,000,000.");
    }

    // Now the actual calculation:
    final zcm = 3 + 6 * (utmz - 1) - 180; // central meridian of zone
    final e1 = (1 - sqrt(1 - e * e)) /
        (1 + sqrt(1 - e * e)); // called e₁ in USGS PP 1395
    final m0 =
        0; // in case origin other than zero lat - not needed for standard UTM

    var m; // arc length along standard meridian
    if (north) {
      m = m0 + y / k0;
    } else {
      // southern hemisphere
      m = m0 + (y - 10000000) / k0;
    }
    final mu = m / (a * (1 - esq * (1 / 4 + esq * (3 / 64 + 5 * esq / 256))));
    var phi1 = mu +
        e1 * (3 / 2 - 27 * e1 * e1 / 32) * sin(2 * mu) +
        e1 *
            e1 *
            (21 / 16 - 55 * e1 * e1 / 32) *
            sin(4 * mu); // footprint Latitude
    phi1 = phi1 +
        e1 * e1 * e1 * (sin(6 * mu) * 151 / 96 + e1 * sin(8 * mu) * 1097 / 512);
    final c1 = e0sq * pow(cos(phi1), 2);
    final t1 = pow(tan(phi1), 2);
    final n1 = a / sqrt(1 - pow(e * sin(phi1), 2));
    final r1 = n1 * (1 - e * e) / (1 - pow(e * sin(phi1), 2));
    final d = (x - 500000) / (n1 * k0);
    var phi = (d * d) *
        (1 / 2 - d * d * (5 + 3 * t1 + 10 * c1 - 4 * c1 * c1 - 9 * e0sq) / 24);
    phi = phi +
        pow(d, 6) *
            (61 +
                90 * t1 +
                298 * c1 +
                45 * t1 * t1 -
                252 * e0sq -
                3 * c1 * c1) /
            720;
    phi = phi1 - (n1 * tan(phi1) / r1) * phi;

    // Output Latitude:
    final outLat = 1000000 * phi ~/ drad / 1000000;

    final lng = d *
        (1 +
            d *
                d *
                ((-1 - 2 * t1 - c1) / 6 +
                    d *
                        d *
                        (5 -
                            2 * c1 +
                            28 * t1 -
                            3 * c1 * c1 +
                            8 * e0sq +
                            24 * t1 * t1) /
                        120)) /
        cos(phi1);
    final lngd = zcm + lng / drad;

    // Output Longitude:
    final outLon = (1000000 * lngd).toInt() / 1000000;

    return LatLng(outLat, outLon);
  }
}
