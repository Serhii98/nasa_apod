// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:nasa_apod/src/ui/apod_details/apod_details_screen.dart' as _i1;
import 'package:nasa_apod/src/ui/home/home_screen.dart' as _i2;
import 'package:nasa_apod/src/ui/splash/splash_screen.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ApodDetailsScreen.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<ApodDetailsScreenArgs>(
          orElse: () => ApodDetailsScreenArgs(
                  initDtoEncoded: queryParams.getString(
                'ja',
                '',
              )));
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ApodDetailsScreen(
          key: args.key,
          initDtoEncoded: args.initDtoEncoded,
        ),
      );
    },
    HomeScreen.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ApodDetailsScreen]
class ApodDetailsScreen extends _i4.PageRouteInfo<ApodDetailsScreenArgs> {
  ApodDetailsScreen({
    _i5.Key? key,
    String initDtoEncoded = '',
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ApodDetailsScreen.name,
          args: ApodDetailsScreenArgs(
            key: key,
            initDtoEncoded: initDtoEncoded,
          ),
          rawQueryParams: {'ja': initDtoEncoded},
          initialChildren: children,
        );

  static const String name = 'ApodDetailsScreen';

  static const _i4.PageInfo<ApodDetailsScreenArgs> page =
      _i4.PageInfo<ApodDetailsScreenArgs>(name);
}

class ApodDetailsScreenArgs {
  const ApodDetailsScreenArgs({
    this.key,
    this.initDtoEncoded = '',
  });

  final _i5.Key? key;

  final String initDtoEncoded;

  @override
  String toString() {
    return 'ApodDetailsScreenArgs{key: $key, initDtoEncoded: $initDtoEncoded}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i4.PageRouteInfo<void> {
  const HomeScreen({List<_i4.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashScreen]
class SplashScreen extends _i4.PageRouteInfo<void> {
  const SplashScreen({List<_i4.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
