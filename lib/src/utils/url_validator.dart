abstract class UrlValidator {
  static bool isValidUrl(final String? data) {
    if (data == null) {
      return false;
    }
    return Uri.tryParse(data)?.hasAbsolutePath ?? false;
  }
}
