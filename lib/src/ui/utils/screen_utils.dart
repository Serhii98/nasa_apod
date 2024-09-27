import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

double getStatusBarHeight(final BuildContext context) {
  return View.of(context).padding.top / View.of(context).devicePixelRatio;
}

double getBottomBarHeight(final BuildContext context) {
  return View.of(context).padding.bottom / View.of(context).devicePixelRatio;
}

double getAppHeight(final BuildContext context) {
  return MediaQuery.of(context).size.height -
      getStatusBarHeight(context) -
      getBottomBarHeight(context);
}

bool isDesktopSize(final BuildContext context) {
  return getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.desktop;
}

bool isTabletSize(final BuildContext context) {
  return getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.tablet;
}

bool isMobileSize(final BuildContext context) {
  return getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;
}
