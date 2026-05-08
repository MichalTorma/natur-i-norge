import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../models/nin_database.dart';

class VariableDetailScreen extends ConsumerWidget {
  final String variableId;

  const VariableDetailScreen({super.key, required this.variableId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final variableAsync = ref.watch(variableProvider(variableId));

    return Scaffold(
      appBar: AppBar(
        title: Text(variableId),
        backgroundColor: Colors.transparent,
      ),
      body: variableAsync.when(
        data: (variable) {
          if (variable == null) {
            return const Center(child: Text('Variable not found.'));
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(variable),
                const SizedBox(height: 32),
                _buildSection('Kategori', variable.kategori),
                _buildSection('Ecosystem Nivå', variable.ecosystnivaaNavn ?? '-'),
                _buildSection('Variabelkategori', variable.variabelkategoriNavn ?? '-'),
                const SizedBox(height: 32),
                const Text(
                  'Beskrivelse',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.greenAccent),
                ),
                const SizedBox(height: 12),
                Text(
                  'Dette er en lokal kompleks miljøvariabel (LKM) som brukes til å beskrive variasjon innenfor natursystem-typer i NiN 3.0.',
                  style: TextStyle(fontSize: 14, color: Colors.white.withValues(alpha: 0.7), height: 1.5),
                ),
                // Note: Steps/Trinn could be added here if we had a provider for them
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildHeader(NinVariable variable) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.withValues(alpha: 0.2), Colors.green.withValues(alpha: 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.greenAccent.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  variable.id,
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.greenAccent, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            variable.navn,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(fontSize: 11, letterSpacing: 1.2, fontWeight: FontWeight.bold, color: Colors.white.withValues(alpha: 0.4)),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
