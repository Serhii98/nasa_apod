final class BaseNetworkImageDto {
  BaseNetworkImageDto(
      {required final String url, final double? height, final double? width})
      : _url = url,
        _height = height,
        _width = width;

  final String _url;
  final double? _height;
  final double? _width;

  String get url => _url;

  double? get height => _height;

  double? get width => _width;

  BaseNetworkImageDto copyWith({
    final String? url,
    final double? height,
    final double? width,
  }) =>
      BaseNetworkImageDto(
        url: url ?? _url,
        height: height ?? _height,
        width: width ?? _width,
      );
}
