import 'route_frame.dart';

/// Serializable description of where the user is in the app.
class AppLocation {
  static const tabNames = ['types', 'variables', 'favorites', 'gallery', 'settings'];

  final int tabIndex;
  final List<RouteFrame> tabStack;
  final List<RouteFrame> rootStack;

  const AppLocation({
    required this.tabIndex,
    required this.tabStack,
    this.rootStack = const [],
  });

  factory AppLocation.initial(int tabIndex) {
    return AppLocation(
      tabIndex: tabIndex,
      tabStack: [RouteFrame(name: _tabRootName(tabIndex))],
    );
  }

  static String _tabRootName(int tabIndex) {
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

  String get tabName => tabNames[tabIndex.clamp(0, tabNames.length - 1)];

  RouteFrame? get activeFrame => tabStack.isNotEmpty ? tabStack.last : null;

  /// Hash path used for web deep links, e.g. `/types/NA-T01/NA-T02`.
  String toHashPath() {
    final buffer = StringBuffer('/$tabName');

    switch (tabIndex) {
      case 0:
        for (final frame in tabStack) {
          final typeId = frame.params['typeId'];
          if (frame.name == 'types' && typeId != null && typeId.isNotEmpty) {
            buffer.write('/$typeId');
          }
        }
      case 1:
        final variableId = _lastParam('variableId');
        if (variableId != null) buffer.write('/$variableId');
      case 3:
        for (final frame in tabStack) {
          switch (frame.name) {
            case 'gallery_map':
              buffer.write('/map');
            case 'observation_detail':
              final id = frame.params['observationId'];
              if (id != null) buffer.write('/observations/$id');
          }
        }
      default:
        break;
    }

    for (final frame in rootStack) {
      switch (frame.name) {
        case 'camera':
          buffer.write('/camera');
          final typeId = frame.params['typeId'];
          if (typeId != null && typeId.isNotEmpty) {
            buffer.write('/$typeId');
          }
        case 'observation_review':
          buffer.write('/review');
        case 'type_picker':
          buffer.write('/type-picker');
      }
    }

    return buffer.toString();
  }

  String? _lastParam(String key) {
    for (var i = tabStack.length - 1; i >= 0; i--) {
      final value = tabStack[i].params[key];
      if (value != null && value.isNotEmpty) return value;
    }
    return null;
  }

  static AppLocation? fromHashPath(String rawPath) {
    final segments = rawPath.split('/').where((segment) => segment.isNotEmpty).toList();
    if (segments.isEmpty) return null;

    final tabIndex = tabNames.indexOf(segments[0]);
    if (tabIndex == -1) return null;

    final tabStack = <RouteFrame>[RouteFrame(name: _tabRootName(tabIndex))];
    final rootStack = <RouteFrame>[];

    switch (tabIndex) {
      case 0:
        for (final typeId in segments.skip(1)) {
          if (_isRootOverlaySegment(typeId)) {
            _parseRootSegment(typeId, segments, rootStack);
            break;
          }
          tabStack.add(RouteFrame(name: 'types', params: {'typeId': typeId}));
        }
      case 1:
        if (segments.length > 1 && !_isRootOverlaySegment(segments[1])) {
          tabStack.add(
            RouteFrame(name: 'variable_detail', params: {'variableId': segments[1]}),
          );
        }
      case 3:
        var index = 1;
        while (index < segments.length) {
          final segment = segments[index];
          if (_isRootOverlaySegment(segment)) {
            _parseRootSegment(segment, segments.sublist(index), rootStack);
            break;
          }
          if (segment == 'map') {
            tabStack.add(const RouteFrame(name: 'gallery_map'));
            index++;
            continue;
          }
          if (segment == 'observations' && index + 1 < segments.length) {
            tabStack.add(
              RouteFrame(
                name: 'observation_detail',
                params: {'observationId': segments[index + 1]},
              ),
            );
            index += 2;
            continue;
          }
          index++;
        }
      default:
        for (final segment in segments.skip(1)) {
          if (_isRootOverlaySegment(segment)) {
            _parseRootSegment(segment, segments.sublist(segments.indexOf(segment)), rootStack);
            break;
          }
        }
    }

    return AppLocation(tabIndex: tabIndex, tabStack: tabStack, rootStack: rootStack);
  }

  static bool _isRootOverlaySegment(String segment) {
    return segment == 'camera' || segment == 'review' || segment == 'type-picker';
  }

  static void _parseRootSegment(
    String segment,
    List<String> remaining,
    List<RouteFrame> rootStack,
  ) {
    switch (segment) {
      case 'camera':
        final typeId = remaining.length > 1 ? remaining[1] : null;
        rootStack.add(RouteFrame(
          name: 'camera',
          params: typeId != null ? {'typeId': typeId} : const {},
        ));
      case 'review':
        rootStack.add(const RouteFrame(name: 'observation_review'));
      case 'type-picker':
        rootStack.add(const RouteFrame(name: 'type_picker'));
    }
  }

  Map<String, dynamic> toJson() => {
        'tab': tabName,
        'tabIndex': tabIndex,
        'tabStack': tabStack.map((frame) => frame.toJson()).toList(),
        if (rootStack.isNotEmpty)
          'rootStack': rootStack.map((frame) => frame.toJson()).toList(),
        'hashPath': toHashPath(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppLocation &&
          runtimeType == other.runtimeType &&
          tabIndex == other.tabIndex &&
          _listEquals(tabStack, other.tabStack) &&
          _listEquals(rootStack, other.rootStack);

  @override
  int get hashCode => Object.hash(tabIndex, Object.hashAll(tabStack), Object.hashAll(rootStack));

  static bool _listEquals(List<RouteFrame> a, List<RouteFrame> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
