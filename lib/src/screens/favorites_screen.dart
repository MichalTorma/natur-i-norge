import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../providers/settings_provider.dart';
import '../models/nin_database.dart';
import '../widgets/local_image.dart';
import 'types_screen.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Favorites')),
      body: favoritesAsync.when(
        data: (favoriteIds) {
          if (favoriteIds.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_outline, size: 64, color: Colors.white24),
                  SizedBox(height: 16),
                  Text('No favorites yet', style: TextStyle(color: Colors.white54)),
                  Text('Star any nature type to see it here.', style: TextStyle(color: Colors.white38, fontSize: 12)),
                ],
              ),
            );
          }

          return FutureBuilder<List<NinType>>(
            future: _loadFavoriteDetails(ref, favoriteIds),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
              
              final favorites = snapshot.data!;
              final grouped = _groupFavorites(favorites);

              return ListView(
                padding: const EdgeInsets.all(16),
                children: grouped.entries.map((entry) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                        child: Text(
                          entry.key.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: _getCategoryColor(entry.key),
                          ),
                        ),
                      ),
                      ...entry.value.map((type) => _FavoriteTile(type: type)),
                      const SizedBox(height: 16),
                    ],
                  );
                }).toList(),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Future<List<NinType>> _loadFavoriteDetails(WidgetRef ref, List<String> ids) async {
    final db = ref.read(databaseProvider);
    return (db.select(db.ninTypes)..where((t) => t.id.isIn(ids))).get();
  }

  Map<String, List<NinType>> _groupFavorites(List<NinType> favorites) {
    final Map<String, List<NinType>> groups = {};
    for (var f in favorites) {
      final cat = f.kategori;
      if (!groups.containsKey(cat)) groups[cat] = [];
      groups[cat]!.add(f);
    }
    return groups;
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Type': return Colors.blueAccent;
      case 'Hovedtypegruppe': return Colors.greenAccent;
      case 'Hovedtype': return Colors.orangeAccent;
      case 'Grunntype': return Colors.purpleAccent;
      default: return Colors.tealAccent;
    }
  }
}

class _FavoriteTile extends ConsumerWidget {
  final NinType type;

  const _FavoriteTile({required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final disableImages = ref.watch(disableImagesProvider);
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            width: 60,
            height: 60,
            child: disableImages
                ? Container(color: Colors.black26, child: const Icon(Icons.image_not_supported, size: 20))
                : LocalTypeImage(
                    imageUrl: type.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: Container(color: Colors.black26, child: const Icon(Icons.image_not_supported, size: 20)),
                  ),
          ),
        ),
        title: Text(type.navn, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(type.id, style: const TextStyle(fontSize: 12, color: Colors.white54)),
        trailing: const Icon(Icons.chevron_right, color: Colors.white24),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => TypesScreen(type: type)),
          );
        },
      ),
    );
  }
}
