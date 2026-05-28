import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/nin_database.dart';
import '../providers/database_provider.dart';
import '../screens/camera_screen.dart';
import '../screens/gallery_map_screen.dart';
import '../screens/observation_detail_screen.dart';
import '../screens/observation_review_screen.dart';
import '../screens/types_screen.dart';
import '../screens/variable_detail_screen.dart';
import 'app_location.dart';
import 'route_frame.dart';

/// Central route factory with serializable [RouteSettings] for bug reports and deep links.
class AppRoutes {
  static RouteSettings settings(String name, [Map<String, String>? params]) {
    return RouteSettings(name: name, arguments: params);
  }

  static MaterialPageRoute<void> tabRoot(int tabIndex, Widget root) {
    return MaterialPageRoute<void>(
      settings: settings(AppLocation.initial(tabIndex).tabStack.first.name),
      builder: (_) => root,
    );
  }

  static MaterialPageRoute<void> types({
    NinType? type,
    ValueChanged<NinType>? onPick,
    String? highlightQuery,
  }) {
    return MaterialPageRoute<void>(
      settings: settings(
        onPick != null ? 'type_picker' : 'types',
        type != null
            ? {
                'typeId': type.id,
                if (highlightQuery != null && highlightQuery.isNotEmpty)
                  'highlightQuery': highlightQuery,
              }
            : null,
      ),
      builder: (_) => TypesScreen(
        type: type,
        onPick: onPick,
        highlightQuery: highlightQuery,
      ),
    );
  }

  static MaterialPageRoute<void> variableDetail(String variableId) {
    return MaterialPageRoute<void>(
      settings: settings('variable_detail', {'variableId': variableId}),
      builder: (_) => VariableDetailScreen(variableId: variableId),
    );
  }

  static MaterialPageRoute<void> galleryMap() {
    return MaterialPageRoute<void>(
      settings: settings('gallery_map'),
      builder: (_) => const GalleryMapScreen(),
    );
  }

  static MaterialPageRoute<void> observationDetail(ObservationWithType observationWithType) {
    return MaterialPageRoute<void>(
      settings: settings(
        'observation_detail',
        {'observationId': observationWithType.observation.id.toString()},
      ),
      builder: (_) => ObservationDetailScreen(observationWithType: observationWithType),
    );
  }

  static MaterialPageRoute<void> camera({NinType? initialType}) {
    return MaterialPageRoute<void>(
      settings: settings(
        'camera',
        initialType != null ? {'typeId': initialType.id} : null,
      ),
      builder: (_) => CameraScreen(initialType: initialType),
    );
  }

  static MaterialPageRoute<void> observationReview({
    required String imagePath,
    NinType? initialType,
  }) {
    return MaterialPageRoute<void>(
      settings: settings(
        'observation_review',
        initialType != null ? {'typeId': initialType.id} : null,
      ),
      builder: (_) => ObservationReviewScreen(
        imagePath: imagePath,
        initialType: initialType,
      ),
    );
  }

  static Future<Route<void>?> routeForFrame(
    RouteFrame frame,
    WidgetRef ref, {
    ValueChanged<NinType>? onPick,
  }) async {
    switch (frame.name) {
      case 'types_root':
      case 'types':
        final typeId = frame.params['typeId'];
        if (typeId == null || typeId.isEmpty) {
          return types(onPick: onPick);
        }
        final type = await ref.read(databaseProvider).getType(typeId);
        if (type == null) return types(onPick: onPick);
        return types(type: type, onPick: onPick);
      case 'variables_root':
        return null;
      case 'variable_detail':
        final variableId = frame.params['variableId'];
        if (variableId == null) return null;
        return variableDetail(variableId);
      case 'favorites_root':
      case 'gallery_root':
      case 'settings_root':
        return null;
      case 'gallery_map':
        return galleryMap();
      case 'observation_detail':
        final observationId = int.tryParse(frame.params['observationId'] ?? '');
        if (observationId == null) return null;
        final observations = await ref.read(observationsProvider.future);
        final match = observations.where((item) => item.observation.id == observationId);
        if (match.isEmpty) return null;
        return observationDetail(match.first);
      case 'camera':
        final typeId = frame.params['typeId'];
        if (typeId == null || typeId.isEmpty) return camera();
        final type = await ref.read(databaseProvider).getType(typeId);
        return camera(initialType: type);
      case 'type_picker':
        return types(onPick: onPick);
      default:
        return null;
    }
  }
}
