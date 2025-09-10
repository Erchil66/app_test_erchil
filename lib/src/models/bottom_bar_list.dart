import 'package:apptest/gen/assets.gen.dart';

class BottomBarList {
  final SvgGenImage? svgicon;
  final String? label;

  BottomBarList({this.svgicon, this.label});
}

final bottomList = <BottomBarList>[
  BottomBarList(svgicon: Assets.svg.football, label: "DEPORTES"),
  BottomBarList(svgicon: Assets.svg.star, label: "FAVORITES"),
  BottomBarList(svgicon: Assets.svg.clock, label: "JUGAR"),
  BottomBarList(svgicon: Assets.svg.pokerChip, label: "CASINO"),
];
