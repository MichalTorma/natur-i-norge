import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'settings_provider.dart';
import 'database_provider.dart';
import '../models/user_database.dart';
import 'package:drift/drift.dart';

enum CollisionType { none, anonymous, foreign }

class CollisionState {
  final CollisionType type;
  final int count;
  final String? foreignUid;

  CollisionState({this.type = CollisionType.none, this.count = 0, this.foreignUid});
}

class CollisionNotifier extends Notifier<CollisionState> {
  @override
  CollisionState build() => CollisionState();
  
  void setCollision(CollisionState value) => state = value;
}

final collisionProvider = NotifierProvider<CollisionNotifier, CollisionState>(() {
  return CollisionNotifier();
});

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// The actual user stream
final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

// A legacy-style provider for easy reading of current state
final authProvider = Provider<User?>((ref) {
  return ref.watch(authStateProvider).value;
});

// The actions notifier
class AuthActionsNotifier extends Notifier<void> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void build() {}

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await ref.read(firebaseAuthProvider).signInWithCredential(credential);
    final user = userCredential.user;
    if (user == null) return;

    // Check for local data collisions
    final db = ref.read(userDatabaseProvider);
    
    // Find records that don't belong to this user
    final otherRecords = await (db.select(db.observations)
          ..where((t) => t.ownerUid.equals(user.uid).not()))
        .get();

    if (otherRecords.isNotEmpty) {
      final hasAnonymous = otherRecords.any((r) => r.ownerUid == null);
      final hasForeign = otherRecords.any((r) => r.ownerUid != null && r.ownerUid != user.uid);

      if (hasForeign) {
        ref.read(collisionProvider.notifier).setCollision(CollisionState(
          type: CollisionType.foreign,
          count: otherRecords.length,
          foreignUid: otherRecords.firstWhere((r) => r.ownerUid != null).ownerUid,
        ));
      } else if (hasAnonymous) {
        ref.read(collisionProvider.notifier).setCollision(CollisionState(
          type: CollisionType.anonymous,
          count: otherRecords.length,
        ));
      }
    }
  }

  Future<void> resolveCollision(bool merge) async {
    final user = ref.read(firebaseAuthProvider).currentUser;
    if (user == null) return;

    final db = ref.read(userDatabaseProvider);
    final collision = ref.read(collisionProvider);

    if (merge) {
      // Merge all non-foreign (anonymous) records into this user's account
      await (db.update(db.observations)..where((t) => t.ownerUid.isNull())).write(
        ObservationsCompanion(ownerUid: Value(user.uid)),
      );
    } else {
      // Clear ALL records that don't belong to this user
      await (db.delete(db.observations)..where((t) => t.ownerUid.equals(user.uid).not())).go();
    }

    // Reset collision state
    ref.read(collisionProvider.notifier).setCollision(CollisionState());
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await ref.read(firebaseAuthProvider).signOut();
  }

  Future<void> deleteAccount() async {
    final user = ref.read(firebaseAuthProvider).currentUser;
    if (user != null) {
      await user.delete();
      await _googleSignIn.signOut();
    }
  }
}

final authActionsProvider = NotifierProvider<AuthActionsNotifier, void>(() {
  return AuthActionsNotifier();
});

class ConsentShownNotifier extends Notifier<bool> {
  static const _key = 'backup_consent_shown';

  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getBool(_key) ?? false;
  }

  void setShown() {
    state = true;
    ref.read(sharedPreferencesProvider).setBool(_key, true);
  }
}

final consentShownProvider = NotifierProvider<ConsentShownNotifier, bool>(() {
  return ConsentShownNotifier();
});
