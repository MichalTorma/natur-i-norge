import 'package:flutter/material.dart';

/// Konstans scale 0–6 for GAD matrix overlay (one distinct color per step).
abstract final class GadKonstansColors {
  static const int maxValue = 6;

  static const List<Color> lightStops = [
    Color(0x00000000), // 0 — no fill
    Color(0xFFC8E6C9), // 1 — green 200
    Color(0xFFA5D6A7), // 2 — green 300
    Color(0xFF81C784), // 3 — green 400
    Color(0xFF66BB6A), // 4 — green 400
    Color(0xFF43A047), // 5 — green 600
    Color(0xFF1B5E20), // 6 — green 900
  ];

  static const List<Color> darkStops = [
    Color(0x00000000), // 0
    Color(0xFF1B3A24), // 1
    Color(0xFF245C32), // 2
    Color(0xFF2E7D32), // 3
    Color(0xFF388E3C), // 4
    Color(0xFF43A047), // 5
    Color(0xFF66BB6A), // 6
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

  /// Semi-transparent tint between island background and labels.
  static Color tintFor(double value, ColorScheme colorScheme) {
    if (value <= 0) return Colors.transparent;

    final t = value.clamp(0, maxValue.toDouble()) / maxValue;
    final alpha = 0.42 + t * 0.38;
    return colorFor(value, colorScheme).withValues(alpha: alpha);
  }
}
