import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import '../models/nin_database.dart';
import '../providers/database_provider.dart';
import '../widgets/expandable_markdown.dart';

class VariableDetailScreen extends ConsumerWidget {
  final String variableId;

  const VariableDetailScreen({super.key, required this.variableId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final variableAsync = ref.watch(variableProvider(variableId));
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return variableAsync.when(
      data: (varData) {
        if (varData == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Ikke funnet')),
            body: const Center(child: Text('Variable not found.')),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(varData.navn),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, varData),
                const SizedBox(height: 24),
                _buildSectionTitle(context, "Beskrivelse"),
                const SizedBox(height: 8),
                ExpandableMarkdown(
                  data: varData.description ?? "Ingen beskrivelse tilgjengelig.",
                ),
                if (varData.stepsJson != null) ...[
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, "Trinn"),
                  const SizedBox(height: 8),
                  _buildStepsList(context, varData.stepsJson!),
                ],
              ],
            ),
          ),
        );
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, s) => Scaffold(body: Center(child: Text("Feil: $e", style: TextStyle(color: colorScheme.error)))),
    );
  }

  Widget _buildHeader(BuildContext context, NinVariable variable) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.primary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(variable.id, style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Text(variable.navn, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (variable.kategori.isNotEmpty) _buildChip(context, variable.kategori),
              if (variable.ecosystnivaaNavn != null) _buildChip(context, variable.ecosystnivaaNavn!),
              if (variable.variabelkategoriNavn != null) _buildChip(context, variable.variabelkategoriNavn!),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 10)),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.2),
    );
  }

  Widget _buildStepsList(BuildContext context, String stepsJson) {
    final colorScheme = Theme.of(context).colorScheme;
    try {
      final List<dynamic> steps = json.decode(stepsJson);
      return Column(
        children: steps.map((s) => Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  s['verdi']?.toString() ?? '?',
                  style: TextStyle(color: colorScheme.onPrimary, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(s['navn'] ?? 'Ukjent trinn', style: const TextStyle(fontWeight: FontWeight.w500)),
                    if (s['kode'] != null)
                      Text(s['kode'], style: TextStyle(color: colorScheme.onSurface.withOpacity(0.5), fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
        )).toList(),
      );
    } catch (e) {
      return Text("Kunne ikke laste trinn.", style: TextStyle(color: colorScheme.onSurface.withOpacity(0.5)));
    }
  }
}
