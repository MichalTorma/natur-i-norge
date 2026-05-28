import '../models/nin_database.dart';

/// NiN 3.0 Kode API URLs for individual types (see scripts/scrape_nin_data.py).
class NinApiSourceService {
  static const baseUrl = 'https://nin-kode-api.artsdatabanken.no/v3.0';

  /// Type-specific Kode API URL, or null when the API has no per-type endpoint.
  static String? typeApiUrl(NinType type) {
    switch (type.kategori) {
      case 'Grunntype':
        return '$baseUrl/typer/kodeforGrunntype/${type.id}';
      case 'Kartleggingsenhet':
        return '$baseUrl/typer/kodeforKartleggingsenhet/${type.id}';
      default:
        return null;
    }
  }
}
