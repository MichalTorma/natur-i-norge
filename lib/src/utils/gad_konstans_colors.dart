import 'package:flutter/material.dart';

/// Konstans scale 0–6 for GAD matrix overlay (one distinct color per step).
abstract final class GadKonstansColors {
  static const int maxValue = 6;

  static const List<Color> lightStops = [
    Color(0x00000000), // 0 — no fill
    Color(0xFFF1F8E9), // 1
    Color(0xFFDCEDC8), // 2
    Color(0xFFC5E1A5), // 3
    Color(0xFF81C784), // 4
    Color(0xFF43A047), // 5
    Color(0xFF1B5E20), // 6
  ];

  static const List<Color> darkStops = [
    Color(0x00000000), // 0
    Color(0xFF152218), // 1
    Color(0xFF1B3A24), // 2
    Color(0xFF245C32), // 3
    Color(0xFF2E7D32), // 4
    Color(0xFF43A047), // 5
    Color(0xFF81C784), // 6
  ];

  static List<Color> stopsFor(ColorScheme colorScheme) {
    return colorScheme.brightness == Brightness.dark ? darkStops : lightStops;
  }

  static Color colorFor(double value, ColorScheme colorScheme) {
    if (value <= 0) return Colors.transparent;

    final clamped = value.clamp(0, maxValue.toDouble());
    final stops = stopsFor(colorScheme);
    final lower = clamped.floor();
    final upper = clamped.ceil();

    if (lower >= stops.length - 1) return stops.last;
    if (lower == upper) return stops[lower];

    final fraction = clamped - lower.toDouble();
    return Color.lerp(stops[lower], stops[upper], fraction)!;
  }
}
