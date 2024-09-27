final class ApodDetailsInitDto {
  factory ApodDetailsInitDto.fromMap(final Map<String, dynamic> data) {
    return ApodDetailsInitDto(data['url']);
  }

  ApodDetailsInitDto(this.url);

  final String url;

  Map<String, dynamic> toMap() {
    return <String, String>{
      'url': url,
    };
  }
}
