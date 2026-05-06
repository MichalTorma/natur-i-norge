import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'types_screen.dart';
import 'variables_screen.dart';
import 'settings_screen.dart';
import 'camera_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const TypesScreen(),
    const VariablesScreen(),
    const CameraScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) => setState(() => _selectedIndex = index),
              labelType: NavigationRailLabelType.all,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Image.network(
                  'https://artsdatabanken.no/Files/14104/NiN_Logo_RGB.png',
                  height: 40,
                  errorBuilder: (_, __, ___) => const Icon(Icons.nature_people, size: 40),
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
                  icon: Icon(Icons.camera_alt_outlined),
                  selectedIcon: Icon(Icons.camera_alt),
                  label: Text('Camera'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
            ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _screens[_selectedIndex],
            ),
          ),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) => setState(() => _selectedIndex = index),
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
                  icon: Icon(Icons.camera_alt_outlined),
                  selectedIcon: Icon(Icons.camera_alt),
                  label: 'Camera',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
    );
  }
}
