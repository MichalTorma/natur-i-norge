import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'settings_provider.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

class AuthNotifier extends StateNotifier<User?> {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthNotifier(this._auth) : super(_auth.currentUser) {
    _auth.authStateChanges().listen((user) {
      state = user;
    });
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<void> deleteAccount() async {
    final user = _auth.currentUser;
    if (user != null) {
      await user.delete();
      await _googleSignIn.signOut();
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier(ref.watch(firebaseAuthProvider));
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
