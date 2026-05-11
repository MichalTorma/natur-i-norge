import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/screens/home_screen.dart';
import 'src/providers/settings_provider.dart';

import 'src/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
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
