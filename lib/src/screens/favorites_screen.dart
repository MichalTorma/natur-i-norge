import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../providers/settings_provider.dart';
import '../models/nin_database.dart';
import '../widgets/local_image.dart';
import '../navigation/app_routes.dart';
import '../nin_type_colors.dart';

class FavoritesScreen extends ConsumerWidget {
  final Future<void> Function(NinType type)? onOpenType;

  const FavoritesScreen({super.key, this.onOpenType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Favorites')),
      body: favoritesAsync.when(
        data: (favoriteIds) {
          if (favoriteIds.isEmpty) {
            final muted = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_outline, size: 64, color: muted.withValues(alpha: 0.5)),
                  const SizedBox(height: 16),
                  Text('No favorites yet', style: TextStyle(color: muted)),
                  Text(
                    'Star any nature type to see it here.',
                    style: TextStyle(color: muted.withValues(alpha: 0.75), fontSize: 12),
                  ),
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
                            color: ninCategoryAccentColor(entry.key),
                          ),
                        ),
                      ),
                      ...entry.value.map((type) => _FavoriteTile(
                            type: type,
                            onOpenType: onOpenType,
                          )),
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
}

class _FavoriteTile extends ConsumerWidget {
  final NinType type;
  final Future<void> Function(NinType type)? onOpenType;

  const _FavoriteTile({required this.type, this.onOpenType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final disableImages = ref.watch(disableImagesProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final accentColor = ninTypeAccentColor(type);

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
                ? TypeImageAmbientBackground(accentColor: accentColor)
                : LocalTypeImage(
                    imageUrl: type.imageUrl,
                    fit: BoxFit.cover,
                    accentColor: accentColor,
                  ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type.navn,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            _NinCodeBadge(typeId: type.id, color: accentColor),
          ],
        ),
        trailing: Icon(Icons.chevron_right, color: colorScheme.onSurface.withValues(alpha: 0.35)),
        onTap: () {
          if (onOpenType != null) {
            onOpenType!(type);
          } else {
            Navigator.push(context, AppRoutes.types(type: type));
          }
        },
      ),
    );
  }
}

class _NinCodeBadge extends StatelessWidget {
  final String typeId;
  final Color color;

  const _NinCodeBadge({required this.typeId, required this.color});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final badgeBackground = colorScheme.brightness == Brightness.dark
        ? Colors.white
        : colorScheme.surface;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: badgeBackground,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4),
        ],
      ),
      child: Text(
        typeId,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w900,
          color: color,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
