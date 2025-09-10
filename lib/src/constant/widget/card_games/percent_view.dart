import 'package:apptest/src/constant/theme.dart';
import 'package:apptest/src/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CategoryLoadMoreSliver extends ConsumerWidget {
  const CategoryLoadMoreSliver({
    super.key,
    required this.label,
    required this.bannerCount,
    this.step = 10,
  });

  final String label;
  final int? bannerCount;
  final int step;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total = label == "BUSCAR" ? 10 : (bannerCount ?? 0);
    if (total == 0) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
    final visible = ref.watch(visibleCountProvider(label));
    final notifier = ref.read(visibleCountProvider(label).notifier);

    final percent = total > 0 ? (visible / total).clamp(0, 1.0) : 0.0;
    final hasMore = visible < total;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 130.0, top: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("$step / $bannerCount", style: context.poppin.display.medium),
            10.spMin.verticalSpace,
            Center(
              child: SizedBox(
                width: 200.0,
                child: LinearPercentIndicator(
                  width: 200.0,
                  lineHeight: 14.0,
                  percent: percent.toDouble(),
                  backgroundColor: Colors.grey.shade400,
                  progressColor: Colors.blue,
                  barRadius: const Radius.circular(20),
                  center: Text(
                    "${(percent * bannerCount!).toStringAsFixed(0)}%",
                    style: context.poppin.display.medium,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (hasMore)
              SizedBox(
                height: 40,
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    final next = (visible + step).clamp(0, total);
                    notifier.state = next;
                  },
                  child: const Text(
                    "LOAD MORE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
