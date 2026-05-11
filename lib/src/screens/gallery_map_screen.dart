import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../models/user_database.dart';
import 'observation_detail_screen.dart';
import 'dart:io';

class GalleryMapScreen extends ConsumerWidget {
  const GalleryMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final observationsAsync = ref.watch(observationsProvider);
    final selectedLayer = ref.watch(mapLayerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Observation Map'),
        actions: [
          PopupMenuButton<MapLayer>(
            icon: const Icon(Icons.layers),
            onSelected: (layer) => ref.read(mapLayerProvider.notifier).setLayer(layer),
            itemBuilder: (context) => [
              const PopupMenuItem(value: MapLayer.norgeskart, child: Text('Norgeskart (Topo)')),
              const PopupMenuItem(value: MapLayer.osm, child: Text('OpenStreetMap')),
              const PopupMenuItem(value: MapLayer.openTopo, child: Text('OpenTopoMap')),
            ],
          ),
        ],
      ),
      body: observationsAsync.when(
        data: (observations) {
          if (observations.isEmpty) {
            return const Center(child: Text('No observations to show on map'));
          }

          // Calculate initial center (average of all points)
          double avgLat = 0;
          double avgLng = 0;
          for (var obsWithType in observations) {
            final obs = obsWithType.observation;
            avgLat += obs.latitude;
            avgLng += obs.longitude;
          }
          final center = LatLng(avgLat / observations.length, avgLng / observations.length);

          return FlutterMap(
            options: MapOptions(
              initialCenter: center,
              initialZoom: 10.0,
            ),
            children: [
              if (selectedLayer == MapLayer.norgeskart)
                TileLayer(
                  urlTemplate: 'https://cache.kartverket.no/v1/wmts/1.0.0/topo/default/webmercator/{z}/{y}/{x}.png',
                  userAgentPackageName: 'com.michaltorma.nin_guide',
                  tileProvider: CancellableNetworkTileProvider(),
                )
              else if (selectedLayer == MapLayer.osm)
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.michaltorma.nin_guide',
                )
              else if (selectedLayer == MapLayer.openTopo)
                TileLayer(
                  urlTemplate: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  userAgentPackageName: 'com.michaltorma.nin_guide',
                ),
              MarkerLayer(
                markers: observations.map((obsWithType) {
                  final obs = obsWithType.observation;
                  return Marker(
                    point: LatLng(obs.latitude, obs.longitude),
                    width: 40,
                    height: 40,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            settings: const RouteSettings(name: 'observation_detail'),
                            builder: (_) => ObservationDetailScreen(observationWithType: obsWithType),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
                        ),
                        child: const Icon(Icons.location_on, color: Colors.white, size: 20),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }

  void _showObservationPreview(BuildContext context, Observation obs) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(obs.imagePath),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox(height: 200, child: Center(child: Icon(Icons.broken_image))),
                ),
              ),
              const SizedBox(height: 16),
              Text(obs.typeId, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 4),
              Text('${obs.latitude.toStringAsFixed(4)}, ${obs.longitude.toStringAsFixed(4)}'),
              if (obs.notes != null && obs.notes!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(obs.notes!, style: const TextStyle(fontStyle: FontStyle.italic)),
              ],
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
