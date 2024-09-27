enum ApiVersion {
  v1("V1");

  const ApiVersion(this.value);

  final String value;

  @override
  String toString() => value;
}
