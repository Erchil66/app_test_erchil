// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/logo_app.png
  AssetGenImage get logoApp => const AssetGenImage('assets/png/logo_app.png');

  /// File path: assets/png/logo_name.png
  AssetGenImage get logoName => const AssetGenImage('assets/png/logo_name.png');

  /// File path: assets/png/pexels-aidan-howe-2427444-4677404.jpg
  AssetGenImage get pexelsAidanHowe24274444677404 =>
      const AssetGenImage('assets/png/pexels-aidan-howe-2427444-4677404.jpg');

  /// File path: assets/png/pexels-photospublic-444964.jpg
  AssetGenImage get pexelsPhotospublic444964 =>
      const AssetGenImage('assets/png/pexels-photospublic-444964.jpg');

  /// File path: assets/png/pexels-pixabay-269630.jpg
  AssetGenImage get pexelsPixabay269630 =>
      const AssetGenImage('assets/png/pexels-pixabay-269630.jpg');

  /// File path: assets/png/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/png/splash.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    logoApp,
    logoName,
    pexelsAidanHowe24274444677404,
    pexelsPhotospublic444964,
    pexelsPixabay269630,
    splash,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/LOGO NAME.svg
  SvgGenImage get logoName => const SvgGenImage('assets/svg/LOGO NAME.svg');

  /// File path: assets/svg/animated-icon.svg
  SvgGenImage get animatedIcon =>
      const SvgGenImage('assets/svg/animated-icon.svg');

  /// File path: assets/svg/bars-sort.svg
  SvgGenImage get barsSort => const SvgGenImage('assets/svg/bars-sort.svg');

  /// File path: assets/svg/cards-blank.svg
  SvgGenImage get cardsBlank => const SvgGenImage('assets/svg/cards-blank.svg');

  /// File path: assets/svg/clock.svg
  SvgGenImage get clock => const SvgGenImage('assets/svg/clock.svg');

  /// File path: assets/svg/compress-alt.svg
  SvgGenImage get compressAlt =>
      const SvgGenImage('assets/svg/compress-alt.svg');

  /// File path: assets/svg/customer-service.svg
  SvgGenImage get customerService =>
      const SvgGenImage('assets/svg/customer-service.svg');

  /// File path: assets/svg/expand-arrows.svg
  SvgGenImage get expandArrows =>
      const SvgGenImage('assets/svg/expand-arrows.svg');

  /// File path: assets/svg/filter.svg
  SvgGenImage get filter => const SvgGenImage('assets/svg/filter.svg');

  /// File path: assets/svg/fire-flame-curved.svg
  SvgGenImage get fireFlameCurved =>
      const SvgGenImage('assets/svg/fire-flame-curved.svg');

  /// File path: assets/svg/football.svg
  SvgGenImage get football => const SvgGenImage('assets/svg/football.svg');

  /// File path: assets/svg/house-window.svg
  SvgGenImage get houseWindow =>
      const SvgGenImage('assets/svg/house-window.svg');

  /// File path: assets/svg/lucky-cat.svg
  SvgGenImage get luckyCat => const SvgGenImage('assets/svg/lucky-cat.svg');

  /// File path: assets/svg/money-wings.svg
  SvgGenImage get moneyWings => const SvgGenImage('assets/svg/money-wings.svg');

  /// File path: assets/svg/moon.svg
  SvgGenImage get moon => const SvgGenImage('assets/svg/moon.svg');

  /// File path: assets/svg/new-product.svg
  SvgGenImage get newProduct => const SvgGenImage('assets/svg/new-product.svg');

  /// File path: assets/svg/paw.svg
  SvgGenImage get paw => const SvgGenImage('assets/svg/paw.svg');

  /// File path: assets/svg/poker-chip.svg
  SvgGenImage get pokerChip => const SvgGenImage('assets/svg/poker-chip.svg');

  /// File path: assets/svg/puzzle-alt.svg
  SvgGenImage get puzzleAlt => const SvgGenImage('assets/svg/puzzle-alt.svg');

  /// File path: assets/svg/rocket-lunch.svg
  SvgGenImage get rocketLunch =>
      const SvgGenImage('assets/svg/rocket-lunch.svg');

  /// File path: assets/svg/search.svg
  SvgGenImage get search => const SvgGenImage('assets/svg/search.svg');

  /// File path: assets/svg/slot-machine.svg
  SvgGenImage get slotMachine =>
      const SvgGenImage('assets/svg/slot-machine.svg');

  /// File path: assets/svg/star.svg
  SvgGenImage get star => const SvgGenImage('assets/svg/star.svg');

  /// File path: assets/svg/sun.svg
  SvgGenImage get sun => const SvgGenImage('assets/svg/sun.svg');

  /// File path: assets/svg/tasks.svg
  SvgGenImage get tasks => const SvgGenImage('assets/svg/tasks.svg');

  /// File path: assets/svg/webinar-play.svg
  SvgGenImage get webinarPlay =>
      const SvgGenImage('assets/svg/webinar-play.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    logoName,
    animatedIcon,
    barsSort,
    cardsBlank,
    clock,
    compressAlt,
    customerService,
    expandArrows,
    filter,
    fireFlameCurved,
    football,
    houseWindow,
    luckyCat,
    moneyWings,
    moon,
    newProduct,
    paw,
    pokerChip,
    puzzleAlt,
    rocketLunch,
    search,
    slotMachine,
    star,
    sun,
    tasks,
    webinarPlay,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
