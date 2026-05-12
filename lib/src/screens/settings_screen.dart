import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../providers/settings_provider.dart';
import '../providers/auth_provider.dart';
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
          const Divider(),
          _buildBackupSection(context, ref),
          const Divider(),
          _buildLegalSection(context),
        ],
      ),
    );
  }

  Widget _buildBackupSection(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);
    final backupEnabled = ref.watch(backupEnabledProvider);
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Cloud Backup & Open Science',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryColor),
          ),
        ),
        if (user == null)
          ListTile(
            leading: const Icon(Icons.cloud_off),
            title: const Text('Sign in to Backup'),
            subtitle: const Text('Required for automated cloud storage'),
            trailing: ElevatedButton(
              onPressed: () => ref.read(authActionsProvider.notifier).signInWithGoogle(),
              child: const Text('Google Sign-In'),
            ),
          )
        else
          Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: user.photoURL != null ? NetworkImage(user.photoURL!) : null,
                  child: user.photoURL == null ? const Icon(Icons.person) : null,
                ),
                title: Text(user.displayName ?? 'Researcher'),
                subtitle: Text(user.email ?? ''),
                trailing: TextButton(
                  onPressed: () => ref.read(authActionsProvider.notifier).signOut(),
                  child: const Text('Sign Out'),
                ),
              ),
              SwitchListTile(
                title: const Text('Enable Automated Backup'),
                subtitle: const Text('Photos will be shared under CC-BY-4.0'),
                value: backupEnabled,
                onChanged: (val) => ref.read(backupEnabledProvider.notifier).setEnabled(val),
              ),
              ListTile(
                leading: const Icon(Icons.delete_forever, color: Colors.red),
                title: const Text('Delete Cloud Account', style: TextStyle(color: Colors.red)),
                subtitle: const Text('Removes your profile and personal links'),
                onTap: () => _showDeleteConfirmation(context, ref),
              ),
            ],
          ),
      ],
    );
  }

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account?'),
        content: const Text(
          'This will delete your personal profile from our cloud servers. \n\nNote: Observations already published to Open Science archives (Zenodo) will remain archived for research reproducibility, but your personal identity will be unlinked.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              await ref.read(authActionsProvider.notifier).deleteAccount();
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Delete Everything', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildLegalSection(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Legal',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: primaryColor),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.description_outlined),
          title: const Text('Open Source Licenses'),
          subtitle: const Text('View licenses for the libraries used in this app'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            showLicensePage(
              context: context,
              applicationName: 'NiN Guide 3.0',
              applicationVersion: '1.0.0',
              applicationIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.eco, size: 48, color: Theme.of(context).colorScheme.primary),
              ),
              applicationLegalese: '© 2026 Natur i Norge Guide Contributors',
            );
          },
        ),
        const SizedBox(height: 32),
      ],
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
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () => launchUrl(
              Uri.parse('https://artsdatabanken.no'),
              mode: LaunchMode.externalApplication,
            ),
            icon: const Icon(Icons.open_in_new, size: 14),
            label: const Text('Data provided by Artsdatabanken.no'),
            style: TextButton.styleFrom(
              visualDensity: VisualDensity.compact,
              foregroundColor: Theme.of(context).colorScheme.primary,
              textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
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
