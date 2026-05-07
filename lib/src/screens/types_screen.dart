import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../providers/database_provider.dart';
import '../models/nin_database.dart';
import 'type_detail_screen.dart';

class TypesScreen extends ConsumerStatefulWidget {
  const TypesScreen({super.key});

  @override
  ConsumerState<TypesScreen> createState() => _TypesScreenState();
}

class _TypesScreenState extends ConsumerState<TypesScreen> {
  final List<NinType> _breadcrumb = [];
  String _searchQuery = '';
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  void _navigateToChild(NinType type) {
    setState(() {
      _breadcrumb.add(type);
      _isSearching = false;
      _searchController.clear();
      _searchQuery = '';
    });
  }

  void _pop() {
    setState(() {
      if (_breadcrumb.isNotEmpty) {
        _breadcrumb.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final parentId = _breadcrumb.isEmpty ? null : _breadcrumb.last.id;
    
    // Logic for search vs hierarchy
    final typesAsync = _searchQuery.isEmpty 
        ? (parentId == null ? ref.watch(typesListProvider) : ref.watch(subTypesProvider(parentId)))
        : ref.watch(searchTypesProvider(_searchQuery));

    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search NiN codes or names...',
                  border: InputBorder.none,
                ),
                onChanged: (val) => setState(() => _searchQuery = val),
              )
            : Text(_breadcrumb.isEmpty ? 'Nature Types' : _breadcrumb.last.navn),
        leading: _isSearching 
            ? IconButton(icon: const Icon(Icons.close), onPressed: () => setState(() {
                _isSearching = false;
                _searchQuery = '';
                _searchController.clear();
              }))
            : (_breadcrumb.isNotEmpty
                ? IconButton(icon: const Icon(Icons.arrow_back), onPressed: _pop)
                : null),
        actions: [
          if (!_isSearching)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => setState(() => _isSearching = true),
            ),
          if (_breadcrumb.isNotEmpty && !_isSearching)
            _CategoryBadge(label: _breadcrumb.last.kategori),
        ],
      ),
      body: typesAsync.when(
        data: (types) => types.isEmpty && _breadcrumb.isEmpty && _searchQuery.isEmpty
            ? const _EmptyState()
            : _HierarchyList(
                types: types,
                onTap: (type) {
                  // If it's a deep level or has no children, go to detail
                  if (type.kategori == 'Grunntype' || type.kategori == 'Kartleggingsenhet') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => TypeDetailScreen(type: type)),
                    );
                  } else {
                    _navigateToChild(type);
                  }
                },
                level: _breadcrumb.length,
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  final String label;
  const _CategoryBadge({required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 10, color: Colors.greenAccent, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class _HierarchyList extends StatelessWidget {
  final List<NinType> types;
  final Function(NinType) onTap;
  final int level;

  const _HierarchyList({required this.types, required this.onTap, required this.level});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 1200 ? 4 : (MediaQuery.of(context).size.width > 800 ? 3 : 2),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.3,
      ),
      itemCount: types.length,
      itemBuilder: (context, index) {
        return _TypeCard(type: types[index], onTap: () => onTap(types[index]), level: level);
      },
    );
  }
}

class _TypeCard extends StatelessWidget {
  final NinType type;
  final VoidCallback onTap;
  final int level;

  const _TypeCard({required this.type, required this.onTap, required this.level});

  Color _getLevelColor() {
    switch (level) {
      case 0: return Colors.blue;
      case 1: return Colors.green;
      case 2: return Colors.orange;
      case 3: return Colors.purple;
      default: return Colors.teal;
    }
  }

  Future<File?> _getLocalImage() async {
    if (type.imageUrl == null) return null;
    final docsDir = await getApplicationDocumentsDirectory();
    final file = File(p.join(docsDir.path, 'images', type.imageUrl!));
    return await file.exists() ? file : null;
  }

  @override
  Widget build(BuildContext context) {
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
                        opacity: 0.4,
                        child: Image.file(snapshot.data!, fit: BoxFit.cover),
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
                  colors: [
                    _getLevelColor().withOpacity(0.2),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type.id,
                    style: TextStyle(
                      color: _getLevelColor().withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    type.navn,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  if (type.description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      type.description!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10, color: Colors.white.withOpacity(0.6)),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.storage_outlined, size: 64, color: Colors.white.withOpacity(0.2)),
          const SizedBox(height: 16),
          const Text('Database is empty or missing'),
        ],
      ),
    );
  }
}
