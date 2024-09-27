import 'dart:convert';

import 'package:nasa_apod/constants/app_strings.dart';

/// Manager to pass arguments to routes as encoded query parameters.
/// This approach is used not to loose the data when make browser refresh
final class RouterArgsManager {
  factory RouterArgsManager() {
    _instance ??= RouterArgsManager._internal();
    return _instance!;
  }

  RouterArgsManager._internal();

  static RouterArgsManager? _instance;

  String getEncodedValue(final Map<String, dynamic> json) {
    return base64Encode(
      utf8.encode(
        jsonEncode(
          json,
        ),
      ),
    );
  }

  Map<String, dynamic> getDecodedValue(final String data) {
    return jsonDecode(
      utf8.decode(
        base64Decode(
          data.replaceAll(
            // browser replaces plus sign as space on refresh
            AppStrings.emptyStringSpace,
            AppStrings.plus,
          ),
        ),
      ),
    ) as Map<String, dynamic>;
  }
}
