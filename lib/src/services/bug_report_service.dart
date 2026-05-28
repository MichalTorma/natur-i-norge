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

enum ReportKind { bug, comment }

class BugReportDraft {
  final AppLocation location;
  final String deepLink;
  final Map<String, dynamic> contextJson;

  const BugReportDraft({
    required this.location,
    required this.deepLink,
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
  static const maxPrefilledUrlLength = 7500;
  static const minCommentLength = 8;

  static String templateFor(ReportKind kind) {
    return switch (kind) {
      ReportKind.bug => 'bug_report.md',
      ReportKind.comment => 'comment.md',
    };
  }

  static String labelsFor(ReportKind kind) {
    return switch (kind) {
      ReportKind.bug => 'bug,from-app',
      ReportKind.comment => 'comment,from-app',
    };
  }

  static BugReportDraft buildDraft(WidgetRef ref) {
    final AppLocation reportLocation = ref.read(appLocationProvider);
    final packageInfo = ref.read(packageInfoProvider).asData?.value;
    final theme = ref.read(appThemeProvider);
    final scale = ref.read(selectedScaleProvider);
    final disableImages = ref.read(disableImagesProvider);
    final showLkmNames = ref.read(showLkmNamesProvider);
    final gadOverlayVisible = ref.read(gadOverlayVisibleProvider);

    final hashPath = reportLocation.toHashPath();
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
      'location': reportLocation.toJson(),
    };

    return BugReportDraft(
      location: reportLocation,
      deepLink: deepLink,
      contextJson: contextJson,
    );
  }

  static Future<void> showSheet(BuildContext context, WidgetRef ref) {
    final draft = buildDraft(ref);
    final showIntro = !ref.read(feedbackIntroSeenProvider);
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (sheetContext) {
        final bottomInset = MediaQuery.viewInsetsOf(sheetContext).bottom;
        return Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.88,
            minChildSize: 0.45,
            maxChildSize: 0.95,
            builder: (context, scrollController) => BugReportSheet(
              draft: draft,
              scrollController: scrollController,
              minCommentLength: minCommentLength,
              showIntro: showIntro,
              onIntroDismiss: () => ref.read(feedbackIntroSeenProvider.notifier).markSeen(),
              onSubmit: (kind, comment) => launchOnGitHub(draft, kind, comment),
            ),
          ),
        );
      },
    );
  }

  static String suggestedTitle(ReportKind kind, AppLocation location) {
    final prefix = switch (kind) {
      ReportKind.bug => '[Bug]',
      ReportKind.comment => '[Comment]',
    };
    return '$prefix ${location.tabName}${locationSuffix(location)}';
  }

  static String composeIssueBody(
    BugReportDraft draft,
    ReportKind kind,
    String comment, {
    bool compactJson = false,
  }) {
    final userComment = comment.trim();
    final encodedContext = compactJson
        ? jsonEncode(draft.contextJson)
        : const JsonEncoder.withIndent('  ').convert(draft.contextJson);

    final contextHeading = switch (kind) {
      ReportKind.bug => 'Debug context (auto-generated)',
      ReportKind.comment => 'App context (auto-generated)',
    };

    return '''
$userComment

---
<sub>Sent from NiN Guide · [Open this screen in the web app](${draft.deepLink})</sub>

<details>
<summary>$contextHeading</summary>

**Screen link:** ${draft.deepLink}

```json
$encodedContext
```

</details>
''';
  }

  static Uri buildIssueUri(
    BugReportDraft draft,
    ReportKind kind,
    String comment, {
    bool compactJson = false,
    bool includeBody = true,
  }) {
    final params = <String, String>{
      'template': templateFor(kind),
      'title': suggestedTitle(kind, draft.location),
      'labels': labelsFor(kind),
    };
    if (includeBody) {
      params['body'] = composeIssueBody(draft, kind, comment, compactJson: compactJson);
    }
    return Uri.parse(repoIssuesUrl).replace(queryParameters: params);
  }

  static Future<BugReportLaunchResult> launchOnGitHub(
    BugReportDraft draft,
    ReportKind kind,
    String comment,
  ) async {
    final title = suggestedTitle(kind, draft.location);
    var uri = buildIssueUri(draft, kind, comment, compactJson: true);
    if (uri.toString().length > maxPrefilledUrlLength) {
      uri = buildIssueUri(draft, kind, comment, compactJson: true, includeBody: false);
      await Clipboard.setData(
        ClipboardData(
          text: '# $title\n\n${composeIssueBody(draft, kind, comment, compactJson: true)}',
        ),
      );
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
        'GitHub opened with your message attached. Click Submit new issue to finish.',
      BugReportLaunchResult.openedWithClipboardFallback =>
        'Message copied to clipboard. On GitHub, paste into the issue body, then submit.',
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
