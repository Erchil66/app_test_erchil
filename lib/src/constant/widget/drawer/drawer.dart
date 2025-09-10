import 'package:apptest/app.dart';
import 'package:apptest/gen/assets.gen.dart';
import 'package:apptest/gen/colors.gen.dart';
import 'package:apptest/src/constant/theme.dart';
import 'package:apptest/src/constant/widget/category/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerView extends ConsumerWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeMode);
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BIENVENIDO!", style: context.poppin.headline.medium),
                30.spMin.verticalSpace,
                ExpansionTile(
                  title: Text("Lorem Ipsum", style: context.poppin.body.medium),
                  children: [
                    ListTile(
                      title: Text(
                        "Name: APP TEST",
                        style: context.poppin.display.medium,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Email: a.chil6663@gmail.com",
                        style: context.poppin.display.medium,
                      ),
                    ),
                  ],
                ),
                40.spMin.verticalSpace,
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: ColorName.royalGray.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(900),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ItemBlocks(
                            tooltip: "Dark Mode",
                            onPressed: () {
                              ref
                                  .read(themeMode.notifier)
                                  .update((x) => x = ThemeMode.dark);
                            },
                            childBuilder: (childBuilder) => Row(
                              children: [
                                Assets.svg.moon.svg(
                                  height: 20.spMin,
                                  colorFilter: ColorFilter.mode(
                                    theme == ThemeMode.dark
                                        ? ColorName.royalBlue
                                        : ColorName.royalGray,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                5.spMin.horizontalSpace,
                                Text(
                                  "Oscuro",
                                  style: context.poppin.display.medium
                                      .withColor(
                                        theme == ThemeMode.dark
                                            ? ColorName.royalBlue
                                            : ColorName.royalGray,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          ItemBlocks(
                            tooltip: "Light Mode",
                            onPressed: () {
                              ref
                                  .read(themeMode.notifier)
                                  .update((x) => x = ThemeMode.light);
                            },
                            childBuilder: (childBuilder) => Row(
                              children: [
                                Assets.svg.sun.svg(
                                  height: 20.spMin,
                                  colorFilter: ColorFilter.mode(
                                    theme != ThemeMode.dark
                                        ? ColorName.royalBlue
                                        : ColorName.royalGray,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                5.spMin.horizontalSpace,
                                Text(
                                  "Luz",
                                  style: context.poppin.display.medium
                                      .withColor(
                                        theme != ThemeMode.dark
                                            ? ColorName.royalBlue
                                            : ColorName.royalGray,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
