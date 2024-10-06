import 'dart:async';
import 'dart:io';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:nasa_apod/src/core_app/core_app.dart';
import 'package:nasa_apod/src/data/managers/logger/log_manager.dart';
import 'package:nasa_apod/src/di/global_binding.dart';
import 'package:nasa_apod/src/utils/elvis.dart';

bool appIsRunning = false;

/// Setup data if mobile app
Future<bool> _setupApp() async {
  FlutterError.onError = (final FlutterErrorDetails details) {
    LogManager().log(details.exception, details.stack);
  };
  if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
    GlobalBinding.setup();
    return true;
  }
  return false;
}

Future<void> _getAppRunner() async {
  usePathUrlStrategy();
  Bloc.transformer = sequential();
  runApp(const CoreApp());
  if (kIsWeb.not()) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[
        DeviceOrientation.portraitUp,
      ],
    );
  }
}

Future<void> _init() async {
  Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    if ((await _setupApp()).not()) {
      // if web, not mobile app
      GlobalBinding.setup();
    }
    await _getAppRunner();
  }

  await runZonedGuarded<Future<void>>(run,
      (final Object error, final StackTrace stackTrace) async {
    LogManager().log(error, stackTrace);
  });
}

Future<void> bootstrap() async {
  appIsRunning = true;
  await _init();
}
