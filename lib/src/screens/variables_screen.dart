import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../models/nin_database.dart';

class VariablesScreen extends ConsumerWidget {
  const VariablesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final variablesAsync = ref.watch(variablesListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nature Variables'),
        backgroundColor: Colors.transparent,
      ),
      body: variablesAsync.when(
        data: (variables) => variables.isEmpty
            ? const Center(child: Text('No variables loaded.'))
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      ),
                      columns: const [
                        DataColumn(label: Text('ID')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Category')),
                        DataColumn(label: Text('Eco System')),
                        DataColumn(label: Text('Variable Category')),
                      ],
                      rows: variables.map((v) {
                        return DataRow(cells: [
                          DataCell(Text(v.id, style: const TextStyle(fontWeight: FontWeight.bold))),
                          DataCell(Text(v.navn)),
                          DataCell(Text(v.kategori)),
                          DataCell(Text(v.ecosystnivaaNavn ?? '-')),
                          DataCell(Text(v.variabelkategoriNavn ?? '-')),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
