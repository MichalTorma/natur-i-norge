import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/nin_database.dart';
import '../providers/gad_provider.dart';

class GadSpeciesPanel extends ConsumerStatefulWidget {
  const GadSpeciesPanel({super.key});

  @override
  ConsumerState<GadSpeciesPanel> createState() => _GadSpeciesPanelState();
}

class _GadSpeciesPanelState extends ConsumerState<GadSpeciesPanel> {
  Future<void> _openSpeciesPicker() async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => _GadSpeciesPickerSheet(
        scrollController: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedAsync = ref.watch(gadSelectedSpeciesDetailsProvider);
    final selectedIds = ref.watch(gadSelectedSpeciesProvider);
    final overlayVisible = ref.watch(gadOverlayVisibleProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final hasSpecies = selectedIds.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.grass, size: 14, color: colorScheme.secondary),
            const SizedBox(width: 6),
            Text(
              'ARTSMATRISE (GAD)',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: colorScheme.secondary,
                letterSpacing: 1.2,
              ),
            ),
            const Spacer(),
            if (hasSpecies)
              FilterChip(
                label: const Text('Konstans'),
                selected: overlayVisible,
                showCheckmark: false,
                avatar: Icon(
                  overlayVisible ? Icons.grid_on : Icons.grid_off,
                  size: 16,
                ),
                onSelected: (_) => ref
                    .read(gadOverlayVisibleProvider.notifier)
                    .setVisible(!overlayVisible),
              ),
            TextButton.icon(
              onPressed: _openSpeciesPicker,
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Legg til art'),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Konstans (0–6) vises som gule merker midt i hver celle.',
          style: TextStyle(
            fontSize: 11,
            color: colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 8),
        selectedAsync.when(
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
          data: (species) {
            if (species.isEmpty) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: colorScheme.outline.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  'Ingen arter valgt — matrisen viser bare naturtyper.',
                  style: TextStyle(
                    fontSize: 11,
                    color: colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
              );
            }
            return Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                ...species.map((sp) => _SpeciesChip(species: sp)),
                if (species.length > 1)
                  ActionChip(
                    label: const Text('Tøm alle'),
                    avatar: const Icon(Icons.clear_all, size: 16),
                    onPressed: () => ref
                        .read(gadSelectedSpeciesProvider.notifier)
                        .clear(),
                  ),
              ],
            );
          },
        ),
        const SizedBox(height: 8),
        const _GadLegend(),
      ],
    );
  }
}

class _GadSpeciesPickerSheet extends ConsumerStatefulWidget {
  final ScrollController? scrollController;
  const _GadSpeciesPickerSheet({this.scrollController});

  @override
  ConsumerState<_GadSpeciesPickerSheet> createState() =>
      _GadSpeciesPickerSheetState();
}

class _GadSpeciesPickerSheetState extends ConsumerState<_GadSpeciesPickerSheet> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final results = ref.watch(gadSpeciesSearchProvider(_query));
    final selected = ref.watch(gadSelectedSpeciesProvider);

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.65,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Legg til art',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Søk latinsk eller norsk navn…',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                isDense: true,
              ),
              onChanged: (value) => setState(() => _query = value),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: results.when(
                loading: () =>
                    const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Feil: $e')),
                data: (species) {
                  if (species.isEmpty) {
                    return const Center(child: Text('Ingen arter funnet'));
                  }
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: species.length,
                    itemBuilder: (context, index) {
                      final sp = species[index];
                      final isSelected = selected.contains(sp.id);
                      return ListTile(
                        title: Text(sp.nameLatin),
                        subtitle:
                            sp.nameNb != null ? Text(sp.nameNb!) : null,
                        trailing: isSelected
                            ? Icon(Icons.check,
                                color: Theme.of(context).colorScheme.primary)
                            : null,
                        onTap: isSelected
                            ? null
                            : () {
                                ref
                                    .read(gadSelectedSpeciesProvider.notifier)
                                    .add(sp.id);
                                Navigator.pop(context);
                              },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SpeciesChip extends ConsumerWidget {
  final NinSpecy species;
  const _SpeciesChip({required this.species});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InputChip(
      label: Text(
        species.nameNb ?? species.nameLatin,
        style: const TextStyle(fontSize: 11),
      ),
      tooltip: species.nameLatin,
      onDeleted: () =>
          ref.read(gadSelectedSpeciesProvider.notifier).remove(species.id),
    );
  }
}

class _GadLegend extends StatelessWidget {
  const _GadLegend();

  @override
  Widget build(BuildContext context) {
    final labels = ['0', '1–2', '3–4', '5–6'];
    final colors = [
      Colors.transparent,
      const Color(0xFFE8F5E9),
      const Color(0xFF81C784),
      const Color(0xFF2E7D32),
    ];

    return Row(
      children: [
        Text(
          'Konstans:',
          style: TextStyle(
            fontSize: 9,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
          ),
        ),
        const SizedBox(width: 6),
        ...List.generate(labels.length, (i) {
          return Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: colors[i],
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .outline
                          .withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  labels[i],
                  style: TextStyle(
                    fontSize: 8,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.45),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
