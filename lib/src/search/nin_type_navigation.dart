import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/nin_database.dart';
import '../navigation/app_routes.dart';
import '../providers/database_provider.dart';
import '../providers/nin_search_provider.dart';

Future<List<NinType>> resolveTypePath(NinDatabase db, NinType target) async {
  final path = <NinType>[];
  NinType? current = target;

  while (current != null) {
    path.insert(0, current);
    final parentId = current.parentId;
    if (parentId == null || parentId.isEmpty) break;
    current = await (db.select(db.ninTypes)..where((t) => t.id.equals(parentId)))
        .getSingleOrNull();
  }

  return path;
}

Future<void> navigateToTypePath(
  BuildContext context,
  WidgetRef ref,
  NinType target, {
  ValueChanged<NinType>? onPick,
  String? highlightQuery,
  bool resetStack = true,
}) async {
  final db = ref.read(databaseProvider);
  final path = await resolveTypePath(db, target);
  if (!context.mounted) return;

  final nav = Navigator.of(context);
  if (resetStack) {
    nav.popUntil((route) => route.isFirst);
  }

  ref.read(pendingSearchHighlightProvider.notifier).setHighlight(
        typeId: target.id,
        query: highlightQuery,
      );

  for (var i = 0; i < path.length; i++) {
    nav.push(
      AppRoutes.types(
        type: path[i],
        onPick: onPick,
        highlightQuery: i == path.length - 1 ? highlightQuery : null,
      ),
    );
  }
}
