import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/database_provider.dart';
import '../models/user_database.dart';
import 'camera_screen.dart';
import 'gallery_map_screen.dart';
import 'observation_detail_screen.dart';

class GalleryScreen extends ConsumerWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final observationsAsync = ref.watch(observationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Observations'),
        actions: [
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const GalleryMapScreen()),
              );
            },
          ),
          PopupMenuButton<ObservationSortMode>(
            icon: const Icon(Icons.sort),
            onSelected: (mode) => ref.read(observationSortProvider.notifier).setMode(mode),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: ObservationSortMode.dateDesc,
                child: Text('Newest First'),
              ),
              const PopupMenuItem(
                value: ObservationSortMode.dateAsc,
                child: Text('Oldest First'),
              ),
              const PopupMenuItem(
                value: ObservationSortMode.typeAlpha,
                child: Text('By Type Code'),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.add_a_photo),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CameraScreen()),
              );
            },
          ),
        ],
      ),
      body: observationsAsync.when(
        data: (observations) {
          if (observations.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.photo_library_outlined, size: 64, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2)),
                  const SizedBox(height: 16),
                  const Text('No observations yet'),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CameraScreen()),
                      );
                    },
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Take your first photo'),
                  ),
                ],
              ),
            );
          }

          final sortMode = ref.watch(observationSortProvider);
          
          if (sortMode == ObservationSortMode.typeAlpha) {
            // Grouping logic
            final groups = <String, List<ObservationWithType>>{};
            for (var obs in observations) {
              groups.putIfAbsent(obs.observation.typeId, () => []).add(obs);
            }
            
            final sortedKeys = groups.keys.toList()..sort();
            
            return CustomScrollView(
              slivers: [
                for (var key in sortedKeys) ...[
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            key,
                            style: TextStyle(
                              fontSize: 18, 
                              fontWeight: FontWeight.bold, 
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          Text(
                            groups[key]!.first.type?.navn ?? 'Unknown Type',
                            style: TextStyle(
                              fontSize: 14, 
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.8,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => _ObservationCard(observationWithType: groups[key]![index]),
                        childCount: groups[key]!.length,
                      ),
                    ),
                  ),
                ],
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.8,
            ),
            itemCount: observations.length,
            itemBuilder: (context, index) {
              final obs = observations[index];
              return _ObservationCard(observationWithType: obs);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CameraScreen()),
          );
        },
        icon: const Icon(Icons.camera_alt),
        label: const Text('Capture'),
      ),
    );
  }
}

class _ObservationCard extends StatelessWidget {
  final ObservationWithType observationWithType;
  const _ObservationCard({required this.observationWithType});

  @override
  Widget build(BuildContext context) {
    final observation = observationWithType.observation;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ObservationDetailScreen(observationWithType: observationWithType),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'obs_image_${observation.id}',
                    child: Image.file(
                      File(observation.imagePath),
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.broken_image)),
                    ),
                  ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      observation.typeId,
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('yyyy-MM-dd HH:mm').format(observation.createdAt),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 12, color: Colors.red),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '${observation.latitude.toStringAsFixed(4)}, ${observation.longitude.toStringAsFixed(4)}',
                        style: const TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (observation.notes != null && observation.notes!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    observation.notes!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}
