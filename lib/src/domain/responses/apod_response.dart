final class ApodResponse {
  ApodResponse({
    final String? copyright,
    final String? date,
    final String? explanation,
    final String? hdurl,
    final String? mediaType,
    final String? serviceVersion,
    final String? title,
    final String? url,
  }) {
    _copyright = copyright;
    _date = date;
    _explanation = explanation;
    _hdurl = hdurl;
    _mediaType = mediaType;
    _serviceVersion = serviceVersion;
    _title = title;
    _url = url;
  }

  ApodResponse.fromJson(final dynamic json) {
    _copyright = json['copyright'];
    _date = json['date'];
    _explanation = json['explanation'];
    _hdurl = json['hdurl'];
    _mediaType = json['media_type'];
    _serviceVersion = json['service_version'];
    _title = json['title'];
    _url = json['url'];
  }

  String? _copyright;
  String? _date;
  String? _explanation;
  String? _hdurl;
  String? _mediaType;
  String? _serviceVersion;
  String? _title;
  String? _url;

  ApodResponse copyWith({
    final String? copyright,
    final String? date,
    final String? explanation,
    final String? hdurl,
    final String? mediaType,
    final String? serviceVersion,
    final String? title,
    final String? url,
  }) =>
      ApodResponse(
        copyright: copyright ?? _copyright,
        date: date ?? _date,
        explanation: explanation ?? _explanation,
        hdurl: hdurl ?? _hdurl,
        mediaType: mediaType ?? _mediaType,
        serviceVersion: serviceVersion ?? _serviceVersion,
        title: title ?? _title,
        url: url ?? _url,
      );

  String? get copyright => _copyright;

  String? get date => _date;

  String? get explanation => _explanation;

  String? get hdurl => _hdurl;

  String? get mediaType => _mediaType;

  String? get serviceVersion => _serviceVersion;

  String? get title => _title;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['copyright'] = _copyright;
    map['date'] = _date;
    map['explanation'] = _explanation;
    map['hdurl'] = _hdurl;
    map['media_type'] = _mediaType;
    map['service_version'] = _serviceVersion;
    map['title'] = _title;
    map['url'] = _url;
    return map;
  }
}
