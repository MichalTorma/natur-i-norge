import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show Value;
import '../providers/settings_provider.dart';
import '../providers/database_provider.dart';
import '../models/nin_database.dart';
import '../models/user_database.dart';
import '../navigation/app_routes.dart';
import '../widgets/ecological_matrix.dart';
import '../widgets/gad_species_panel.dart';
import '../providers/gad_provider.dart';
import '../widgets/expandable_markdown.dart';
import '../widgets/local_image.dart';
import '../widgets/type_image_viewer.dart';
import 'camera_screen.dart';

class TypesScreen extends ConsumerStatefulWidget {
  final NinType? type;
  final ValueChanged<NinType>? onPick;
  const TypesScreen({super.key, this.type, this.onPick});

  @override
  ConsumerState<TypesScreen> createState() => _TypesScreenState();
}

class _TypesScreenState extends ConsumerState<TypesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final selectedScale = ref.watch(selectedScaleProvider);
    final showLkmNames = ref.watch(showLkmNamesProvider);
    final hovedtypeId = widget.type?.id;
    final isGadCompatible = isGadCompatibleHovedtype(hovedtypeId);
    final gadOverlayVisible =
        isGadCompatible ? ref.watch(gadOverlayVisibleProvider) : false;
    final gadConstancy = isGadCompatible && gadOverlayVisible
        ? ref.watch(gadConstancyMapProvider).asData?.value
        : null;
    final parentId = widget.type?.id;
    final typesAsync = _searchQuery.isEmpty
        ? ref.watch(subTypesProvider(parentId ?? ''))
        : ref.watch(searchTypesProvider(_searchQuery));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, ref),
          
          // Favorites Quick Access
          if (widget.type == null)
            Consumer(
              builder: (context, ref, child) {
                final favoritesAsync = ref.watch(favoritesProvider);
                return favoritesAsync.when(
                  data: (favIds) {
                    if (favIds.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());
                    final favTypesAsync = ref.watch(typesByIdsProvider(favIds));
                    return favTypesAsync.when(
                      data: (types) => SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                              child: Row(
                                children: [
                                  Icon(Icons.star, size: 16, color: Colors.amber[700]),
                                  const SizedBox(width: 8),
                                  Text(
                                    'FAVORITES',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.amber[700], letterSpacing: 1.2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                itemCount: types.length,
                                itemBuilder: (context, index) => SizedBox(
                                  width: 160,
                                  child: _TypeCard(
                                    type: types[index],
                                    onTap: () => Navigator.push(
                                      context,
                                      AppRoutes.types(type: types[index], onPick: widget.onPick),
                                    ),
                                    level: 2,
                                  ),
                                ),
                              ),
                            ),
                            const Divider(indent: 16, endIndent: 16, height: 32),
                          ],
                        ),
                      ),
                      loading: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
                      error: (_, __) => const SliverToBoxAdapter(child: SizedBox.shrink()),
                    );
                  },
                  loading: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
                  error: (_, __) => const SliverToBoxAdapter(child: SizedBox.shrink()),
                );
              },
            ),
          
          // Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search codes or names...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
            ),
          ),
          
          // Description Header
          if (widget.type != null && widget.type!.description != null && _searchQuery.isEmpty)
            Consumer(
              builder: (context, ref, _) {
                final subtypesAsync = ref.watch(subTypesProvider(widget.type!.id));
                final hasSubtypes = subtypesAsync.maybeWhen(
                  data: (types) => types.isNotEmpty,
                  orElse: () => false,
                );

                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 4, 24, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _Badge(label: widget.type!.kategori),
                            if (widget.type!.ecosystnivaaNavn != null) ...[
                              const SizedBox(width: 8),
                              _Badge(label: widget.type!.ecosystnivaaNavn!, color: Colors.blue),
                            ],
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Beskrivelse',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        ExpandableMarkdown(
                          data: widget.type!.description!,
                          collapsible: hasSubtypes,
                        ),
                        const Divider(height: 32),
                      ],
                    ),
                  ),
                );
              },
            ),

          // Sub-types Content
          typesAsync.when(
            data: (allTypes) {
              if (allTypes.isEmpty && widget.type != null) {
                return const SliverToBoxAdapter(child: SizedBox.shrink());
              }

              final isHovedtype = widget.type?.kategori == 'Hovedtype';
              
              // Filter types based on selection
              final types = allTypes.where((t) {
                if (_searchQuery.isNotEmpty) return true;
                if (!isHovedtype) return true;
                
                if (selectedScale == 'Biologisk') {
                  return t.kategori == 'Grunntype';
                } else {
                  return t.kategori == 'Kartleggingsenhet' && t.scale == selectedScale;
                }
              }).toList()..sort((a, b) => a.id.compareTo(b.id));

              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    if (isHovedtype && _searchQuery.isEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          'VISNINGSMODUS',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4), letterSpacing: 1.2),
                        ),
                      ),
                      Center(
                        child: SegmentedButton<String>(
                          segments: const [
                            ButtonSegment(value: 'Biologisk', label: Text('Grunntyper'), icon: Icon(Icons.biotech)),
                            ButtonSegment(value: 'M005', label: Text('1:5 000')),
                            ButtonSegment(value: 'M020', label: Text('1:20 000')),
                            ButtonSegment(value: 'M050', label: Text('1:50 000')),
                          ],
                          selected: {selectedScale},
                          onSelectionChanged: (set) => ref.read(selectedScaleProvider.notifier).setScale(set.first),
                          style: SegmentedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
                            selectedBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
                            selectedForegroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      // Show matrix for both biological and mapping scales
                      () {
                        final List<NinType> matrixTypes;
                        if (selectedScale == 'Biologisk') {
                          matrixTypes = allTypes.where((t) => t.kategori == 'Grunntype').toList()..sort((a, b) => a.id.compareTo(b.id));
                        } else {
                          // For Kartleggingsenhet, synthesize LKM data from constituent Grunntyper
                          final gtMap = {for (var gt in allTypes.where((t) => t.kategori == 'Grunntype')) gt.id: gt};
                          matrixTypes = allTypes
                              .where((t) => t.kategori == 'Kartleggingsenhet' && t.scale == selectedScale)
                              .map((ke) {
                            if (ke.containsTypes == null) return ke;
                            try {
                              final List<dynamic> ids = json.decode(ke.containsTypes!);
                              final List<dynamic> mergedLkm = [];
                              for (var id in ids) {
                                final gt = gtMap[id.toString()];
                                if (gt?.lkmData != null) {
                                  mergedLkm.addAll(json.decode(gt!.lkmData!));
                                }
                              }
                              if (mergedLkm.isEmpty) return ke;
                              return ke.copyWith(lkmData: Value(json.encode(mergedLkm)));
                            } catch (e) {
                              return ke;
                            }
                          }).toList()..sort((a, b) => a.id.compareTo(b.id));
                        }

                        if (matrixTypes.isEmpty) return const SizedBox.shrink();

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (isGadCompatible) ...[
                              GadSpeciesPanel(hovedtypeId: hovedtypeId!),
                              const SizedBox(height: 12),
                            ],
                            Row(
                              children: [
                                Text(
                                  'ECOLOGICAL MATRIX (${selectedScale == 'Biologisk' ? 'BIO' : selectedScale})',
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary, letterSpacing: 1.2),
                                ),
                                const SizedBox(width: 4),
                                PopupMenuButton<bool>(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  icon: Icon(Icons.settings, size: 14, color: Theme.of(context).colorScheme.primary.withOpacity(0.6)),
                                  tooltip: 'Matrix settings',
                                  onSelected: (val) => ref.read(showLkmNamesProvider.notifier).setShowLkmNames(val),
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(value: true, child: Text('Show step names')),
                                    const PopupMenuItem(value: false, child: Text('Show step codes')),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            EcologicalMatrix(
                              subTypes: matrixTypes,
                              onPick: widget.onPick,
                              showStepNames: showLkmNames,
                              gadConstancy: gadConstancy,
                            ),
                            const Divider(height: 48),
                          ],
                        );
                      }(),
                      
                      Text(
                        selectedScale == 'Biologisk' ? 'GRUNNTYPER' : 'KARTLEGGINGSENHETER ($selectedScale)',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4), letterSpacing: 1.2),
                      ),
                      const SizedBox(height: 8),
                    ],
                    
                    if (types.isEmpty && selectedScale == 'Biologisk' && !isHovedtype) ...[
                      // If we are at a Kartleggingsenhet, show what it contains
                      if (widget.type?.kategori == 'Kartleggingsenhet' && widget.type?.containsTypes != null) ...[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'CONSTITUENT NATURE TYPES',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary, letterSpacing: 1.2),
                          ),
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            final List<String> ids = List<String>.from(json.decode(widget.type!.containsTypes!));
                            final constituentTypes = ref.watch(typesByIdsProvider(ids));
                            
                            return constituentTypes.when(
                              data: (cTypes) => GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 2.0,
                                ),
                                padding: const EdgeInsets.only(top: 12, bottom: 16),
                                itemCount: cTypes.length,
                                itemBuilder: (context, index) => _TypeCard(
                                  type: cTypes[index],
                                  onTap: () => Navigator.push(
                                    context,
                                    AppRoutes.types(type: cTypes[index], onPick: widget.onPick),
                                  ),
                                  level: 2,
                                ),
                              ),
                              loading: () => const Center(child: CircularProgressIndicator()),
                              error: (e, s) => Text('Error loading types: $e'),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                      ],
                    ],
                    
                    if (types.isNotEmpty)
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.3,
                        ),
                        padding: const EdgeInsets.only(top: 12, bottom: 24),
                        itemCount: types.length,
                        itemBuilder: (context, index) => _TypeCard(
                          type: types[index],
                          onTap: () => Navigator.push(
                            context,
                            AppRoutes.types(type: types[index], onPick: widget.onPick),
                          ),
                          level: widget.type == null ? 0 : 2,
                        ),
                      ),
                  ]),
                ),
              );
            },
            loading: () => const SliverToBoxAdapter(
              child: Center(child: Padding(
                padding: EdgeInsets.all(32.0),
                child: CircularProgressIndicator(),
              )),
            ),
            error: (err, stack) => SliverToBoxAdapter(child: Center(child: Text('Error: $err'))),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(typesAsync),
    );
  }

  Widget? _buildFloatingActionButton(AsyncValue<List<NinType>> typesAsync) {
    if (widget.type == null || _searchQuery.isNotEmpty) return null;

    return typesAsync.when(
      data: (subtypes) {
        final isLeaf = subtypes.isEmpty;
        final isMappingUnit = widget.type!.kategori == 'Kartleggingsenhet';
        final isGrunntype = widget.type!.kategori == 'Grunntype';

        if (widget.onPick != null) {
          if (isMappingUnit) {
            return FloatingActionButton.extended(
              onPressed: () => widget.onPick!(widget.type!),
              icon: const Icon(Icons.check_circle),
              label: const Text('Select this Mapping Unit'),
              backgroundColor: Colors.green[700],
              foregroundColor: Colors.white,
            );
          }
          if (isGrunntype) {
            return FloatingActionButton.extended(
              onPressed: null,
              icon: const Icon(Icons.warning_amber_rounded, color: Colors.white70),
              label: const Text('Please select a Mapping Unit level'),
              backgroundColor: Colors.orange[800]?.withOpacity(0.8),
            );
          }
          return null;
        }

        if (!isLeaf) return null;

        return FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push(
              AppRoutes.camera(initialType: widget.type),
            );
          },
          icon: const Icon(Icons.add_a_photo),
          label: const Text('Capture Observation'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        );
      },
      loading: () => null,
      error: (_, __) => null,
    );
  }

  Widget _buildAppBar(BuildContext context, WidgetRef ref) {
    final type = widget.type;
    final level = type == null ? 0 : (type.kategori == 'Type' ? 0 : (type.kategori == 'Hovedtype' ? 1 : 2));
    final color = level == 0 ? Colors.blue : (level == 1 ? Colors.green : Colors.orange);
    final disableImages = ref.watch(disableImagesProvider);
    final canViewImage = type != null &&
        !disableImages &&
        type.imageUrl != null &&
        type.imageUrl!.isNotEmpty;
    
    return SliverAppBar(
      expandedHeight: type == null ? 120 : 350,
      pinned: true,
      iconTheme: const IconThemeData(color: Colors.white, shadows: [Shadow(color: Colors.black45, blurRadius: 8)]),
      actions: [
        if (type != null && type.langkode != null)
          IconButton(
            icon: const Icon(Icons.open_in_browser, color: Colors.white),
            tooltip: 'View details on Artsdatabanken website',
            onPressed: () => launchUrl(
              Uri.parse('https://artsdatabanken.no/naturtyper/natur-i-norge/${type.langkode}'),
              mode: LaunchMode.externalApplication,
            ),
          ),
        if (type != null)
          Consumer(
            builder: (context, ref, child) {
              final favorites = ref.watch(favoritesProvider).value ?? [];
              final isFavorite = favorites.contains(type.id);
              return IconButton(
                icon: Icon(isFavorite ? Icons.star : Icons.star_border),
                color: isFavorite ? Colors.amber : Colors.white,
                tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',
                onPressed: () async {
                  final db = ref.read(userDatabaseProvider);
                  if (isFavorite) {
                    await (db.delete(db.favorites)..where((t) => t.typeId.equals(type.id))).go();
                  } else {
                    await db.into(db.favorites).insert(FavoritesCompanion.insert(typeId: type.id));
                  }
                },
              );
            },
          ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 56, right: 16, bottom: 14),
        title: type == null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'NiN Explorer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                      shadows: [Shadow(color: Theme.of(context).colorScheme.surface.withOpacity(0.8), blurRadius: 12)],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => launchUrl(
                      Uri.parse('https://artsdatabanken.no'),
                      mode: LaunchMode.externalApplication,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        'Data provided by Artsdatabanken.no',
                        style: TextStyle(
                          fontSize: 10,
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
                      ],
                    ),
                    child: Text(
                      type.id,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: color,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      type.navn,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSurface,
                        shadows: [Shadow(color: Theme.of(context).colorScheme.surface.withOpacity(0.8), blurRadius: 12)],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
        background: type == null ? null : Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: canViewImage
                  ? () => showTypeImageViewer(
                        context,
                        imageUrl: type.imageUrl!,
                        title: type.navn,
                      )
                  : null,
              child: Hero(
                tag: 'image_${type.id}',
                child: disableImages
                    ? Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              color.withOpacity(0.8),
                              Theme.of(context).colorScheme.surface,
                            ],
                          ),
                        ),
                      )
                    : LocalTypeImage(
                        imageUrl: type.imageUrl,
                        fit: BoxFit.cover,
                        semanticLabel: 'Representative photo of ${type.navn}',
                        accentColor: color,
                      ),
              ),
            ),
            if (canViewImage)
              const Positioned(
                top: 72,
                right: 12,
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0x66000000),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.zoom_out_map, color: Colors.white, size: 18),
                    ),
                  ),
                ),
              ),
            // Legibility Gradient — ignore pointer so taps reach the image
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: const [0.0, 0.4, 0.8],
                      colors: [
                        Theme.of(context).colorScheme.surface.withOpacity(0.7),
                        Theme.of(context).colorScheme.surface.withOpacity(0.2),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TypeCard extends ConsumerWidget {
  final NinType type;
  final VoidCallback onTap;
  final int level;

  const _TypeCard({required this.type, required this.onTap, required this.level});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final disableImages = ref.watch(disableImagesProvider);
    final isIcon = level <= 1;
    final color = level == 0 ? Colors.blue : (level == 1 ? Colors.green : Colors.orange);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                tag: 'image_${type.id}',
                child: disableImages
                    ? Container(color: Theme.of(context).colorScheme.surfaceContainerHighest)
                    : LocalTypeImage(
                        imageUrl: type.imageUrl,
                        fit: isIcon ? BoxFit.contain : BoxFit.cover,
                        semanticLabel: 'Representative photo of ${type.navn}',
                        padding: isIcon ? const EdgeInsets.all(16.0) : EdgeInsets.zero,
                        accentColor: color,
                      ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.0, 0.3, 0.6],
                    colors: [
                      color.withOpacity(0.9),
                      color.withOpacity(0.4),
                      color.withOpacity(0.0),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final bool isTight = constraints.maxHeight < 80;
                    
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: isTight ? 1 : 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2)),
                            ],
                          ),
                          child: Text(
                            type.id,
                            style: TextStyle(
                              fontSize: isTight ? 10 : 12, 
                              fontWeight: FontWeight.w900, 
                              color: color, 
                              letterSpacing: 0.5
                            ),
                          ),
                        ),
                        SizedBox(height: isTight ? 4 : 8),
                        Text(
                          type.navn,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: isTight ? 12 : 14, 
                            fontWeight: FontWeight.bold, 
                            color: Theme.of(context).colorScheme.onSurface,
                            shadows: [
                              Shadow(color: Theme.of(context).colorScheme.surface.withOpacity(0.8), blurRadius: 4),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;
  const _Badge({required this.label, this.color = Colors.green});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(label.toUpperCase(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color)),
    );
  }
}
