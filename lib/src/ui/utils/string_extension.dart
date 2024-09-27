/// [String] Extension
extension StringExtension on String {
  /// limit
  String limit(final int length) =>
      length < this.length ? substring(0, length) : this;
}

/// [String]? Extension
extension StringNullableExtension on String? {
  /// is null or isEmpty
  bool isNullOrEmpty() => this?.trim().isEmpty ?? true;

  /// Uppercase first letter inside string and let the others lowercase
  String capitalize() {
    if (isNullOrEmpty() || this == null || this?[0] == null) {
      return '';
    }
    return (this?[0].toUpperCase() ?? '') +
        (this?.substring(1).toLowerCase() ?? '');
  }

  /// phone format: + xxx (xx) xxx xx xx
  String formatPhone1() {
    if (isNullOrEmpty()) {
      return '';
    }
    final bool plus = (this?.contains('+') ?? false);
    final String str = plus ? (this ?? '') : '+$this';
    if (str.length > 10) {
      return '${str.substring(0, 4)}'
          ' (${str.substring(4, 6)})'
          ' ${str.substring(6, 9)}'
          ' ${str.substring(9, 11)}'
          ' ${str.substring(11, str.length)}';
    }
    return this ?? '';
  }

  /// phone format: +xxx xx-xx-xx-xxx
  String formatPhone2([final String divider = '-']) {
    if (isNullOrEmpty()) {
      return '';
    }
    if ((this?.length ?? 0) > 9) {
      final bool plus = !(this?.contains('+') ?? false);
      return '${plus ? '+' : ''}'
          '${this?.substring(0, 3)} '
          '${this?.substring(3, 5)}$divider'
          '${this?.substring(5, 7)}$divider'
          '${this?.substring(7, 9)}$divider'
          '${this?.substring(9, this?.length)}';
    }
    return this ?? '';
  }

  /// phone format: xx-xx-xx-xxx
  String formatPhone3() {
    if (isNullOrEmpty()) {
      return '';
    }
    if ((this?.length ?? 0) > 6) {
      return '${this?.substring(0, 2)}-'
          '${this?.substring(2, 4)}-'
          '${this?.substring(4, 6)}-'
          '${this?.substring(6, this?.length)}';
    }
    return this ?? '';
  }

  /// phone format: + xxx xx xxx xx xx
  String formatPhone4() {
    if (isNullOrEmpty()) {
      return '';
    }
    final bool plus = this?.contains('+') ?? false;
    final String str = plus ? this ?? '' : '+$this';
    if (str.length > 10) {
      return '${str.substring(0, 4)}'
          ' ${str.substring(4, 6)}'
          ' ${str.substring(6, 9)}'
          ' ${str.substring(9, 11)}'
          ' ${str.substring(11, str.length)}';
    }
    return this ?? '';
  }
}
