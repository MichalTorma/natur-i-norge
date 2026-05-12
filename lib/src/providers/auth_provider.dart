import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'settings_provider.dart';

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

    await ref.read(firebaseAuthProvider).signInWithCredential(credential);
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

class BackupSettingsNotifier extends Notifier<bool> {
  static const _key = 'backup_enabled';

  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getBool(_key) ?? false;
  }

  void setEnabled(bool enabled) {
    state = enabled;
    ref.read(sharedPreferencesProvider).setBool(_key, enabled);
  }
}

final backupEnabledProvider = NotifierProvider<BackupSettingsNotifier, bool>(() {
  return BackupSettingsNotifier();
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
