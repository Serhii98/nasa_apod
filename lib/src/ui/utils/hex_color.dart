import 'dart:ui';

import 'package:nasa_apod/constants/app_strings.dart';

/// Class to convert color in hex string format to default [Color]
final class HexColor extends Color {
  /// Constructor of [HexColor]
  HexColor(final String hexColor)
      : super(
          _getColorFromHex(
            hexColor,
          ),
        );

  static int _getColorFromHex(
    final String hexColor,
  ) {
    String hexColorResult =
        hexColor.toUpperCase().replaceAll("#", AppStrings.emptyString);

    if (hexColor.length == 6) {
      hexColorResult = "FF$hexColorResult";
    }

    return int.parse(hexColorResult, radix: 16);
  }
}
