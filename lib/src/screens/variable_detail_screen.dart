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

    return variableAsync.when(
      data: (varData) {
        if (varData == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Ikke funnet'), backgroundColor: Colors.black),
            backgroundColor: Colors.black,
            body: const Center(child: Text('Variable not found.', style: TextStyle(color: Colors.white))),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(varData.navn),
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(varData),
                const SizedBox(height: 24),
                _buildSectionTitle("Beskrivelse"),
                const SizedBox(height: 8),
                ExpandableMarkdown(
                  data: varData.description ?? "Ingen beskrivelse tilgjengelig.",
                ),
                if (varData.stepsJson != null) ...[
                  const SizedBox(height: 24),
                  _buildSectionTitle("Trinn"),
                  const SizedBox(height: 8),
                  _buildStepsList(varData.stepsJson!),
                ],
              ],
            ),
          ),
        );
      },
      loading: () => const Scaffold(backgroundColor: Colors.black, body: Center(child: CircularProgressIndicator(color: Colors.greenAccent))),
      error: (e, s) => Scaffold(backgroundColor: Colors.black, body: Center(child: Text("Feil: $e", style: const TextStyle(color: Colors.red)))),
    );
  }

  Widget _buildHeader(NinVariable variable) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.greenAccent.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.greenAccent.withAlpha(51)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(variable.id, style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Text(variable.navn, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (variable.kategori.isNotEmpty) _buildChip(variable.kategori),
              if (variable.ecosystnivaaNavn != null) _buildChip(variable.ecosystnivaaNavn!),
              if (variable.variabelkategoriNavn != null) _buildChip(variable.variabelkategoriNavn!),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10)),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.2),
    );
  }

  Widget _buildStepsList(String stepsJson) {
    try {
      final List<dynamic> steps = json.decode(stepsJson);
      return Column(
        children: steps.map((s) => Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(13),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  s['verdi']?.toString() ?? '?',
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(s['navn'] ?? 'Ukjent trinn', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                    if (s['kode'] != null)
                      Text(s['kode'], style: const TextStyle(color: Colors.white38, fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
        )).toList(),
      );
    } catch (e) {
      return const Text("Kunne ikke laste trinn.", style: TextStyle(color: Colors.white38));
    }
  }
}
