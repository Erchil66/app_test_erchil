import 'package:apptest/gen/assets.gen.dart';
import 'package:apptest/gen/colors.gen.dart';
import 'package:apptest/src/constant/widget/category/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appbartest extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? callback;
  const Appbartest({super.key, this.callback});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          children: [
            ItemBlocks(
              tooltip: "Drawer",
              onPressed: () {
                callback?.call();
              },
              childBuilder: (build) => Assets.svg.barsSort.svg(
                height: 20.spMin,
                colorFilter: ColorFilter.mode(
                  ColorName.royalBlue,
                  BlendMode.srcIn,
                ),
              ),
            ),

            Assets.svg.logoName.svg(
              height: 15.spMin,
              colorFilter: ColorFilter.mode(
                ColorName.royalBlue,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120.spMin);
}
