import 'package:apptest/router/route_name.dart';
import 'package:apptest/src/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final parentKey = GlobalKey<NavigatorState>(debugLabel: "root");
/*
 * Optional to have shellkey unless you are doing persistent pages. 
 */
final shellKey = GlobalKey<NavigatorState>(debugLabel: "shell");

final goRouter = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: parentKey,
    routes: [
      GoRoute(
        name: RouteName.home,
        path: RouteName.home,
        pageBuilder: (context, state) =>
            buildPage(contextm: context, state: state, child: const HomePage()),
      ),
    ],
  );
});

CustomTransitionPage buildPage({
  BuildContext? contextm,
  GoRouterState? state,
  Widget? child,
  UniqueKey? key,
}) {
  return CustomTransitionPage(
    opaque: false,
    key: state!.pageKey,
    child: child!,
    maintainState: false,
    transitionsBuilder: (context, animation, secondary, child) {
      return SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1.8, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeIn)),
        ),
        child: child,
      );
    },
  );
}
