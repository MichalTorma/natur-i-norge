import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('About NiN Guide')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.eco_outlined, size: 80, color: Colors.green),
              const SizedBox(height: 24),
              const Text(
                'NiN Guide 3.0',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'A comprehensive field guide for the Natur i Norge (NiN) 3.0 classification system.\nData is pre-packaged for full offline use.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
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
                        _StatRow(label: 'Types Stored', value: counts[0].length.toString()),
                        _StatRow(label: 'Variables Stored', value: counts[1].length.toString()),
                        const SizedBox(height: 16),
                        const Text(
                          'Version 1.0.0 (Pre-filled)',
                          style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
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
