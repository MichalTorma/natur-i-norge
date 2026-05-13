import 'dart:io';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../providers/database_provider.dart';
import '../models/user_database.dart';
import '../providers/auth_provider.dart';
import 'gallery_map_screen.dart';

class ObservationDetailScreen extends ConsumerStatefulWidget {
  final ObservationWithType observationWithType;
  const ObservationDetailScreen({super.key, required this.observationWithType});

  @override
  ConsumerState<ObservationDetailScreen> createState() => _ObservationDetailScreenState();
}

class _ObservationDetailScreenState extends ConsumerState<ObservationDetailScreen> {
  late TextEditingController _notesController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.observationWithType.observation.notes);
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    final db = ref.read(userDatabaseProvider);
    final updatedObs = widget.observationWithType.observation.copyWith(
      notes: Value(_notesController.text),
      isSynced: false,
    );
    
    await db.update(db.observations).replace(updatedObs);
    
    if (mounted) {
      setState(() => _isEditing = false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Changes saved')));
    }
  }

  Future<void> _deleteObservation() async {
    final obs = widget.observationWithType.observation;
    final db = ref.read(userDatabaseProvider);
    final user = ref.read(authProvider);

    try {
      // 1. Cloud Deletion (if applicable)
      if (obs.isSynced && user != null) {
        // Delete Firestore doc
        await FirebaseFirestore.instance.collection('observations').doc(obs.id.toString()).delete();
        
        // Note: Full image cleanup from storage usually requires the path.
        // For MVP, deleting the Firestore record hides it from the science collection.
      }

      // 2. Local File Deletion
      final file = File(obs.imagePath);
      if (await file.exists()) {
        await file.delete();
      }

      // 3. Local DB Deletion
      await (db.delete(db.observations)..where((t) => t.id.equals(obs.id))).go();

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Observation deleted')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Delete failed: $e')));
      }
    }
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Observation?'),
        content: const Text(
          'This will remove the record from your phone and your private backup.\n\nNote: For scientific integrity, data already archived in Open Science repositories (like Zenodo) will remain in those archives.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteObservation();
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final obs = widget.observationWithType.observation;
    final type = widget.observationWithType.type;
    final selectedLayer = ref.watch(mapLayerProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Large Hero Image
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'obs_image_${obs.id}',
                child: Image.file(
                  File(obs.imagePath),
                  fit: BoxFit.cover,
                  semanticLabel: 'Full size photo of the observation',
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                tooltip: 'Delete this observation',
                onPressed: () => _showDeleteConfirmation(context),
              ),
              IconButton(
                icon: Icon(_isEditing ? Icons.save : Icons.edit),
                tooltip: _isEditing ? 'Save changes' : 'Edit observation notes',
                onPressed: () {
                  if (_isEditing) {
                    _saveChanges();
                  } else {
                    setState(() => _isEditing = true);
                  }
                },
              ),
            ],
          ),

          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Header Info
                Text(
                  obs.typeId,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  type?.navn ?? 'Unknown Type',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Recorded on ${obs.createdAt.toString().split('.')[0]}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: obs.isSynced 
                      ? Colors.green.withOpacity(0.1) 
                      : Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: obs.isSynced ? Colors.green.withOpacity(0.3) : Colors.orange.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        obs.isSynced ? Icons.cloud_done : Icons.cloud_off,
                        color: obs.isSynced ? Colors.green : Colors.orange,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              obs.isSynced ? 'Cloud Backup Active' : 'Local Only',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: obs.isSynced ? Colors.green : Colors.orange,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              obs.isSynced 
                                ? 'Observation published for science (CC-BY-4.0).'
                                : 'Sign in and enable backup to share this record.',
                              style: TextStyle(
                                fontSize: 11,
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 32),

                // Notes Section
                Text(
                  'NOTES',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                if (_isEditing)
                  TextField(
                    controller: _notesController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Add details...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  )
                else
                  Text(
                    obs.notes?.isEmpty ?? true ? 'No notes added.' : obs.notes!,
                    style: const TextStyle(fontSize: 16),
                  ),
                
                const SizedBox(height: 32),

                // Map Section
                Text(
                  'LOCATION',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 200,
                    child: Stack(
                      children: [
                        FlutterMap(
                          options: MapOptions(
                            initialCenter: LatLng(obs.latitude, obs.longitude),
                            initialZoom: 15.0,
                            interactionOptions: const InteractionOptions(flags: InteractiveFlag.none),
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
                              markers: [
                                Marker(
                                  point: LatLng(obs.latitude, obs.longitude),
                                  width: 40,
                                  height: 40,
                                  child: const Icon(Icons.location_on, color: Colors.red, size: 40),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Overlay to capture taps and open big map
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    settings: const RouteSettings(name: 'gallery_map'),
                                    builder: (_) => const GalleryMapScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'GPS: ${obs.latitude.toStringAsFixed(6)}, ${obs.longitude.toStringAsFixed(6)} (±${obs.accuracy.toStringAsFixed(1)}m)',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 100),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
