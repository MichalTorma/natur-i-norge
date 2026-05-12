import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart' show Value;
import '../providers/settings_provider.dart';
import '../providers/database_provider.dart';
import '../models/nin_database.dart';
import '../models/user_database.dart';
import '../widgets/ecological_matrix.dart';
import '../widgets/expandable_markdown.dart';
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
                                      MaterialPageRoute(builder: (_) => TypesScreen(type: types[index], onPick: widget.onPick)),
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
            SliverToBoxAdapter(
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
                    ExpandableMarkdown(data: widget.type!.description!),
                    const Divider(height: 32),
                  ],
                ),
              ),
            ),

          // Sub-types Content
          typesAsync.when(
            data: (allTypes) {
              if (allTypes.isEmpty && widget.type != null) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text('No further sub-types available.', style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3))),
                  ),
                );
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
                            Text(
                              'ECOLOGICAL MATRIX (${selectedScale == 'Biologisk' ? 'BIO' : selectedScale})',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary, letterSpacing: 1.2),
                            ),
                            const SizedBox(height: 8),
                            EcologicalMatrix(subTypes: matrixTypes, onPick: widget.onPick),
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
                                    MaterialPageRoute(builder: (_) => TypesScreen(type: cTypes[index], onPick: widget.onPick)),
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
                            MaterialPageRoute(builder: (_) => TypesScreen(type: types[index], onPick: widget.onPick)),
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
      floatingActionButton: () {
        if (widget.type == null) return null;
        
        final isMappingUnit = widget.type!.kategori == 'Kartleggingsenhet';
        final isGrunntype = widget.type!.kategori == 'Grunntype';

        if (widget.onPick != null) {
          // Picker mode logic
          if (isMappingUnit) {
            return FloatingActionButton.extended(
              onPressed: () => widget.onPick!(widget.type!),
              icon: const Icon(Icons.check_circle),
              label: const Text('Select this Mapping Unit'),
              backgroundColor: Colors.green[700],
              foregroundColor: Colors.white,
            );
          } else if (isGrunntype) {
            return FloatingActionButton.extended(
              onPressed: null, // Disabled
              icon: const Icon(Icons.warning_amber_rounded, color: Colors.white70),
              label: const Text('Please select a Mapping Unit level'),
              backgroundColor: Colors.orange[800]?.withOpacity(0.8),
            );
          }
        } else {
          // Browsing mode logic
          if (isMappingUnit || isGrunntype) {
             return FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CameraScreen(initialType: widget.type)),
                );
              },
              icon: const Icon(Icons.add_a_photo),
              label: const Text('Capture Observation'),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            );
          }
        }
        return null;
      }(),
    );
  }

  Widget _buildAppBar(BuildContext context, WidgetRef ref) {
    final type = widget.type;
    final level = type == null ? 0 : (type.kategori == 'Type' ? 0 : (type.kategori == 'Hovedtype' ? 1 : 2));
    final color = level == 0 ? Colors.blue : (level == 1 ? Colors.green : Colors.orange);
    
    return SliverAppBar(
      expandedHeight: type == null ? 120 : 350,
      pinned: true,
      iconTheme: const IconThemeData(color: Colors.white, shadows: [Shadow(color: Colors.black45, blurRadius: 8)]),
      actions: [
        if (type != null && type.langkode != null)
          IconButton(
            icon: const Icon(Icons.open_in_browser, color: Colors.white),
            tooltip: 'View on Artsdatabanken',
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
        titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              type?.navn ?? 'NiN Explorer',
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface,
                shadows: [Shadow(color: Theme.of(context).colorScheme.surface.withOpacity(0.8), blurRadius: 12)],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (type == null)
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
        ),
        background: type == null ? null : Stack(
          fit: StackFit.expand,
          children: [
            // Hero Image
            Hero(
              tag: 'image_${type.id}',
              child: FutureBuilder<File?>(
                future: _getLocalImage(type),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return Image.file(snapshot.data!, fit: BoxFit.cover);
                  }
                  return Container(
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
                  );
                },
              ),
            ),
            // Legibility Gradient
            Positioned.fill(
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
            // ID Badge in Card Style
            Positioned(
              left: 16,
              bottom: 48, // Above the title
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4)),
                  ],
                ),
                child: Text(
                  type.id,
                  style: TextStyle(
                    fontSize: 14, 
                    fontWeight: FontWeight.w900, 
                    color: color,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<File?> _getLocalImage(NinType type) async {
    if (type.imageUrl == null) return null;
    final docsDir = await getApplicationDocumentsDirectory();
    final file = File(p.join(docsDir.path, 'images', type.imageUrl!));
    return await file.exists() ? file : null;
  }
}

class _TypeCard extends StatelessWidget {
  final NinType type;
  final VoidCallback onTap;
  final int level;

  const _TypeCard({required this.type, required this.onTap, required this.level});

  Future<File?> _getLocalImage() async {
    if (type.imageUrl == null) return null;
    final docsDir = await getApplicationDocumentsDirectory();
    final file = File(p.join(docsDir.path, 'images', type.imageUrl!));
    return await file.exists() ? file : null;
  }

  @override
  Widget build(BuildContext context) {
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
                child: FutureBuilder<File?>(
                  future: _getLocalImage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Opacity(
                        opacity: isIcon ? 1.0 : 0.8,
                        child: Padding(
                          padding: isIcon ? const EdgeInsets.all(16.0) : EdgeInsets.zero,
                          child: Image.file(snapshot.data!, fit: isIcon ? BoxFit.contain : BoxFit.cover),
                        ),
                      );
                    }
                    return Container(color: Theme.of(context).colorScheme.surfaceContainerHighest);
                  },
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
