import 'dart:math';

import 'package:apptest/gen/assets.gen.dart';
import 'package:apptest/gen/colors.gen.dart';
import 'package:apptest/src/constant/theme.dart';
import 'package:apptest/src/models/slider_banner.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSlides extends StatefulWidget {
  final List<SliderBanner> sliderBannerList;

  const CarouselSlides({super.key, required this.sliderBannerList});

  @override
  State<CarouselSlides> createState() => _CarouselSlidesState();
}

class _CarouselSlidesState extends State<CarouselSlides> {
  final listLogos = List.generate(20, (index) => index + 1).toList();
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  bool _precached = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_precached) return; // run once
    for (final u in widget.sliderBannerList) {
      final url = u.image;
      if (url == null || url.isEmpty) continue;
      precacheImage(CachedNetworkImageProvider(url), context);
    }
    _precached = true;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = 200.spMin;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: widget.sliderBannerList.length,
              itemBuilder: (context, index, realIndex) {
                final card = widget.sliderBannerList[index];
                return RepaintBoundary(
                  key: ValueKey(card.id),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    child: Image(
                      image: CachedNetworkImageProvider(card.image!),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.low,
                      height: height,
                      width: width,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 200.spMin,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(milliseconds: 200),
                autoPlayCurve: Curves.linearToEaseOut,
                enlargeCenterPage: false,
                onPageChanged: (index, page) {},
                scrollDirection: Axis.horizontal,
              ),
            ),
            10.spMin.verticalSpace,
            Row(
              children: [
                Text(
                  "Proveedores de juego",
                  style: context.poppin.label.semiBold.withColor(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Spacer(),

                SizedBox(
                  height: 40.spMin,
                  width: 40.spMin,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      backgroundColor: ColorName.royalGray.withValues(
                        alpha: 0.2,
                      ),
                    ),
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        "MÁS",
                        style: context.poppin.label.medium.withColor(
                          Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
                10.spMin.horizontalSpace,
                SizedBox(
                  height: 40.spMin,
                  width: 40.spMin,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      backgroundColor: ColorName.royalGray.withValues(
                        alpha: 0.2,
                      ),
                    ),
                    onPressed: () {
                      buttonCarouselController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },

                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 25.spMin,
                      ),
                    ),
                  ),
                ),
                10.spMin.horizontalSpace,
                SizedBox(
                  height: 40.spMin,
                  width: 40.spMin,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      backgroundColor: ColorName.royalGray.withValues(
                        alpha: 0.2,
                      ),
                    ),
                    onPressed: () {
                      buttonCarouselController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 25.spMin,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.spMin.verticalSpace,

            LayoutBuilder(
              builder: (context, constraints) {
                final w = constraints.maxWidth;
                final isPortrait =
                    MediaQuery.of(context).orientation == Orientation.portrait;

                final count = isPortrait ? 3 : 5;
                const spacing = 12.0;
                final itemWidth = (w - spacing * (count - 1)) / count;
                final viewportFraction = (itemWidth + spacing) / w;

                return CarouselSlider.builder(
                  carouselController: buttonCarouselController,
                  itemCount: listLogos.length,
                  options: CarouselOptions(
                    height: 120, // or 120.spMin if you prefer
                    viewportFraction: viewportFraction.clamp(0.0, 1.0),
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 500,
                    ),
                    autoPlayCurve: Curves.linearToEaseOut,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: spacing / 2,
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: ColorName.royalGray.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SizedBox.expand(
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  child: Assets.png.pexelsPixabay269630.image(
                                    // width: 90.spMin,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 45.spMin,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: ColorName.royalGray.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Lorem Ipsum",
                                      style: context.poppin.label.medium
                                          .withColor(
                                            Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                          ),
                                    ),
                                    Text(
                                      "${Random().nextInt(1000)} Juegos",
                                      style: context.poppin.label.medium
                                          .withColor(
                                            ColorName.royalGray.withValues(
                                              alpha: 0.4,
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
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
