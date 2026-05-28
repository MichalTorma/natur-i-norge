import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../models/nin_database.dart';
import '../navigation/app_routes.dart';
import 'variable_detail_screen.dart';

class VariablesScreen extends ConsumerStatefulWidget {
  const VariablesScreen({super.key});

  @override
  ConsumerState<VariablesScreen> createState() => _VariablesScreenState();
}

class _VariablesScreenState extends ConsumerState<VariablesScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final variablesAsync = ref.watch(variablesListProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nature Variables'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value.toLowerCase()),
              decoration: InputDecoration(
                hintText: 'Search variables...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: colorScheme.surfaceContainerHighest.withOpacity(0.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
        ),
      ),
      body: variablesAsync.when(
        data: (variables) {
          final filteredVariables = variables.where((v) {
            return v.id.toLowerCase().contains(_searchQuery) ||
                   v.navn.toLowerCase().contains(_searchQuery) ||
                   v.kategori.toLowerCase().contains(_searchQuery);
          }).toList();

          return Column(
            children: [
              if (_searchQuery.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Found ${filteredVariables.length} variables',
                      style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.secondary),
                    ),
                  ),
                ),
              Expanded(
                child: filteredVariables.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off, size: 64, color: colorScheme.outline),
                            const SizedBox(height: 16),
                            Text('No variables found', style: theme.textTheme.titleMedium),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredVariables.length,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemBuilder: (context, index) {
              final v = filteredVariables[index];
              final isRoot = v.parentId == null || v.parentId!.isEmpty;
              
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(AppRoutes.variableDetail(v.id));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.3))),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        decoration: BoxDecoration(
                          color: isRoot 
                              ? colorScheme.primaryContainer 
                              : colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          v.id,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: isRoot 
                                ? colorScheme.onPrimaryContainer 
                                : colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              v.navn,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              v.kategori,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.chevron_right, color: colorScheme.outline),
                    ],
                  ),
                ),
              );
                        },
                      ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
