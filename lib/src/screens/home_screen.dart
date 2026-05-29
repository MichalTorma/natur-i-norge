import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/nin_database.dart';
import '../navigation/app_location.dart';
import '../navigation/app_location_provider.dart';
import '../navigation/app_route_tracker.dart';
import '../navigation/app_routes.dart';
import '../navigation/app_url_sync.dart';
import '../providers/database_provider.dart';
import '../providers/nin_search_provider.dart';
import '../services/bug_report_service.dart';
import '../widgets/backup_consent_dialog.dart';
import '../widgets/nin_search_sheet.dart';
import 'types_screen.dart';
import 'variables_screen.dart';
import 'favorites_screen.dart';
import 'gallery_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  static const _typesTab = 0;
  static const _variablesTab = 1;
  static const _favoritesTab = 2;
  static const _galleryTab = 3;
  static const _settingsTab = 4;
  static const _feedbackNavIndex = 3;

  int _selectedIndex = _typesTab;
  late final List<GlobalKey<NavigatorState>> _navigatorKeys;
  late final List<AppRouteTracker> _tabTrackers;
  StreamSubscription<String?>? _hashSubscription;

  int _tabIndexFromNavIndex(int navIndex) {
    return navIndex < _feedbackNavIndex ? navIndex : navIndex - 1;
  }

  int _navIndexFromTabIndex(int tabIndex) {
    return tabIndex < _feedbackNavIndex ? tabIndex : tabIndex + 1;
  }

  @override
  void initState() {
    super.initState();
    _navigatorKeys = List.generate(AppLocation.tabNames.length, (_) => GlobalKey<NavigatorState>());
    _tabTrackers = List.generate(AppLocation.tabNames.length, (index) {
      return AppRouteTracker(
        onStackChanged: (stack) {
          ref.read(appLocationProvider.notifier).updateTabStack(index, stack);
        },
      );
    });

    ref.listenManual(appLocationProvider, (previous, next) {
      if (ref.read(appLocationProvider.notifier).suppressUrlSync) return;
      writeUrlHashPath(next.toHashPath());
    });

    _hashSubscription = watchUrlHashPathChanges().listen((path) {
      if (!mounted) return;
      if (ref.read(appLocationProvider.notifier).suppressUrlSync) return;
      final location = path == null ? null : AppLocation.fromHashPath(path);
      if (location == null) return;
      _restoreLocation(location);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final initialPath = readUrlHashPath();
      if (initialPath == null) return;
      final location = AppLocation.fromHashPath(initialPath);
      if (location != null) {
        _restoreLocation(location);
      }
    });
  }

  @override
  void dispose() {
    _hashSubscription?.cancel();
    super.dispose();
  }

  void _resetTabToRoot(int index) {
    _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
  }

  void _openFeedback() {
    BugReportService.showSheet(context, ref);
  }

  void _onNavSelected(int navIndex) {
    if (navIndex == _feedbackNavIndex) {
      _openFeedback();
      return;
    }
    _onTabSelected(_tabIndexFromNavIndex(navIndex));
  }

  void _onTabSelected(int index) {
    if (index == _selectedIndex) {
      _resetTabToRoot(index);
      return;
    }

    if (index == _favoritesTab) {
      _resetTabToRoot(_favoritesTab);
    }

    setState(() => _selectedIndex = index);
    ref.read(appLocationProvider.notifier).setTab(index);

    if (index == _galleryTab) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          showBackupConsentDialogIfNeeded(context, ref);
        }
      });
    }
  }

  Future<void> _openTypeInTypesTab(NinType target, {String? highlightQuery}) async {
    final db = ref.read(databaseProvider);
    final path = <NinType>[];
    NinType? current = target;

    while (current != null) {
      path.insert(0, current);
      final parentId = current.parentId;
      if (parentId == null || parentId.isEmpty) break;
      current = await (db.select(db.ninTypes)..where((t) => t.id.equals(parentId)))
          .getSingleOrNull();
    }

    _resetTabToRoot(_favoritesTab);

    final typesNav = _navigatorKeys[_typesTab].currentState!;
    _resetTabToRoot(_typesTab);

    ref.read(pendingSearchHighlightProvider.notifier).setHighlight(
          typeId: target.id,
          query: highlightQuery,
        );

    for (var i = 0; i < path.length; i++) {
      typesNav.push(
        AppRoutes.types(
          type: path[i],
          highlightQuery: i == path.length - 1 ? highlightQuery : null,
        ),
      );
    }

    if (mounted) {
      setState(() => _selectedIndex = _typesTab);
      ref.read(appLocationProvider.notifier).setTab(_typesTab);
    }
  }

  void _openSearch() {
    showNinSearchSheet(
      context,
      ref: ref,
      onSelectType: (type, query) => _openTypeInTypesTab(type, highlightQuery: query),
    );
  }

  Future<void> _restoreLocation(AppLocation location) async {
    await ref.read(appLocationProvider.notifier).runWithoutUrlSync(() async {
      if (!mounted) return;

      for (var i = 0; i < _navigatorKeys.length; i++) {
        _resetTabToRoot(i);
      }

      setState(() => _selectedIndex = location.tabIndex);
      ref.read(appLocationProvider.notifier).setTab(location.tabIndex);

      if (location.tabIndex == _galleryTab) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            showBackupConsentDialogIfNeeded(context, ref);
          }
        });
      }

      final nav = _navigatorKeys[location.tabIndex].currentState;
      if (nav == null) return;

      for (final frame in location.tabStack.skip(1)) {
        final route = await AppRoutes.routeForFrame(frame, ref);
        if (route != null) {
          nav.push(route);
        }
      }

      for (final frame in location.rootStack) {
        final route = await AppRoutes.routeForFrame(frame, ref);
        if (route != null && mounted) {
          Navigator.of(context, rootNavigator: true).push(route);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // Wide but short viewports (7–10" tablets) cannot fit a NavigationRail.
    final useNavigationRail = size.width > 800 && size.height >= 850;
    final railLabelType = size.height >= 960
        ? NavigationRailLabelType.all
        : NavigationRailLabelType.selected;
    final navSelectedIndex = _navIndexFromTabIndex(_selectedIndex);
    final tabRoots = [
      const TypesScreen(),
      const VariablesScreen(),
      FavoritesScreen(onOpenType: _openTypeInTypesTab),
      const GalleryScreen(),
      const SettingsScreen(),
    ];

    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.digit1): const _SelectTabIntent(_typesTab),
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.digit2): const _SelectTabIntent(_variablesTab),
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.digit3): const _SelectTabIntent(_favoritesTab),
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.digit4): const _OpenFeedbackIntent(),
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.digit5): const _SelectTabIntent(_galleryTab),
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.digit6): const _SelectTabIntent(_settingsTab),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit1): const _SelectTabIntent(_typesTab),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit2): const _SelectTabIntent(_variablesTab),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit3): const _SelectTabIntent(_favoritesTab),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit4): const _OpenFeedbackIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit5): const _SelectTabIntent(_galleryTab),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit6): const _SelectTabIntent(_settingsTab),
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyK): const _OpenSearchIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyK): const _OpenSearchIntent(),
      },
      child: Actions(
        actions: {
          _SelectTabIntent: CallbackAction<_SelectTabIntent>(
            onInvoke: (intent) {
              _onTabSelected(intent.index);
              return null;
            },
          ),
          _OpenFeedbackIntent: CallbackAction<_OpenFeedbackIntent>(
            onInvoke: (_) {
              _openFeedback();
              return null;
            },
          ),
          _OpenSearchIntent: CallbackAction<_OpenSearchIntent>(
            onInvoke: (_) {
              _openSearch();
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: true,
          child: Stack(
            children: [
              Scaffold(
                body: Row(
                  children: [
                    if (useNavigationRail)
                      NavigationRail(
                        selectedIndex: navSelectedIndex,
                        onDestinationSelected: _onNavSelected,
                        labelType: railLabelType,
                        leading: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: size.height >= 960 ? 24 : 8,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/app_icon.png',
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                        destinations: const [
                          NavigationRailDestination(
                            icon: Icon(Icons.category_outlined),
                            selectedIcon: Icon(Icons.category),
                            label: Text('Types'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.straighten_outlined),
                            selectedIcon: Icon(Icons.straighten),
                            label: Text('Variables'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.star_outline),
                            selectedIcon: Icon(Icons.star),
                            label: Text('Favorites'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.chat_bubble_outline),
                            selectedIcon: Icon(Icons.chat_bubble),
                            label: Text('Feedback'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.photo_library_outlined),
                            selectedIcon: Icon(Icons.photo_library),
                            label: Text('Gallery'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.settings_outlined),
                            selectedIcon: Icon(Icons.settings),
                            label: Text('Settings'),
                          ),
                        ],
                      ),
                    Expanded(
                      child: IndexedStack(
                        index: _selectedIndex,
                        children: [
                          for (var i = 0; i < tabRoots.length; i++)
                            _TabNavigator(
                              tabIndex: i,
                              navigatorKey: _navigatorKeys[i],
                              observer: _tabTrackers[i],
                              root: tabRoots[i],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: useNavigationRail
                    ? null
                    : NavigationBar(
                        selectedIndex: navSelectedIndex,
                        onDestinationSelected: _onNavSelected,
                        destinations: const [
                          NavigationDestination(
                            icon: Icon(Icons.category_outlined),
                            selectedIcon: Icon(Icons.category),
                            label: 'Types',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.straighten_outlined),
                            selectedIcon: Icon(Icons.straighten),
                            label: 'Variables',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.star_outline),
                            selectedIcon: Icon(Icons.star),
                            label: 'Favorites',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.chat_bubble_outline),
                            selectedIcon: Icon(Icons.chat_bubble),
                            label: 'Feedback',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.photo_library_outlined),
                            selectedIcon: Icon(Icons.photo_library),
                            label: 'Gallery',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.settings_outlined),
                            selectedIcon: Icon(Icons.settings),
                            label: 'Settings',
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabNavigator extends StatelessWidget {
  final int tabIndex;
  final GlobalKey<NavigatorState> navigatorKey;
  final AppRouteTracker observer;
  final Widget root;

  const _TabNavigator({
    required this.tabIndex,
    required this.navigatorKey,
    required this.observer,
    required this.root,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      observers: [observer],
      onGenerateRoute: (settings) => AppRoutes.tabRoot(tabIndex, root),
    );
  }
}

class _SelectTabIntent extends Intent {
  final int index;

  const _SelectTabIntent(this.index);
}

class _OpenFeedbackIntent extends Intent {
  const _OpenFeedbackIntent();
}

class _OpenSearchIntent extends Intent {
  const _OpenSearchIntent();
}
