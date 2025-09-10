import 'package:apptest/src/constant/widget/appbar/appbar.dart';
import 'package:apptest/src/constant/widget/bottom_bar/bottom_bar.dart';
import 'package:apptest/src/constant/widget/card_games/sliver_grid.dart';
import 'package:apptest/src/constant/widget/carousel/carousel.dart';
import 'package:apptest/src/constant/widget/category/category.dart';
import 'package:apptest/src/constant/widget/drawer/drawer.dart';
import 'package:apptest/src/constant/widget/field/search_field.dart';
import 'package:apptest/src/models/bottom_bar_list.dart';
import 'package:apptest/src/models/category_list.dart';
import 'package:apptest/src/models/slider_banner.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categorySelected = StateProvider<CategoryList>((ref) => categlists.first);
final currentBottomSelected = StateProvider<BottomBarList>(
  (ref) => bottomList.last,
);

final isCollapse = StateProvider((x) => false);

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final category = ref.watch(categorySelected);
    final selectedBottom = ref.watch(currentBottomSelected);
    final collapse = ref.watch(isCollapse);
    return Scaffold(
      key: _scaffoldKey,
      appBar: Appbartest(
        isCollapse: collapse,
        callback: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      drawer: DrawerView(),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CustomScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                slivers: [
                  // Carousel's
                  SliverToBoxAdapter(
                    child: CarouselSlides(sliderBannerList: sliderBannerList1),
                  ),
                  // Category's
                  SliverAppBar(
                    pinned: true,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    surfaceTintColor: Colors.transparent,
                    primary: true,
                    centerTitle: true,
                    titleSpacing: 0,
                    title: Center(
                      child: CategoryListView(
                        currentSelected: category.label,
                        onPress: (selected) {
                          ref
                              .read(categorySelected.notifier)
                              .update((x) => x = selected!);
                        },
                      ),
                    ),

                    // Show Search if Selected
                  ),
                  SliverToBoxAdapter(
                    child: category.label != "BUSCAR"
                        ? const SizedBox.shrink()
                        : FeildSearch(),
                  ),
                  // ITEMS
                  CategoryGridSliver(
                    label: category.label ?? "",
                    bannerCount: category.bannerCount,
                    maxTileExtent: 150,
                    spacing: 15,
                    childAspectRatio: 1,
                    padding: EdgeInsets.only(
                      bottom: 130,
                      left: 20,
                      right: 20,
                      top: 10,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomBar(
                onPress: (selected) {
                  ref
                      .read(currentBottomSelected.notifier)
                      .update((x) => x = selected!);
                },
                currentSelected: selectedBottom,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
