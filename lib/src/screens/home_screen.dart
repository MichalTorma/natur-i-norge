import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/nin_database.dart';
import '../providers/database_provider.dart';
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

  int _selectedIndex = _typesTab;
  late final List<GlobalKey<NavigatorState>> _navigatorKeys;

  @override
  void initState() {
    super.initState();
    _navigatorKeys = List.generate(5, (_) => GlobalKey<NavigatorState>());
  }

  void _resetTabToRoot(int index) {
    _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
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
  }

  Future<void> _openTypeInTypesTab(NinType target) async {
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

    for (final type in path) {
      typesNav.push(
        MaterialPageRoute(builder: (_) => TypesScreen(type: type)),
      );
    }

    if (mounted) {
      setState(() => _selectedIndex = _typesTab);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
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
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.digit4): const _SelectTabIntent(_galleryTab),
        LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.digit5): const _SelectTabIntent(_settingsTab),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit1): const _SelectTabIntent(_typesTab),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit2): const _SelectTabIntent(_variablesTab),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit3): const _SelectTabIntent(_favoritesTab),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit4): const _SelectTabIntent(_galleryTab),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit5): const _SelectTabIntent(_settingsTab),
      },
      child: Actions(
        actions: {
          _SelectTabIntent: CallbackAction<_SelectTabIntent>(
            onInvoke: (intent) {
              _onTabSelected(intent.index);
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: true,
          child: Scaffold(
            body: Row(
              children: [
                if (isDesktop)
                  NavigationRail(
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: _onTabSelected,
                    labelType: NavigationRailLabelType.all,
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
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
                          navigatorKey: _navigatorKeys[i],
                          root: tabRoots[i],
                        ),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: isDesktop
                ? null
                : NavigationBar(
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: _onTabSelected,
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
        ),
      ),
    );
  }
}

class _TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget root;

  const _TabNavigator({
    required this.navigatorKey,
    required this.root,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => root,
        );
      },
    );
  }
}

class _SelectTabIntent extends Intent {
  final int index;

  const _SelectTabIntent(this.index);
}
