import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _isUpdating = false;
  String? _status;

  Future<void> _updateData({bool deep = false}) async {
    setState(() {
      _isUpdating = true;
      _status = deep ? 'Deep syncing (Fetching API + Scraping web)...' : 'Fetching and updating data from NiN API...';
    });

    try {
      final api = ref.read(apiServiceProvider);
      final db = ref.read(databaseProvider);
      await api.updateAllData(db, deepSync: deep);
      
      // Invalidate providers to refresh data
      ref.invalidate(typesListProvider);
      ref.invalidate(variablesListProvider);

      setState(() {
        _status = 'Success! Data updated.';
      });
    } catch (e) {
      setState(() {
        _status = 'Error: $e';
      });
    } finally {
      setState(() {
        _isUpdating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.sync, size: 80, color: Colors.green),
              const SizedBox(height: 24),
              const Text(
                'Data Synchronization',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'NiN 3.0 data is stored locally for offline use. You can manually refresh it from the Artsdatabanken API.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              if (_isUpdating)
                const CircularProgressIndicator()
              else
                Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _updateData(deep: false),
                      icon: const Icon(Icons.download),
                      label: const Text('Quick Sync (API Only)'),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () => _updateData(deep: true),
                      icon: const Icon(Icons.auto_awesome),
                      label: const Text('Deep Sync (Scrape Images & Info)'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.withOpacity(0.2),
                        foregroundColor: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 24),
                    FutureBuilder(
                      future: Future.wait([
                        ref.read(databaseProvider).select(ref.read(databaseProvider).ninTypes).get(),
                        ref.read(databaseProvider).select(ref.read(databaseProvider).ninVariables).get(),
                      ]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final counts = snapshot.data as List<List>;
                          return Text(
                            'Stored: ${counts[0].length} types, ${counts[1].length} variables',
                            style: const TextStyle(color: Colors.grey),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              if (_status != null) ...[
                const SizedBox(height: 24),
                Text(_status!, style: TextStyle(color: _status!.contains('Error') ? Colors.red : Colors.green)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
