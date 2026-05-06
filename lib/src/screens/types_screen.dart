import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../models/nin_database.dart';

class TypesScreen extends ConsumerWidget {
  const TypesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typesAsync = ref.watch(typesListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nature Types (NiN 3.0)'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: typesAsync.when(
        data: (types) => types.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.cloud_off, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    const Text('No data loaded yet.'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to settings or trigger update
                      },
                      child: const Text('Go to Settings to Sync'),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.all(
                        Colors.green.withOpacity(0.1),
                      ),
                      columns: const [
                        DataColumn(label: Text('ID')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Category')),
                        DataColumn(label: Text('Eco System')),
                        DataColumn(label: Text('Type Category')),
                      ],
                      rows: types.map((type) {
                        return DataRow(cells: [
                          DataCell(Text(type.id, style: const TextStyle(fontWeight: FontWeight.bold))),
                          DataCell(Text(type.navn)),
                          DataCell(Text(type.kategori)),
                          DataCell(Text(type.ecosystnivaaNavn ?? '-')),
                          DataCell(Text(type.typekategoriNavn ?? '-')),
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
