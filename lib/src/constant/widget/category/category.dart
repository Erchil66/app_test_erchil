import 'package:apptest/gen/colors.gen.dart';
import 'package:apptest/src/constant/theme.dart';
import 'package:apptest/src/models/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:badges/badges.dart' as badges;

class CategoryListView extends HookConsumerWidget {
  final String? currentSelected;
  final Function(CategoryList? selected)? onPress;

  const CategoryListView({super.key, this.currentSelected, this.onPress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scroll = useScrollController();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 60.spMin,
              //width: 80.spMin,
              child: ListView.builder(
                controller: scroll,
                itemCount: categlists.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  final item = categlists[index];
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      badges.Badge(
                        position: badges.BadgePosition.topEnd(top: -1, end: -2),

                        badgeStyle: badges.BadgeStyle(
                          shape: badges.BadgeShape.square,
                          badgeColor: ColorName.royalBlue,
                          padding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 6,
                          ),
                          elevation: 0,
                        ),
                        badgeContent: Text(
                          "${item.bannerCount}",
                          style: context.poppin.label.medium.withColor(
                            Colors.white,
                          ),
                        ),
                        showBadge: item.label == "BUSCAR"
                            ? false
                            : item.label == currentSelected
                            ? true
                            : false,
                        child: ItemBlocks(
                          tooltip: item.label ?? "",
                          onPressed: () {
                            onPress?.call(item);
                          },
                          childBuilder: (size) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              item.svg!.svg(
                                height: size,
                                colorFilter: ColorFilter.mode(
                                  currentSelected == item.label
                                      ? ColorName.royalBlue
                                      : ColorName.royalGray.withValues(
                                          alpha: 0.5,
                                        ),
                                  BlendMode.srcIn,
                                ),
                              ),
                              2.spMin.verticalSpace,
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: currentSelected != item.label
                                        ? BorderSide.none
                                        : BorderSide(
                                            color: ColorName.royalBlue,
                                            width: 1.0,
                                          ),
                                  ),
                                ),
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: Text(
                                  "${item.label}",
                                  style: context.poppin.label.semiBold
                                      .withColor(
                                        currentSelected == item.label
                                            ? ColorName.royalBlue
                                            : ColorName.royalGray.withValues(
                                                alpha: 0.5,
                                              ),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      item.label == "BUSCAR"
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: VerticalDivider(
                                thickness: 2,
                                color: ColorName.royalGray.withValues(
                                  alpha: 0.2,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemBlocks extends StatelessWidget {
  final String tooltip;
  final VoidCallback onPressed;
  final Widget Function(double size) childBuilder;

  const ItemBlocks({
    super.key,
    required this.tooltip,
    required this.onPressed,
    required this.childBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final iconVisualSize = 22.spMin;
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: Semantics(
        button: true,
        label: tooltip,
        enabled: true,
        child: IconButton(
          tooltip: tooltip,
          onPressed: onPressed,
          splashRadius: 24,
          constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          icon: childBuilder(iconVisualSize),
        ),
      ),
    );
  }
}
