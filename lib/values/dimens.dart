import 'package:flutter/material.dart';

abstract class AppPaddings {
  /// Paddings for all offsets

  static const EdgeInsets allPaddingXXL = EdgeInsets.all(AppSizes.sizeXXL);
  static const EdgeInsets allPaddingXL = EdgeInsets.all(AppSizes.sizeXL);
  static const EdgeInsets allPaddingL = EdgeInsets.all(AppSizes.sizeL);
  static const EdgeInsets allPaddingM = EdgeInsets.all(AppSizes.sizeM);
  static const EdgeInsets allPaddingSSM = EdgeInsets.all(AppSizes.sizeSSM);
  static const EdgeInsets allPaddingS = EdgeInsets.all(AppSizes.sizeS);
  static const EdgeInsets allPaddingXS = EdgeInsets.all(AppSizes.sizeXS);
}

abstract class AppBordersRadius {
  ///Circular radii variations

  static const Radius radiusCircular100 = Radius.circular(100);

  /// Variations of border radius where all radii are radius

  static const BorderRadius borderRadiusAll100 =
      BorderRadius.all(radiusCircular100);
}

abstract class AppSizes {
  static const double sizeXS = 4;
  static const double sizeS = 8;
  static const double sizeSSM = 10;
  static const double sizeM = 16;
  static const double sizeL = 24;
  static const double sizeXL = 32;
  static const double sizeXXL = 48;

  static const double size128 = 128;
  static const double size512 = 512;
}
