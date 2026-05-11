import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:drift/drift.dart' as drift;
import '../providers/database_provider.dart';
import '../models/user_database.dart';
import '../models/nin_database.dart';
import 'types_screen.dart';

class ObservationReviewScreen extends ConsumerStatefulWidget {
  final String imagePath;
  const ObservationReviewScreen({super.key, required this.imagePath});

  @override
  ConsumerState<ObservationReviewScreen> createState() => _ObservationReviewScreenState();
}

class _ObservationReviewScreenState extends ConsumerState<ObservationReviewScreen> {
  NinType? _selectedType;
  Position? _position;
  bool _isGettingLocation = true;
  String? _locationError;
  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _locationError = 'Location services are disabled.';
          _isGettingLocation = false;
        });
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _locationError = 'Location permissions are denied';
            _isGettingLocation = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _locationError = 'Location permissions are permanently denied.';
          _isGettingLocation = false;
        });
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );
      
      if (mounted) {
        setState(() {
          _position = position;
          _isGettingLocation = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _locationError = e.toString();
          _isGettingLocation = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Observation')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Preview
            AspectRatio(
              aspectRatio: 1,
              child: Image.file(File(widget.imagePath), fit: BoxFit.cover),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location Status
                  _buildLocationInfo(),
                  const SizedBox(height: 24),
                  
                  // Type Selection
                  Text('NATURE TYPE', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: _pickType,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.category, color: _selectedType != null ? Colors.green : Colors.grey),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _selectedType == null
                                ? const Text('Select NiN Type...', style: TextStyle(color: Colors.grey))
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(_selectedType!.id, style: const TextStyle(fontWeight: FontWeight.bold)),
                                      Text(_selectedType!.navn, style: const TextStyle(fontSize: 12)),
                                    ],
                                  ),
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Notes
                  Text('NOTES', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _notesController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Add some details about this observation...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Save Button
                  ElevatedButton(
                    onPressed: (_selectedType == null || _position == null) ? null : _saveObservation,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Save Observation', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInfo() {
    if (_isGettingLocation) {
      return const Row(
        children: [
          SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
          SizedBox(width: 12),
          Text('Acquiring precise location...'),
        ],
      );
    }

    if (_locationError != null) {
      return Row(
        children: [
          const Icon(Icons.location_off, color: Colors.red),
          const SizedBox(width: 12),
          Expanded(child: Text('Location error: $_locationError', style: const TextStyle(color: Colors.red))),
          IconButton(icon: const Icon(Icons.refresh), onPressed: _getLocation),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.gps_fixed, color: Colors.blue),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('GPS: ${_position!.latitude.toStringAsFixed(6)}, ${_position!.longitude.toStringAsFixed(6)}'),
              Text('Accuracy: ${_position!.accuracy.toStringAsFixed(1)}m', 
                style: TextStyle(
                  fontSize: 12, 
                  color: _position!.accuracy < 10 ? Colors.green : Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickType() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: const RouteSettings(name: 'type_picker'),
        builder: (context) => TypesScreen(
          onPick: (type) {
            setState(() => _selectedType = type);
            // Pop back to the start of the picker flow
            Navigator.of(context).popUntil((route) => route.settings.name == 'type_picker');
            Navigator.of(context).pop(); // Finally pop the picker itself
          },
        ),
      ),
    );
  }

  Future<void> _saveObservation() async {
    final db = ref.read(userDatabaseProvider);
    
    await db.into(db.observations).insert(
      ObservationsCompanion.insert(
        typeId: _selectedType!.id,
        imagePath: widget.imagePath,
        latitude: _position!.latitude,
        longitude: _position!.longitude,
        altitude: drift.Value(_position!.altitude),
        accuracy: _position!.accuracy,
        notes: drift.Value(_notesController.text),
      ),
    );

    if (mounted) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }
}


