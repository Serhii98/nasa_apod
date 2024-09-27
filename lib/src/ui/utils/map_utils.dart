import 'package:flutter/material.dart';

abstract class MapUtils {
  static ImageConfiguration getMarkerConfiguration(final BuildContext context) {
    return createLocalImageConfiguration(
      context,
      size: const Size(
        80,
        80,
      ),
    );
  }

  // static Future<BitmapDescriptor> getCustomMarker(
  //     ImageConfiguration imageConfiguration) {
  //   return BitmapDescriptor.fromAssetImage(
  //     imageConfiguration,
  //     Images.icMarkerSelected,
  //   );
  // }
}
