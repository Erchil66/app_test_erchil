import 'package:apptest/gen/assets.gen.dart';
import 'package:apptest/gen/colors.gen.dart';
import 'package:apptest/src/constant/theme.dart';
import 'package:apptest/src/constant/widget/category/category.dart';
import 'package:apptest/src/models/bottom_bar_list.dart';
import 'package:apptest/src/page/home.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomBar extends HookConsumerWidget {
  final BottomBarList? currentSelected;
  final Function(BottomBarList? selected)? onPress;

  const BottomBar({super.key, this.currentSelected, this.onPress});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCollapsed = ref.watch(isCollapse);

    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      width: MediaQuery.of(context).size.width,
      height: 90.spMin,

      decoration: BoxDecoration(
        color: isCollapsed == false
            ? Theme.of(context).scaffoldBackgroundColor
            : Colors.transparent,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...bottomList.map(
                (x) => AnimatedOpacity(
                  opacity: isCollapsed == true ? 0.0 : 1,
                  duration: Duration(milliseconds: 600),
                  child: ItemBlocks(
                    tooltip: x.label ?? "",
                    onPressed: () {
                      onPress?.call(x);
                    },
                    childBuilder: (childBuilder) => Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        x.svgicon!.svg(
                          height: 25.spMin,
                          colorFilter: ColorFilter.mode(
                            x.label == currentSelected!.label
                                ? ColorName.royalBlue
                                : ColorName.royalGray.withValues(alpha: 0.5),
                            BlendMode.srcIn,
                          ),
                        ),
                        4.spMin.verticalSpace,
                        Text(
                          "${x.label}",
                          style: context.poppin.label.semiBold.withColor(
                            x.label == currentSelected!.label
                                ? ColorName.royalBlue
                                : ColorName.royalGray.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ItemBlocks(
                tooltip: "EXPANDIR",
                onPressed: () {
                  ref.read(isCollapse.notifier).update((x) => x = !isCollapsed);
                },
                childBuilder: (childBuilder) => Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (isCollapsed == false
                            ? Assets.svg.expandArrows
                            : Assets.svg.compressAlt)
                        .svg(
                          height: 25.spMin,
                          colorFilter: ColorFilter.mode(
                            ColorName.royalBlue,
                            BlendMode.srcIn,
                          ),
                        ),

                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        "EXPANDIR",
                        style: context.poppin.label.semiBold.withColor(
                          isCollapsed == true
                              ? Colors.transparent
                              : ColorName.royalGray.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
