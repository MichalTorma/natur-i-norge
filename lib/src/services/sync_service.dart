import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:http/http.dart' as http;
import '../providers/auth_provider.dart';
import '../providers/database_provider.dart';
import '../models/user_database.dart';
import 'package:drift/drift.dart';

enum SyncStatus { idle, syncing, error }

class SyncService extends Notifier<SyncStatus> {
  bool _needsAnotherPass = false;

  @override
  SyncStatus build() {
    _init();
    return SyncStatus.idle;
  }

  void _init() {
    ref.listen(authProvider, (previous, next) {
      if (next != null) {
        syncNow();
        _restoreFromCloud();
      }
    });

    ref.listen(observationsProvider, (previous, next) {
      if (ref.read(authProvider) != null) {
        syncNow();
      }
    });
  }

  Future<void> _restoreFromCloud() async {
    final user = ref.read(authProvider);
    if (user == null) return;

    print('SyncService: Starting cloud restore...');
    
    try {
      final firestore = FirebaseFirestore.instance;
      final db = ref.read(userDatabaseProvider);
      final docs = await firestore.collection('observations')
          .where('userId', isEqualTo: user.uid)
          .get();

      if (docs.docs.isEmpty) {
        print('SyncService: No cloud records found to restore.');
        return;
      }

      final appDocDir = await getApplicationDocumentsDirectory();
      final observationsDir = Directory(p.join(appDocDir.path, 'observations'));
      if (!await observationsDir.exists()) {
        await observationsDir.create(recursive: true);
      }

      for (final doc in docs.docs) {
        final data = doc.data();
        final id = int.tryParse(doc.id);
        if (id == null) continue;

        // Check if already exists locally
        final existing = await (db.select(db.observations)..where((t) => t.id.equals(id))).getSingleOrNull();
        if (existing != null) continue;

        print('SyncService: Restoring observation $id...');

        // 1. Download image
        final imageUrl = data['imageUrl'] as String;
        final localPath = p.join(observationsDir.path, '${id}_restored.jpg');
        
        final response = await http.get(Uri.parse(imageUrl));
        if (response.statusCode == 200) {
          final file = File(localPath);
          await file.writeAsBytes(response.bodyBytes);

          // 2. Insert into local DB
          await db.into(db.observations).insert(
            ObservationsCompanion.insert(
              id: Value(id),
              typeId: data['typeId'] as String,
              imagePath: localPath,
              latitude: (data['latitude'] as num).toDouble(),
              longitude: (data['longitude'] as num).toDouble(),
              accuracy: (data['accuracy'] as num).toDouble(),
              altitude: Value((data['altitude'] as num?)?.toDouble()),
              createdAt: Value(DateTime.parse(data['createdAt'] as String)),
              notes: Value(data['notes'] as String?),
              isSynced: const Value(true),
              cloudUrl: Value(imageUrl),
            ),
          );
          print('SyncService: Successfully restored observation $id');
        }
      }
    } catch (e) {
      print('SyncService: Restore error: $e');
    }
  }

  Future<void> syncNow() async {
    if (state == SyncStatus.syncing) {
      _needsAnotherPass = true;
      return;
    }

    state = SyncStatus.syncing;

    try {
      final user = ref.read(authProvider);
      if (user == null) {
        state = SyncStatus.idle;
        return;
      }

      final db = ref.read(userDatabaseProvider);
      
      while (true) {
        _needsAnotherPass = false;
        
        final unsynced = await (db.select(db.observations)
              ..where((t) => t.isSynced.equals(false) & (t.ownerUid.equals(user.uid) | t.ownerUid.isNull())))
            .get();

        if (unsynced.isEmpty) break;

        print('SyncService: Found ${unsynced.length} records to sync.');

        for (final obs in unsynced) {
          await _syncObservation(obs, user.uid);
        }

        if (!_needsAnotherPass) break;
      }
      
      state = SyncStatus.idle;
    } catch (e) {
      print('Sync error: $e');
      state = SyncStatus.error;
    }
  }

  Future<void> _syncObservation(Observation obs, String userId) async {
    final db = ref.read(userDatabaseProvider);
    final storage = FirebaseStorage.instance;
    final firestore = FirebaseFirestore.instance;

    try {
      final file = File(obs.imagePath);
      if (!await file.exists()) {
        print('SyncService: Image not found for obs ${obs.id}, marking as synced.');
        await (db.update(db.observations)..where((t) => t.id.equals(obs.id))).write(
          const ObservationsCompanion(isSynced: Value(true)),
        );
        return;
      }

      final fileName = '${obs.id}_${obs.createdAt.millisecondsSinceEpoch}.jpg';
      final storageRef = storage.ref().child('observations/$userId/$fileName');
      
      String downloadUrl;
      try {
        downloadUrl = await storageRef.getDownloadURL();
      } catch (_) {
        print('SyncService: Uploading image for obs ${obs.id}...');
        final uploadTask = await storageRef.putFile(
          file,
          SettableMetadata(contentType: 'image/jpeg'),
        );
        downloadUrl = await uploadTask.ref.getDownloadURL();
      }

      print('SyncService: Updating Firestore metadata for obs ${obs.id}...');
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
        'license': 'CC-BY-4.0',
        'publishedForScience': true,
        'lastUpdated': FieldValue.serverTimestamp(),
      });

      await (db.update(db.observations)..where((t) => t.id.equals(obs.id))).write(
        ObservationsCompanion(
          isSynced: const Value(true),
          cloudUrl: Value(downloadUrl),
          ownerUid: Value(userId),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}

final syncServiceProvider = NotifierProvider<SyncService, SyncStatus>(() {
  return SyncService();
});
