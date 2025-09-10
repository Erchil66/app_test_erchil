import 'dart:math';

import 'package:apptest/gen/assets.gen.dart';

class CategoryList {
  final SvgGenImage? svg;
  final String? label;
  final int? bannerCount;

  CategoryList({this.svg, this.label, this.bannerCount});
}

final categlists = <CategoryList>[
  CategoryList(svg: Assets.svg.search, label: "BUSCAR", bannerCount: 0),
  CategoryList(
    svg: Assets.svg.houseWindow,
    label: "INCIO",
    bannerCount: Random().nextInt(200),
  ),

  CategoryList(
    svg: Assets.svg.fireFlameCurved,
    label: "POPULAR",
    bannerCount: Random().nextInt(200),
  ),
  CategoryList(
    svg: Assets.svg.luckyCat,
    label: "JACKPOT",
    bannerCount: Random().nextInt(200),
  ),
  CategoryList(
    svg: Assets.svg.newProduct,
    label: "NUEVO",
    bannerCount: Random().nextInt(200),
  ),
  CategoryList(
    svg: Assets.svg.puzzleAlt,
    label: "CASUAL",
    bannerCount: Random().nextInt(200),
  ),
  CategoryList(
    svg: Assets.svg.rocketLunch,
    label: "CRASH",
    bannerCount: Random().nextInt(200),
  ),
  CategoryList(
    svg: Assets.svg.animatedIcon,
    label: "PRAGMATIC",
    bannerCount: Random().nextInt(200),
  ),
  CategoryList(
    svg: Assets.svg.paw,
    label: "FAT PANDA",
    bannerCount: Random().nextInt(200),
  ),
  CategoryList(
    svg: Assets.svg.webinarPlay,
    label: "PLAYTECH",
    bannerCount: Random().nextInt(200),
  ),
  CategoryList(
    svg: Assets.svg.slotMachine,
    label: "SLOTS",
    bannerCount: Random().nextInt(200),
  ),
  CategoryList(
    svg: Assets.svg.tasks,
    label: "BINGO",
    bannerCount: Random().nextInt(200),
  ),
  CategoryList(
    svg: Assets.svg.customerService,
    label: "EN VIVO",
    bannerCount: Random().nextInt(200),
  ),
  CategoryList(
    svg: Assets.svg.cardsBlank,
    label: "CARTAS",
    bannerCount: Random().nextInt(200),
  ),
  CategoryList(
    svg: Assets.svg.moneyWings,
    label: "OTROS",
    bannerCount: Random().nextInt(200),
  ),
];
