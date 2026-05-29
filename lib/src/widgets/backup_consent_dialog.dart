import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../utils/auth_errors.dart';

bool _backupConsentDialogOpen = false;

Future<void> showBackupConsentDialog(BuildContext context) async {
  if (_backupConsentDialogOpen) return;

  _backupConsentDialogOpen = true;
  try {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const BackupConsentDialog(),
    );
  } finally {
    _backupConsentDialogOpen = false;
  }
}

Future<void> showBackupConsentDialogIfNeeded(
  BuildContext context,
  WidgetRef ref,
) async {
  if (ref.read(consentShownProvider)) return;
  if (ref.read(authProvider) != null) return;

  await showBackupConsentDialog(context);
}

class BackupConsentDialog extends ConsumerStatefulWidget {
  const BackupConsentDialog({super.key});

  @override
  ConsumerState<BackupConsentDialog> createState() => _BackupConsentDialogState();
}

class _BackupConsentDialogState extends ConsumerState<BackupConsentDialog> {
  bool _isSigningIn = false;

  Future<void> _signIn() async {
    if (_isSigningIn) return;

    setState(() => _isSigningIn = true);

    try {
      await ref.read(authActionsProvider.notifier).signInWithGoogle();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(friendlyAuthErrorMessage(e)),
            duration: const Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSigningIn = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      onPressed: _isSigningIn
                          ? null
                          : () {
                              ref.read(consentShownProvider.notifier).setShown();
                              Navigator.pop(context);
                            },
                      child: const Text('Maybe Later'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isSigningIn ? null : _signIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                      ),
                      child: _isSigningIn
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Enable Backup'),
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
