import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../navigation/app_location.dart';
import '../navigation/app_location_provider.dart';
import '../navigation/app_url_sync.dart';
import '../providers/settings_provider.dart';
import '../providers/gad_provider.dart';

class BugReportService {
  static const repoIssuesUrl = 'https://github.com/geco-nhm/natur-i-norge/issues/new';

  static Future<void> launch(WidgetRef ref) async {
    final location = ref.read(appLocationProvider);
    final packageInfo = ref.read(packageInfoProvider).asData?.value;
    final theme = ref.read(appThemeProvider);
    final scale = ref.read(selectedScaleProvider);
    final disableImages = ref.read(disableImagesProvider);
    final showLkmNames = ref.read(showLkmNamesProvider);
    final gadOverlayVisible = ref.read(gadOverlayVisibleProvider);

    final hashPath = location.toHashPath();
    final deepLink = buildWebDeepLink(hashPath);

    final contextJson = {
      'app': 'NiN Guide 3.0',
      if (packageInfo != null) ...{
        'version': packageInfo.version,
        'build': packageInfo.buildNumber,
      },
      'platform': _platformLabel(),
      'theme': theme.name,
      'selectedScale': scale,
      'disableImages': disableImages,
      'showLkmNames': showLkmNames,
      'gadOverlayVisible': gadOverlayVisible,
      'location': location.toJson(),
    };

    final body = '''
### Reproduction link
$deepLink

### App context
```json
${const JsonEncoder.withIndent('  ').convert(contextJson)}
```

### What happened
<!-- Describe the bug -->

### Expected behavior
<!-- What you expected instead -->

### Steps to reproduce
1. Open the reproduction link above
2. 
''';

    final title = '[Bug] Issue in ${location.tabName}${_locationSuffix(location)}';
    final uri = Uri.parse(repoIssuesUrl).replace(
      queryParameters: {
        'title': title,
        'body': body,
      },
    );

    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched) {
      throw Exception('Could not open GitHub issue URL');
    }
  }

  static String _platformLabel() {
    if (kIsWeb) return 'web';
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return 'android';
      case TargetPlatform.iOS:
        return 'ios';
      case TargetPlatform.macOS:
        return 'macos';
      case TargetPlatform.windows:
        return 'windows';
      case TargetPlatform.linux:
        return 'linux';
      case TargetPlatform.fuchsia:
        return 'fuchsia';
    }
  }

  static String _locationSuffix(AppLocation location) {
    final active = location.activeFrame;
    if (active == null) return '';

    switch (active.name) {
      case 'types':
        final typeId = active.params['typeId'];
        return typeId != null ? ' ($typeId)' : '';
      case 'variable_detail':
        final variableId = active.params['variableId'];
        return variableId != null ? ' ($variableId)' : '';
      case 'observation_detail':
        final observationId = active.params['observationId'];
        return observationId != null ? ' (observation $observationId)' : '';
      default:
        return active.name.endsWith('_root') ? '' : ' (${active.name})';
    }
  }
}
