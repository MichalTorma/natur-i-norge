import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'src/screens/home_screen.dart';
import 'src/providers/settings_provider.dart';
import 'src/services/sync_service.dart';

import 'src/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
  );

  // Initialize SyncService
  container.read(syncServiceProvider);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const NinGuideApp(),
    ),
  );
}

class NinGuideApp extends ConsumerWidget {
  const NinGuideApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(appThemeProvider);
    
    return MaterialApp(
      title: 'NiN Guide 3.0',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.getTheme(currentTheme),
      home: const HomeScreen(),
    );
  }
}
