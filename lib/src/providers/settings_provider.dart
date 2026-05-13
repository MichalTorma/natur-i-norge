import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

class SelectedScaleNotifier extends Notifier<String> {
  static const _key = 'selected_scale';

  @override
  String build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getString(_key) ?? 'Biologisk';
  }

  void setScale(String scale) {
    if (state == scale) return;
    state = scale;
    ref.read(sharedPreferencesProvider).setString(_key, scale);
  }
}

final selectedScaleProvider = NotifierProvider<SelectedScaleNotifier, String>(() {
  return SelectedScaleNotifier();
});

class AppThemeNotifier extends Notifier<AppTheme> {
  static const _key = 'app_theme';

  @override
  AppTheme build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final themeName = prefs.getString(_key);
    if (themeName == null) return AppTheme.dark;
    
    return AppTheme.values.firstWhere(
      (e) => e.name == themeName,
      orElse: () => AppTheme.dark,
    );
  }

  void setTheme(AppTheme theme) {
    if (state == theme) return;
    state = theme;
    ref.read(sharedPreferencesProvider).setString(_key, theme.name);
  }
}

final appThemeProvider = NotifierProvider<AppThemeNotifier, AppTheme>(() {
  return AppThemeNotifier();
});

class DisableImagesNotifier extends Notifier<bool> {
  static const _key = 'disable_images';

  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getBool(_key) ?? false;
  }

  void setDisableImages(bool value) {
    if (state == value) return;
    state = value;
    ref.read(sharedPreferencesProvider).setBool(_key, value);
  }
}

final disableImagesProvider = NotifierProvider<DisableImagesNotifier, bool>(() {
  return DisableImagesNotifier();
});

class ShowLkmNamesNotifier extends Notifier<bool> {
  static const _key = 'show_lkm_names';

  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getBool(_key) ?? true;
  }

  void setShowLkmNames(bool value) {
    if (state == value) return;
    state = value;
    ref.read(sharedPreferencesProvider).setBool(_key, value);
  }
}

final showLkmNamesProvider = NotifierProvider<ShowLkmNamesNotifier, bool>(() {
  return ShowLkmNamesNotifier();
});
