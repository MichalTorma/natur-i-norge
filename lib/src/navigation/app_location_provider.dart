import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_location.dart';
import 'route_frame.dart';

class AppLocationNotifier extends Notifier<AppLocation> {
  final List<List<RouteFrame>> _tabStacks =
      List.generate(AppLocation.tabNames.length, (index) => [RouteFrame(name: _rootName(index))]);
  final List<RouteFrame> _rootStack = [];
  int _tabIndex = 0;
  bool _suppressUrlSync = false;

  static String _rootName(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return 'types_root';
      case 1:
        return 'variables_root';
      case 2:
        return 'favorites_root';
      case 3:
        return 'gallery_root';
      case 4:
        return 'settings_root';
      default:
        return 'types_root';
    }
  }

  bool get suppressUrlSync => _suppressUrlSync;

  @override
  AppLocation build() => _snapshot();

  AppLocation _snapshot() => AppLocation(
        tabIndex: _tabIndex,
        tabStack: List.unmodifiable(_tabStacks[_tabIndex]),
        rootStack: List.unmodifiable(_rootStack),
      );

  void setTab(int index) {
    if (index < 0 || index >= AppLocation.tabNames.length) return;
    if (_tabIndex == index) return;
    _tabIndex = index;
    state = _snapshot();
  }

  void updateTabStack(int tabIndex, List<RouteFrame> stack) {
    if (tabIndex < 0 || tabIndex >= AppLocation.tabNames.length) return;
    _tabStacks[tabIndex] = stack.isEmpty
        ? [RouteFrame(name: _rootName(tabIndex))]
        : List<RouteFrame>.from(stack);
    state = _snapshot();
  }

  void updateRootStack(List<RouteFrame> stack) {
    _rootStack
      ..clear()
      ..addAll(stack);
    state = _snapshot();
  }

  Future<T> runWithoutUrlSync<T>(Future<T> Function() action) async {
    _suppressUrlSync = true;
    try {
      return await action();
    } finally {
      _suppressUrlSync = false;
    }
  }
}

final appLocationProvider = NotifierProvider<AppLocationNotifier, AppLocation>(
  AppLocationNotifier.new,
);
