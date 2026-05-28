import 'package:flutter/material.dart';
import 'models/nin_database.dart';

/// Accent color for each NiN hierarchy level, kept distinct for quick scanning.
Color ninCategoryAccentColor(String kategori) {
  switch (kategori) {
    case 'Type':
      return const Color(0xFF1565C0);
    case 'Hovedtypegruppe':
      return const Color(0xFF4527A0);
    case 'Hovedtype':
      return const Color(0xFF2E7D32);
    case 'Grunntype':
      return const Color(0xFFE65100);
    case 'Kartleggingsenhet':
      return const Color(0xFF00838F);
    default:
      return Colors.blueGrey;
  }
}

Color ninTypeAccentColor(NinType type) => ninCategoryAccentColor(type.kategori);

/// Top-level categories use icon-style imagery; lower levels use cover photos.
bool ninTypeUsesIconLayout(NinType type) {
  switch (type.kategori) {
    case 'Type':
    case 'Hovedtypegruppe':
    case 'Hovedtype':
      return true;
    default:
      return false;
  }
}
