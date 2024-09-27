import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/src/routing/route_paths.dart';
import 'package:nasa_apod/src/routing/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Route,Page|Screen")
class AppRouter extends $AppRouter {
  factory AppRouter() {
    return _appRouter;
  }

  AppRouter._internal();

  static final AppRouter _appRouter = AppRouter._internal();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: SplashScreen.page,
          path: RoutePaths.splashPagePath,
          initial: true,
        ),
        AutoRoute(
          page: HomeScreen.page,
          path: RoutePaths.homePagePath,
        ),
        CustomRoute(
          page: ApodDetailsScreen.page,
          path: RoutePaths.apodDetailsPagePath,
          durationInMilliseconds: 350,
        ),
      ];

  Future<void> popAllAndPush<T extends Object?>(
    final PageRouteInfo pageRouteInfo, {
    final OnNavigationFailure? onFailure,
  }) async {
    await replaceAll(
      <PageRouteInfo>[pageRouteInfo],
      updateExistingRoutes: false,
    );
  }

  Future<T?> popAndNavigate<T extends Object?>(
    final PageRouteInfo pageRouteInfo, {
    final OnNavigationFailure? onFailure,
  }) async {
    await maybePop();
    return navigate(
      pageRouteInfo,
      onFailure: onFailure,
    ) as T?;
  }

  void checkCanRouterMoveBack<T extends Object?>({
    required final PageRouteInfo<dynamic> route,
    final T? possibleResult,
  }) {
    /// Here we check if our router can moving back to previous screen,
    /// on this case it's more for WEB because user can refresh browser,
    /// and router cannot navigate back because router stack is empty,
    /// so we push route what we need to routes stack.
    if (_appRouter.canPop()) {
      _appRouter.maybePop(possibleResult);
    } else {
      _appRouter.navigate(route);
    }
  }

  bool containsInStack(final String name) {
    return stackData.any((final RouteData element) => element.name == name);
  }
}

final class InfoRoutesObserver extends AutoRouterObserver {
  @override
  void didPush(final Route route, final Route? previousRoute) {
    debugPrint(
      '[ROUTE INFO MANAGER] Current path: ${AppRouter().current.parent?.router.currentPath}',
    );
    debugPrint('[ROUTE INFO MANAGER] New route pushed: ${route.settings.name}');
    debugPrint(
      '[ROUTE INFO MANAGER] Previous route: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didInitTabRoute(
    final TabPageRoute route,
    final TabPageRoute? previousRoute,
  ) {
    debugPrint(
      '[ROUTE INFO MANAGER] Current path: ${AppRouter().current.parent?.router.currentPath}',
    );
    debugPrint('[ROUTE INFO MANAGER] Tab route visited:  ${route.name}');
    debugPrint(
      '[ROUTE INFO MANAGER] Previous tab route: ${previousRoute?.name}',
    );
  }

  @override
  void didChangeTabRoute(
    final TabPageRoute route,
    final TabPageRoute previousRoute,
  ) {
    debugPrint(
      '[ROUTE INFO MANAGER] Current path: ${AppRouter().current.parent?.router.currentPath}',
    );
    debugPrint('[ROUTE INFO MANAGER] Tab route re-visited: ${route.name}');
    debugPrint(
      '[ROUTE INFO MANAGER] Previous tab route: ${previousRoute.name}',
    );
  }

  @override
  void didPop(final Route? route, final Route? previousRoute) {
    debugPrint(
      '[ROUTE INFO MANAGER] Current path: ${AppRouter().current.parent?.router.currentPath}',
    );
    debugPrint('[ROUTE INFO MANAGER] Route is pop: ${route?.settings.name}');
    debugPrint(
      '[ROUTE INFO MANAGER] Previous route: ${previousRoute?.settings.name}',
    );
  }
}

extension PathExtensions on String {
  String replaceSlash() => replaceFirst("/", AppStrings.emptyString);
}
