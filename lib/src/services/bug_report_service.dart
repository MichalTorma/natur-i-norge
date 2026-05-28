import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../navigation/app_location.dart';
import '../navigation/app_location_provider.dart';
import '../navigation/app_url_sync.dart';
import '../providers/gad_provider.dart';
import '../providers/settings_provider.dart';
import '../widgets/bug_report_sheet.dart';

class BugReportDraft {
  final AppLocation location;
  final String deepLink;
  final String title;
  final Map<String, dynamic> contextJson;

  const BugReportDraft({
    required this.location,
    required this.deepLink,
    required this.title,
    required this.contextJson,
  });

  String get locationLabel {
    final suffix = BugReportService.locationSuffix(location);
    return '${location.tabName}${suffix.isEmpty ? '' : ' · $suffix'}';
  }
}

enum BugReportLaunchResult {
  openedPrefilled,
  openedWithClipboardFallback,
}

class BugReportService {
  static const repoIssuesUrl = 'https://github.com/geco-nhm/natur-i-norge/issues/new';
  static const issueTemplate = 'bug_report.md';
  static const maxPrefilledUrlLength = 7500;
  static const minCommentLength = 8;

  static BugReportDraft buildDraft(WidgetRef ref) {
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

    return BugReportDraft(
      location: location,
      deepLink: deepLink,
      title: suggestedTitle(location),
      contextJson: contextJson,
    );
  }

  static Future<void> showSheet(BuildContext context, WidgetRef ref) {
    final draft = buildDraft(ref);
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (sheetContext) => BugReportSheet(
        draft: draft,
        minCommentLength: minCommentLength,
        onSubmit: (comment) => launchOnGitHub(draft, comment),
      ),
    );
  }

  static String composeIssueBody(
    BugReportDraft draft,
    String comment, {
    bool compactJson = false,
  }) {
    final userComment = comment.trim();
    final encodedContext = compactJson
        ? jsonEncode(draft.contextJson)
        : const JsonEncoder.withIndent('  ').convert(draft.contextJson);

    return '''
$userComment

---
<sub>Reported from NiN Guide · [Open reproduction link](${draft.deepLink})</sub>

<details>
<summary>Debug context (auto-generated)</summary>

**Reproduction link:** ${draft.deepLink}

```json
$encodedContext
```

</details>
''';
  }

  static Uri buildIssueUri(
    BugReportDraft draft,
    String comment, {
    bool compactJson = false,
    bool includeBody = true,
  }) {
    final params = <String, String>{
      'template': issueTemplate,
      'title': draft.title,
    };
    if (includeBody) {
      params['body'] = composeIssueBody(draft, comment, compactJson: compactJson);
    }
    return Uri.parse(repoIssuesUrl).replace(queryParameters: params);
  }

  static Future<BugReportLaunchResult> launchOnGitHub(
    BugReportDraft draft,
    String comment,
  ) async {
    var uri = buildIssueUri(draft, comment);
    if (uri.toString().length > maxPrefilledUrlLength) {
      uri = buildIssueUri(draft, comment, compactJson: true);
    }

    if (uri.toString().length > maxPrefilledUrlLength) {
      await Clipboard.setData(
        ClipboardData(text: '# ${draft.title}\n\n${composeIssueBody(draft, comment, compactJson: true)}'),
      );
      uri = buildIssueUri(draft, comment, includeBody: false);
      final launched = await _openGitHub(uri);
      if (!launched) {
        throw Exception('Could not open GitHub issue page');
      }
      return BugReportLaunchResult.openedWithClipboardFallback;
    }

    final launched = await _openGitHub(uri);
    if (!launched) {
      throw Exception('Could not open GitHub issue page');
    }
    return BugReportLaunchResult.openedPrefilled;
  }

  static Future<bool> _openGitHub(Uri uri) {
    return launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: kIsWeb ? '_blank' : null,
    );
  }

  static String suggestedTitle(AppLocation location) {
    return '[Bug] ${location.tabName}${locationSuffix(location)}';
  }

  static String locationSuffix(AppLocation location) {
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

  static String successMessage(BugReportLaunchResult result) {
    return switch (result) {
      BugReportLaunchResult.openedPrefilled =>
        'GitHub opened with your comment attached. Click Submit new issue to finish.',
      BugReportLaunchResult.openedWithClipboardFallback =>
        'Report copied to clipboard. On GitHub, paste into the issue body, then submit.',
    };
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
}
