/// [String]? Extension
extension StringNullableExtension on String? {
  /// is null or isEmpty
  bool isNullOrEmpty() => this?.trim().isEmpty ?? true;
}
