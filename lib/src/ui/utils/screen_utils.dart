import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

bool isDesktopSize(final BuildContext context) {
  return getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.desktop;
}
