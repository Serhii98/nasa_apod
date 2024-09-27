import 'package:flutter/material.dart';

abstract class AppPaddings {
  /// Paddings for all offsets

  static const EdgeInsets allPaddingXXL = EdgeInsets.all(AppSizes.sizeXXL);
  static const EdgeInsets allPaddingXL = EdgeInsets.all(AppSizes.sizeXL);
  static const EdgeInsets allPaddingL = EdgeInsets.all(AppSizes.sizeL);
  static const EdgeInsets allPaddingM = EdgeInsets.all(AppSizes.sizeM);
  static const EdgeInsets allPaddingSM = EdgeInsets.all(AppSizes.size12);
  static const EdgeInsets allPaddingSSM = EdgeInsets.all(AppSizes.sizeSSM);
  static const EdgeInsets allPaddingS = EdgeInsets.all(AppSizes.sizeS);
  static const EdgeInsets allPaddingVL = EdgeInsets.all(AppSizes.size6);
  static const EdgeInsets allPaddingXS = EdgeInsets.all(AppSizes.sizeXS);

  static const EdgeInsets allPadding20 = EdgeInsets.all(AppSizes.size20);
  static const EdgeInsets allPadding30 = EdgeInsets.all(AppSizes.size30);
}

abstract class AppBordersRadius {
  ///Circular radii variations

  static const Radius radiusCircularXS = Radius.circular(4);
  static const Radius radiusCircularVL = Radius.circular(6);
  static const Radius radiusCircularS = Radius.circular(8);
  static const Radius radiusCircularSSM = Radius.circular(10);
  static const Radius radiusCircularSM = Radius.circular(12);
  static const Radius radiusCircularM = Radius.circular(16);
  static const Radius radiusCircular20 = Radius.circular(20);
  static const Radius radiusCircularL = Radius.circular(24);
  static const Radius radiusCircular30 = Radius.circular(30);
  static const Radius radiusCircular36 = Radius.circular(36);
  static const Radius radiusCircular50 = Radius.circular(50);
  static const Radius radiusCircular100 = Radius.circular(100);
  static const Radius radiusCircular150 = Radius.circular(150);

  /// Variations of border radius where all radii are radius

  static const BorderRadius borderRadiusAllXS =
      BorderRadius.all(radiusCircularXS);
  static const BorderRadius borderRadiusAllVL =
      BorderRadius.all(radiusCircularVL);
  static const BorderRadius borderRadiusAllS =
      BorderRadius.all(radiusCircularS);
  static const BorderRadius borderRadiusAllSSM =
      BorderRadius.all(radiusCircularSSM);
  static const BorderRadius borderRadiusAllSM =
      BorderRadius.all(radiusCircularSM);
  static const BorderRadius borderRadiusAll20 =
      BorderRadius.all(radiusCircular20);
  static const BorderRadius borderRadiusAllM =
      BorderRadius.all(radiusCircularM);
  static const BorderRadius borderRadiusAllL =
      BorderRadius.all(radiusCircularL);
  static const BorderRadius borderRadiusAll30 =
      BorderRadius.all(radiusCircular30);
  static const BorderRadius borderRadiusAll36 =
      BorderRadius.all(radiusCircular36);

  static const BorderRadius borderRadiusAll50 =
      BorderRadius.all(radiusCircular50);
  static const BorderRadius borderRadiusAll100 =
      BorderRadius.all(radiusCircular100);
  static const BorderRadius borderRadiusAll150 =
      BorderRadius.all(radiusCircular150);
}

abstract class AppSizes {
  static const double sizeZero = 0;
  static const double size2 = 2;
  static const double sizeXS = 4;
  static const double size6 = 6;
  static const double sizeS = 8;
  static const double sizeSSM = 10;
  static const double size12 = 12;
  static const double sizeM = 16;
  static const double size20 = 20;
  static const double sizeL = 24;
  static const double size30 = 30;
  static const double sizeXL = 32;
  static const double size40 = 40;
  static const double sizeXXL = 48;

  static const double size70 = 70;
  static const double size128 = 128;
  static const double size512 = 512;

  ///other
  static const double buttonSize = 46;
  static const double borderWidth = 1;

  // default
  static const double defaultContentMargin = AppSizes.sizeM;
}
