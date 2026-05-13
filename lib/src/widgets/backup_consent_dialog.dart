import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class BackupConsentDialog extends ConsumerWidget {
  const BackupConsentDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    // REACTIVE: Close dialog and enable backup automatically on login
    ref.listen(authProvider, (previous, next) {
      if (next != null) {
        ref.read(consentShownProvider.notifier).setShown();
        Navigator.pop(context);
      }
    });

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cloud_upload_outlined, size: 64, color: theme.colorScheme.primary),
              const SizedBox(height: 16),
              Text(
                'Secure Cloud Backup',
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Would you like to enable automated cloud backup for your observations? This also allows you to contribute to Open Science.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              _buildFeatureRow(
                context,
                Icons.sync,
                'Retroactive Sync',
                'All your existing observations will be safely backed up to the cloud immediately.',
              ),
              const SizedBox(height: 12),
              _buildFeatureRow(
                context,
                Icons.science,
                'Open Science Contribution',
                'Your observations will be published periodically to Zenodo for research.',
              ),
              const SizedBox(height: 12),
              _buildFeatureRow(
                context,
                Icons.copyright,
                'CC-BY-4.0 License',
                'By enabling backup, you agree to publish your observations under the Creative Commons Attribution 4.0 license.',
              ),
              const SizedBox(height: 12),
              _buildFeatureRow(
                context,
                Icons.history,
                'Immutable Records',
                'Once published to archival repositories, data cannot be fully deleted to maintain scientific reproducibility.',
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        ref.read(consentShownProvider.notifier).setShown();
                        Navigator.pop(context);
                      },
                      child: const Text('Maybe Later'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          await ref.read(authActionsProvider.notifier).signInWithGoogle();
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login failed: $e')),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                      ),
                      child: const Text('Enable Backup'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureRow(BuildContext context, IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.secondary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              Text(
                description,
                style: TextStyle(fontSize: 11, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
