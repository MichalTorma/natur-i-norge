import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'src/app_license.dart';
import 'src/navigation/app_location_provider.dart';
import 'src/navigation/app_route_tracker.dart';
import 'src/screens/home_screen.dart';
import 'src/providers/settings_provider.dart';
import 'src/models/drift/web_init.dart';
import 'src/services/app_storage.dart';
import 'src/services/sync_service.dart';

import 'src/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerAppLicense();
  initAppStorage();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppStorage.instance.ensureInitialized();
  await ensureDriftWebReady();
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

class NinGuideApp extends ConsumerStatefulWidget {
  const NinGuideApp({super.key});

  @override
  ConsumerState<NinGuideApp> createState() => _NinGuideAppState();
}

class _NinGuideAppState extends ConsumerState<NinGuideApp> {
  late final AppRouteTracker _rootRouteTracker;

  @override
  void initState() {
    super.initState();
    _rootRouteTracker = AppRouteTracker(
      onStackChanged: (stack) {
        final overlayRoutes = stack.where((frame) {
          return frame.name == 'camera' ||
              frame.name == 'observation_review' ||
              frame.name == 'type_picker';
        }).toList();
        ref.read(appLocationProvider.notifier).updateRootStack(overlayRoutes);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(appThemeProvider);

    return MaterialApp(
      title: 'NiN Guide 3.0',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.getTheme(currentTheme),
      navigatorObservers: [_rootRouteTracker],
      home: const HomeScreen(),
    );
  }
}
