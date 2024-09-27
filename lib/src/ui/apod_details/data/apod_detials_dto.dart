final class ApodDetailsDto {
  ApodDetailsDto({required final String url}) : _url = url;

  final String _url;

  String get url => _url;

  ApodDetailsDto copyWith({
    final String? url,
  }) =>
      ApodDetailsDto(
        url: url ?? _url,
      );
}
