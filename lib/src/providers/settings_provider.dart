import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
