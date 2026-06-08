import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:drift/drift.dart' as drift;
import '../providers/database_provider.dart';
import '../models/user_database.dart';
import '../models/nin_database.dart';
import '../providers/auth_provider.dart';
import '../services/sync_service.dart';
import '../widgets/local_image.dart';
import '../navigation/app_routes.dart';

class ObservationReviewScreen extends ConsumerStatefulWidget {
  final String imagePath;
  final NinType? initialType;
  const ObservationReviewScreen({super.key, required this.imagePath, this.initialType});

  @override
  ConsumerState<ObservationReviewScreen> createState() => _ObservationReviewScreenState();
}

class _ObservationReviewScreenState extends ConsumerState<ObservationReviewScreen> {
  NinType? _selectedType;
  Position? _position;
  bool _isGettingLocation = true;
  String? _locationError;
  final TextEditingController _notesController = TextEditingController();
  bool _showNotes = false;
  StreamSubscription<Position>? _positionSubscription;
  final List<double> _accuracyHistory = [];
  Position? _bestPosition;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.initialType;
    _startLocationUpdates();
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _startLocationUpdates() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _locationError = 'Location services are disabled.';
          _isGettingLocation = false;
        });
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _locationError = 'Location permissions are denied.';
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

      // Start the stream for continuous high-accuracy updates
      _positionSubscription = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 0,
        ),
      ).listen((Position position) {
        if (mounted) {
          setState(() {
            _position = position;
            _accuracyHistory.add(position.accuracy);
            if (_accuracyHistory.length > 50) _accuracyHistory.removeAt(0);
            
            if (_bestPosition == null || position.accuracy < _bestPosition!.accuracy) {
              _bestPosition = position;
            }
            
            _isGettingLocation = false;
            _locationError = null;
          });
        }
      });
    } catch (e) {
      if (mounted) {
        setState(() {
          _locationError = 'GPS Error: $e';
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
              child: LocalObservationImage(
                imagePath: widget.imagePath,
                fit: BoxFit.cover,
                semanticLabel: 'Photo of the nature type observation',
              ),
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
                  
                  if (!_showNotes)
                    TextButton.icon(
                      onPressed: () => setState(() => _showNotes = true),
                      icon: const Icon(Icons.add_comment_outlined),
                      label: const Text('Add notes'),
                    )
                  else ...[
                    Text('NOTES', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _notesController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Add some details about this observation...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close, size: 18),
                          tooltip: 'Clear notes',
                          onPressed: () {
                            setState(() {
                              _showNotes = false;
                              _notesController.clear();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                  
                  const SizedBox(height: 24),
                  
                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: (_selectedType == null || _position == null) ? null : _handleSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        elevation: 8,
                        shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      icon: const Icon(Icons.check_circle_rounded),
                      label: const Text(
                        'SAVE OBSERVATION',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1.5),
                      ),
                    ),
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
    if (_isGettingLocation && _position == null) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          children: [
            SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
            SizedBox(width: 12),
            Text('Acquiring precise location...'),
          ],
        ),
      );
    }

    if (_locationError != null && _position == null) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red.withOpacity(0.5)),
        ),
        child: Row(
          children: [
            const Icon(Icons.location_off, color: Colors.red),
            const SizedBox(width: 12),
            Expanded(child: Text(_locationError!, style: const TextStyle(color: Colors.red, fontSize: 13))),
            IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Refresh location',
              onPressed: _startLocationUpdates,
            ),
          ],
        ),
      );
    }

    final isAccurate = _position != null && _position!.accuracy <= 10.0;
    final bestAccurate = _bestPosition != null && _bestPosition!.accuracy <= 10.0;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bestAccurate 
            ? Colors.green.withOpacity(0.1) 
            : Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: bestAccurate ? Colors.green : Colors.orange,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                bestAccurate ? Icons.gps_fixed : Icons.gps_not_fixed,
                color: bestAccurate ? Colors.green : Colors.orange,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                bestAccurate ? 'Best Location Locked' : 'Awaiting precision...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: bestAccurate ? Colors.green[700] : Colors.orange[700],
                ),
              ),
              if (_isGettingLocation) ...[
                const SizedBox(width: 8),
                const SizedBox(width: 12, height: 12, child: CircularProgressIndicator(strokeWidth: 1.5)),
              ],
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Current: ±${_position!.accuracy.toStringAsFixed(1)}m',
                    style: TextStyle(fontSize: 10, color: isAccurate ? Colors.green : Colors.orange),
                  ),
                  Text(
                    'BEST: ±${_bestPosition!.accuracy.toStringAsFixed(1)}m',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Accuracy Graph
          SizedBox(
            height: 40,
            width: double.infinity,
            child: CustomPaint(
              painter: AccuracyGraphPainter(
                history: _accuracyHistory,
                themeColor: bestAccurate ? Colors.green : Colors.orange,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'BEST GPS: ${_bestPosition!.latitude.toStringAsFixed(6)}, ${_bestPosition!.longitude.toStringAsFixed(6)}',
            style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }


  Future<void> _pickType() async {
    Navigator.push(
      context,
      AppRoutes.types(
        onPick: (type) {
          setState(() => _selectedType = type);
          Navigator.of(context).popUntil(
            (route) => route.settings.name == 'observation_review',
          );
        },
      ),
    );
  }

  Future<void> _handleSave() async {
    if (_bestPosition == null) return;

    if (_bestPosition!.accuracy > 10.0) {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Low Accuracy Warning'),
          content: Text(
            'GPS accuracy is currently ${_position!.accuracy.toStringAsFixed(1)}m. '
            'It is recommended to wait for accuracy below 10m for professional mapping. '
            '\n\nSave anyway?'
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Wait'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Save Anyway'),
            ),
          ],
        ),
      );

      if (confirm != true) return;
    }

    _saveObservation();
  }

  Future<void> _saveObservation() async {
    final db = ref.read(userDatabaseProvider);
    
    await db.into(db.observations).insert(
      ObservationsCompanion.insert(
        typeId: _selectedType!.id,
        imagePath: widget.imagePath,
        latitude: _bestPosition!.latitude,
        longitude: _bestPosition!.longitude,
        altitude: drift.Value(_bestPosition!.altitude),
        accuracy: _bestPosition!.accuracy,
        notes: drift.Value(_notesController.text),
        ownerUid: drift.Value(ref.read(authProvider)?.uid),
      ),
    );

    // Trigger sync immediately
    ref.read(syncServiceProvider.notifier).syncNow();

    if (mounted) {
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }
}

class AccuracyGraphPainter extends CustomPainter {
  final List<double> history;
  final Color themeColor;

  AccuracyGraphPainter({required this.history, required this.themeColor});

  @override
  void paint(Canvas canvas, Size size) {
    if (history.isEmpty) return;

    final paint = Paint()
      ..color = themeColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [themeColor.withOpacity(0.3), themeColor.withOpacity(0.0)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    final fillPath = Path();

    // Find range
    double maxAcc = 30.0; // Fixed scale for 10m target
    for (var acc in history) {
      if (acc > maxAcc) maxAcc = acc;
    }

    final xStep = size.width / (history.length > 1 ? history.length - 1 : 1);
    
    for (int i = 0; i < history.length; i++) {
      // Invert Y so lower accuracy (smaller number) is HIGHER on the graph
      final y = size.height * (history[i] / maxAcc);
      
      if (i == 0) {
        path.moveTo(0, y);
        fillPath.moveTo(0, size.height);
        fillPath.lineTo(0, y);
      } else {
        path.lineTo(i * xStep, y);
        fillPath.lineTo(i * xStep, y);
      }
    }

    fillPath.lineTo((history.length - 1) * xStep, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);
    
    // Draw 10m target line
    final targetY = size.height * (10.0 / maxAcc);
    final targetPaint = Paint()
      ..color = Colors.green.withOpacity(0.5)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
    
    canvas.drawLine(Offset(0, targetY), Offset(size.width, targetY), targetPaint);
  }

  @override
  bool shouldRepaint(covariant AccuracyGraphPainter oldDelegate) => true;
}


