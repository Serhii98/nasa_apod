class LangModel {
  const LangModel(
    this.langCode,
    this.countryCode,
    this.displayText,
  );
  final String langCode, countryCode;
  final String displayText;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LangModel &&
          runtimeType == other.runtimeType &&
          langCode == other.langCode &&
          countryCode == other.countryCode &&
          displayText == other.displayText;

  @override
  int get hashCode =>
      langCode.hashCode ^ countryCode.hashCode ^ displayText.hashCode;
}
