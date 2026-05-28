import 'package:flutter/material.dart';

/// A lightweight, serializable snapshot of one route in the navigation stack.
class RouteFrame {
  final String name;
  final Map<String, String> params;

  const RouteFrame({required this.name, this.params = const {}});

  factory RouteFrame.fromRoute(Route<dynamic> route) {
    final settings = route.settings;
    final args = settings.arguments;
    final params = args is Map<String, String>
        ? Map<String, String>.from(args)
        : args is Map
            ? args.map((key, value) => MapEntry(key.toString(), value.toString()))
            : <String, String>{};

    return RouteFrame(
      name: settings.name ?? route.runtimeType.toString(),
      params: params,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        if (params.isNotEmpty) 'params': params,
      };

  factory RouteFrame.fromJson(Map<String, dynamic> json) {
    final rawParams = json['params'];
    return RouteFrame(
      name: json['name'] as String,
      params: rawParams is Map
          ? rawParams.map((key, value) => MapEntry(key.toString(), value.toString()))
          : const {},
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteFrame &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          _mapEquals(params, other.params);

  @override
  int get hashCode => Object.hash(name, Object.hashAll(params.entries));

  static bool _mapEquals(Map<String, String> a, Map<String, String> b) {
    if (a.length != b.length) return false;
    for (final entry in a.entries) {
      if (b[entry.key] != entry.value) return false;
    }
    return true;
  }
}
