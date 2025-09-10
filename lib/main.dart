import 'dart:async';

import 'package:apptest/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

FutureOr<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsBinding widgetsFlutterBinding =
          WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);
      ErrorWidget.builder = (FlutterErrorDetails details) {
        return const SizedBox.shrink();
      };

      runApp(const ProviderScope(child: App()));
    },
    (error, stack) {
      ///
    },
  );
}
