import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
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

class TypesScreen extends ConsumerStatefulWidget {
  final NinType? type;
  const TypesScreen({super.key, this.type});

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
          
          // Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search codes or names...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.05),
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
                padding: const EdgeInsets.all(24.0),
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
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.greenAccent),
                    ),
                    const SizedBox(height: 12),
                    ExpandableMarkdown(data: widget.type!.description!),
                    const Divider(height: 64),
                  ],
                ),
              ),
            ),

          // Sub-types Content
          typesAsync.when(
            data: (allTypes) {
              if (allTypes.isEmpty && widget.type != null) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text('No further sub-types available.', style: TextStyle(color: Colors.white24)),
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
              }).toList();

              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    if (isHovedtype && _searchQuery.isEmpty) ...[
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'VISNINGSMODUS',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white38, letterSpacing: 1.2),
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
                            backgroundColor: Colors.white.withOpacity(0.05),
                            selectedBackgroundColor: Colors.greenAccent.withOpacity(0.2),
                            selectedForegroundColor: Colors.greenAccent,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Show matrix for both biological and mapping scales
                      () {
                        final List<NinType> matrixTypes;
                        if (selectedScale == 'Biologisk') {
                          matrixTypes = allTypes.where((t) => t.kategori == 'Grunntype').toList();
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
                          }).toList();
                        }

                        if (matrixTypes.isEmpty) return const SizedBox.shrink();

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ECOLOGICAL MATRIX (${selectedScale == 'Biologisk' ? 'BIO' : selectedScale})',
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.greenAccent, letterSpacing: 1.2),
                            ),
                            const SizedBox(height: 16),
                            EcologicalMatrix(subTypes: matrixTypes),
                            const Divider(height: 48),
                          ],
                        );
                      }(),
                      
                      Text(
                        selectedScale == 'Biologisk' ? 'GRUNNTYPER' : 'KARTLEGGINGSENHETER ($selectedScale)',
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white38, letterSpacing: 1.2),
                      ),
                      const SizedBox(height: 16),
                    ],
                    
                    if (types.isEmpty && selectedScale == 'Biologisk' && !isHovedtype) ...[
                      // If we are at a Kartleggingsenhet, show what it contains
                      if (widget.type?.kategori == 'Kartleggingsenhet' && widget.type?.containsTypes != null) ...[
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'CONSTITUENT NATURE TYPES',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.greenAccent, letterSpacing: 1.2),
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
                                itemCount: cTypes.length,
                                itemBuilder: (context, index) => _TypeCard(
                                  type: cTypes[index],
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => TypesScreen(type: cTypes[index])),
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
                        itemCount: types.length,
                        itemBuilder: (context, index) => _TypeCard(
                          type: types[index],
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => TypesScreen(type: types[index])),
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
    );
  }

  Widget _buildAppBar(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      expandedHeight: widget.type == null ? 120 : 300,
      pinned: true,
      actions: [
        if (widget.type != null)
          Consumer(
            builder: (context, ref, child) {
              final favorites = ref.watch(favoritesProvider).value ?? [];
              final isFavorite = favorites.contains(widget.type!.id);
              return IconButton(
                icon: Icon(isFavorite ? Icons.star : Icons.star_border),
                color: isFavorite ? Colors.amber : Colors.white,
                onPressed: () async {
                  final db = ref.read(userDatabaseProvider);
                  if (isFavorite) {
                    await (db.delete(db.favorites)..where((t) => t.typeId.equals(widget.type!.id))).go();
                  } else {
                    await db.into(db.favorites).insert(FavoritesCompanion.insert(typeId: widget.type!.id));
                  }
                },
              );
            },
          ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          widget.type?.id ?? 'NiN Explorer',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        background: widget.type == null ? null : Hero(
          tag: 'image_${widget.type!.id}',
          child: FutureBuilder<File?>(
            future: _getLocalImage(widget.type!),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return Image.file(snapshot.data!, fit: BoxFit.cover);
              }
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.green.shade900, Colors.black],
                  ),
                ),
              );
            },
          ),
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
                        opacity: isIcon ? 1.0 : 0.4,
                        child: Padding(
                          padding: isIcon ? const EdgeInsets.all(16.0) : EdgeInsets.zero,
                          child: Image.file(snapshot.data!, fit: isIcon ? BoxFit.contain : BoxFit.cover),
                        ),
                      );
                    }
                    return Container(color: Colors.black26);
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color.withOpacity(0.2), Colors.black.withOpacity(0.6)],
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(type.id, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color.withOpacity(0.8))),
                  const Spacer(),
                  Text(type.navn, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
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
