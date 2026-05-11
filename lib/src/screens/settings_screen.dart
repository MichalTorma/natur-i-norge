import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../providers/settings_provider.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(appThemeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings & About')),
      body: ListView(
        children: [
          _buildHeader(context),
          const Divider(),
          _buildThemeSection(context, ref, currentTheme),
          const Divider(),
          _buildStatsSection(context, ref),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Icon(Icons.eco_outlined, size: 80, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          const Text(
            'NiN Guide 3.0',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'A comprehensive field guide for the Natur i Norge (NiN) 3.0 classification system.\nData is pre-packaged for full offline use.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeSection(BuildContext context, WidgetRef ref, AppTheme currentTheme) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Appearance',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryColor),
          ),
        ),
        _ThemeTile(
          title: 'Light Theme',
          isSelected: currentTheme == AppTheme.light,
          onTap: () => ref.read(appThemeProvider.notifier).setTheme(AppTheme.light),
          icon: Icons.light_mode_outlined,
        ),
        _ThemeTile(
          title: 'Dark Theme',
          isSelected: currentTheme == AppTheme.dark,
          onTap: () => ref.read(appThemeProvider.notifier).setTheme(AppTheme.dark),
          icon: Icons.dark_mode_outlined,
        ),
        _ThemeTile(
          title: 'High Contrast Light',
          isSelected: currentTheme == AppTheme.highContrastLight,
          onTap: () => ref.read(appThemeProvider.notifier).setTheme(AppTheme.highContrastLight),
          icon: Icons.brightness_high_outlined,
        ),
        _ThemeTile(
          title: 'High Contrast Dark',
          isSelected: currentTheme == AppTheme.highContrastDark,
          onTap: () => ref.read(appThemeProvider.notifier).setTheme(AppTheme.highContrastDark),
          icon: Icons.brightness_low_outlined,
        ),
      ],
    );
  }

  Widget _buildStatsSection(BuildContext context, WidgetRef ref) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Database Statistics',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryColor),
          ),
        ),
        FutureBuilder(
          future: Future.wait([
            ref.read(databaseProvider).select(ref.read(databaseProvider).ninTypes).get(),
            ref.read(databaseProvider).select(ref.read(databaseProvider).ninVariables).get(),
          ]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final counts = snapshot.data as List<List>;
              return Column(
                children: [
                  ListTile(
                    title: const Text('Types Stored'),
                    trailing: Text(
                      counts[0].length.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    title: const Text('Variables Stored'),
                    trailing: Text(
                      counts[1].length.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'Version 1.0.0 (Pre-filled)',
                        style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ],
    );
  }
}

class _ThemeTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;

  const _ThemeTile({
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return ListTile(
      leading: Icon(icon, color: isSelected ? primaryColor : null),
      title: Text(title),
      trailing: isSelected ? Icon(Icons.check, color: primaryColor) : null,
      onTap: onTap,
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$label: ', style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.greenAccent)),
        ],
      ),
    );
  }
}
