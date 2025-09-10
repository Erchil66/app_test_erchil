import 'package:apptest/gen/assets.gen.dart';
import 'package:apptest/gen/colors.gen.dart';
import 'package:apptest/src/constant/theme.dart';
import 'package:flutter/material.dart';

class ViewCards extends StatelessWidget {
  final double? h, w;
  const ViewCards({super.key, this.h, this.w});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final height = h ?? constraints.maxHeight;
        final width = w ?? constraints.maxWidth;
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: height,
            width: width,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Assets.png.pexelsPhotospublic444964.image(
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: height * 0.7,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, ColorName.royalBlue],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.1, 0.9],
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: _CardTexts(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CardTexts extends StatelessWidget {
  const _CardTexts();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Text(
          "LOREM IPSUM",
          style: context.poppin.display.bold.withColor(Colors.white),
        ),
        Text(
          "Lorem Ipsum",
          style: context.poppin.label.medium.withColor(Colors.white),
        ),
      ],
    );
  }
}
