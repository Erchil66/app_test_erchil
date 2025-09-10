import 'package:apptest/gen/colors.gen.dart';
import 'package:apptest/router/router.dart';
import 'package:apptest/src/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final themeMode = StateProvider<ThemeMode>((x) => ThemeMode.light);

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    initializeVoidNative();
    super.initState();
  }

  void initializeVoidNative() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final route = ref.watch(goRouter);
    final theme = ref.watch(themeMode);
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (_, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaler.clamp(
          minScaleFactor: 1.0,
          maxScaleFactor: 1.3,
        );
        return MaterialApp.router(
          themeMode: theme,
          theme: buildTheme(
            primary: ColorName.royalBlue,
            brightness: Brightness.light,
            googleFont: GoogleFonts.poppinsTextTheme,
          ),

          darkTheme: buildTheme(
            primary: ColorName.royalBlue,
            brightness: Brightness.dark,
            googleFont: GoogleFonts.poppinsTextTheme,
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: route,
          builder: (context, child) => MediaQuery(
            data: mediaQueryData.copyWith(textScaler: scale),
            child: child!,
          ),
          supportedLocales: const [
            Locale('en', ''),
            Locale('es', ''),
            Locale('fr', ''),
            Locale('ru', ''),
            Locale('ph', ''),
            Locale('au', ''),
          ],
        );
      },
    );
  }
}
