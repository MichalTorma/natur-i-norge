import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../models/nin_database.dart';

class TypesScreen extends ConsumerStatefulWidget {
  const TypesScreen({super.key});

  @override
  ConsumerState<TypesScreen> createState() => _TypesScreenState();
}

class _TypesScreenState extends ConsumerState<TypesScreen> {
  final List<NinType> _breadcrumb = [];

  void _navigateToChild(NinType type) {
    setState(() {
      _breadcrumb.add(type);
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
    final typesAsync = parentId == null
        ? ref.watch(typesListProvider)
        : ref.watch(subTypesProvider(parentId));

    return Scaffold(
      appBar: AppBar(
        title: Text(_breadcrumb.isEmpty ? 'Nature Types' : _breadcrumb.last.navn),
        leading: _breadcrumb.isNotEmpty
            ? IconButton(icon: const Icon(Icons.arrow_back), onPressed: _pop)
            : null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (_breadcrumb.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _breadcrumb.last.kategori,
                    style: const TextStyle(fontSize: 12, color: Colors.greenAccent),
                  ),
                ),
              ),
            ),
        ],
      ),
      body: typesAsync.when(
        data: (types) => types.isEmpty && _breadcrumb.isEmpty
            ? const _EmptyState()
            : _HierarchyList(
                types: types,
                onTap: _navigateToChild,
                level: _breadcrumb.length,
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}

class _HierarchyList extends StatelessWidget {
  final List<NinType> types;
  final Function(NinType) onTap;
  final int level;

  const _HierarchyList({
    required this.types,
    required this.onTap,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 1200 ? 4 : (MediaQuery.of(context).size.width > 800 ? 3 : 2),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: types.length,
      itemBuilder: (context, index) {
        final type = types[index];
        return _TypeCard(type: type, onTap: () => onTap(type), level: level);
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

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            if (type.imageUrl != null)
              Positioned.fill(
                child: Opacity(
                  opacity: 0.3,
                  child: Image.network(
                    type.imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                  ),
                ),
              ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _getLevelColor().withOpacity(0.1),
                    Colors.black.withOpacity(0.4),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          type.id,
                          style: TextStyle(
                            color: _getLevelColor().withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    type.navn,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (type.description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      type.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white.withOpacity(0.7),
                        height: 1.2,
                      ),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: _getLevelColor().withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      type.kategori.toUpperCase(),
                      style: TextStyle(
                        fontSize: 9,
                        color: _getLevelColor().withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
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
          const Text('Database is empty'),
          const SizedBox(height: 8),
          const Text('Go to Settings to sync data', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
