import 'package:flutter/material.dart';

import 'route_frame.dart';

/// Tracks the current route stack for one Navigator.
class AppRouteTracker extends NavigatorObserver {
  AppRouteTracker({required this.onStackChanged});

  final ValueChanged<List<RouteFrame>> onStackChanged;
  final List<Route<dynamic>> _stack = [];

  List<RouteFrame> get frames => _stack.map(RouteFrame.fromRoute).toList();

  void _notify() => onStackChanged(frames);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _stack.add(route);
    _notify();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _stack.remove(route);
    _notify();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _stack.remove(route);
    _notify();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (oldRoute != null) _stack.remove(oldRoute);
    if (newRoute != null) _stack.add(newRoute);
    _notify();
  }
}
