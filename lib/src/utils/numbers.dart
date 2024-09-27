double? doubleParse(final dynamic data) {
  final String tmp = data.toString().replaceAll(",", ".");
  final double? doubleResult = double.tryParse(tmp);
  if (doubleResult != null) {
    return doubleResult;
  }
  final int? intResult = int.tryParse(tmp);
  if (intResult != null) {
    return intResult.toDouble();
  }
  return null;
}
