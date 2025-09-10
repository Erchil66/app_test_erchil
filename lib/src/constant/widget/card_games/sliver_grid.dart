import 'package:apptest/src/constant/widget/card_games/view_cards.dart';
import 'package:apptest/src/page/home.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryGridSliver extends ConsumerWidget {
  const CategoryGridSliver({
    super.key,
    required this.label,
    required this.bannerCount,
    this.maxTileExtent = 150,
    this.spacing = 15,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    this.childAspectRatio = 1,
  });

  final String label;
  final int? bannerCount;
  final double maxTileExtent;
  final double spacing;
  final EdgeInsets padding;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total = label == "BUSCAR" ? 10 : (bannerCount ?? 0);

    final visible = ref.watch(visibleCountProvider(label));
    final itemCount = visible.clamp(0, total);

    if (total == 0) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverPadding(
      padding: padding,
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: maxTileExtent,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: childAspectRatio,
        ),
        delegate: SliverChildBuilderDelegate(
          (_, index) => const ViewCards(),
          childCount: itemCount,
        ),
      ),
    );
  }
}
