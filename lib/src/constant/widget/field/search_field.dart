import 'package:apptest/gen/assets.gen.dart';
import 'package:apptest/gen/colors.gen.dart';
import 'package:apptest/src/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeildSearch extends StatelessWidget {
  const FeildSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                style: context.poppin.body.medium,
                cursorColor: ColorName.royalBlue,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(6),
                  isCollapsed: true,
                  isDense: true,
                  prefixIcon: Center(
                    child: Assets.svg.search.svg(
                      height: 15.spMin,
                      colorFilter: ColorFilter.mode(
                        ColorName.royalBlue,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 20.spMin,
                    maxWidth: 40.spMin,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: ColorName.royalGray.withValues(alpha: 0.2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: ColorName.royalBlue),
                  ),
                ),
              ),
            ),
          ),
          5.spMin.horizontalSpace,
          SizedBox(
            height: 30.spMin,
            width: 30.spMin,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                backgroundColor: ColorName.royalBlue,
              ),
              onPressed: () {},
              child: Center(
                child: Assets.svg.filter.svg(
                  height: 18.spMin,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
