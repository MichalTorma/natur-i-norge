import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../providers/database_provider.dart';
import '../models/user_database.dart';
import 'package:drift/drift.dart';

class SyncService {
  final Ref ref;
  
  SyncService(this.ref) {
    _init();
  }

  void _init() {
    // Listen to changes in backup status and auth state
    ref.listen(backupEnabledProvider, (previous, next) {
      if (next == true) _syncNow();
    });

    ref.listen(authProvider, (previous, next) {
      if (next != null && ref.read(backupEnabledProvider)) _syncNow();
    });

    // Also listen to database changes
    ref.listen(observationsProvider, (previous, next) {
      if (ref.read(backupEnabledProvider) && ref.read(authProvider) != null) {
        _syncNow();
      }
    });
  }

  bool _isSyncing = false;

  Future<void> _syncNow() async {
    if (_isSyncing) return;
    _isSyncing = true;

    try {
      final user = ref.read(authProvider);
      if (user == null) return;

      final db = ref.read(userDatabaseProvider);
      
      // Find unsynced observations
      final unsynced = await (db.select(db.observations)
            ..where((t) => t.isSynced.equals(false)))
          .get();

      for (final obs in unsynced) {
        await _syncObservation(obs, user.uid);
      }
    } finally {
      _isSyncing = false;
    }
  }

  Future<void> _syncObservation(Observation obs, String userId) async {
    final db = ref.read(userDatabaseProvider);
    final storage = FirebaseStorage.instance;
    final firestore = FirebaseFirestore.instance;

    try {
      // 1. Upload Image
      final file = File(obs.imagePath);
      if (!await file.exists()) {
        // If file is gone, mark as synced to avoid retry or handle error
        return;
      }

      final fileName = '${obs.id}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final ref = storage.ref().child('observations/$userId/$fileName');
      
      final uploadTask = await ref.putFile(
        file,
        SettableMetadata(contentType: 'image/jpeg'),
      );
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      // 2. Upload Metadata to Firestore
      await firestore.collection('observations').doc(obs.id.toString()).set({
        'userId': userId,
        'typeId': obs.typeId,
        'latitude': obs.latitude,
        'longitude': obs.longitude,
        'accuracy': obs.accuracy,
        'altitude': obs.altitude,
        'createdAt': obs.createdAt.toIso8601String(),
        'notes': obs.notes,
        'imageUrl': downloadUrl,
        'license': 'CC-BY-4.0', // Explicitly tagged as requested
        'publishedForScience': true,
      });

      // 3. Update Local DB
      await (db.update(db.observations)..where((t) => t.id.equals(obs.id))).write(
        ObservationsCompanion(
          isSynced: const Value(true),
          cloudUrl: Value(downloadUrl),
        ),
      );
      
      print('Synced observation ${obs.id} to cloud');
    } catch (e) {
      print('Error syncing observation ${obs.id}: $e');
    }
  }
}

final syncServiceProvider = Provider<SyncService>((ref) {
  return SyncService(ref);
});
