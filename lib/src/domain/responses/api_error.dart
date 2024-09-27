import 'dart:convert';

ApiError apiErrorFromJson(String str) => ApiError.fromJson(json.decode(str));

String apiErrorToJson(ApiError data) => json.encode(data.toJson());

class ApiError {
  ApiError({
    int? code,
    String? message,
    Map<String, String>? details,
  }) {
    _code = code;
    _message = message;
    _details = details;
  }

  ApiError.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _details =
        (json['details'] != null && json['details'] is Map<String, dynamic>)
            ? (json['details'] as Map<String, dynamic>)
                .map((k, v) => MapEntry(k, v.toString()))
            : null;
  }

  int? _code;
  String? _message;
  Map<String, String>? _details;

  ApiError copyWith({
    int? code,
    String? message,
    Map<String, String>? details,
  }) =>
      ApiError(
        code: code ?? _code,
        message: message ?? _message,
        details: details ?? _details,
      );

  int? get code => _code;

  String? get message => _message;

  Map<String, String>? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    map['details'] = _details;
    return map;
  }
}

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

String detailsToJson(Details data) => json.encode(data.toJson());

class Details {
  Details({String? code, Map<String, String>? otherFields}) {
    _code = code;
    _otherFields = otherFields;
  }

  Details.fromJson(dynamic json) {
    _code = json['code'];
    _otherFields =
        (json as Map<String, dynamic>).map((k, v) => MapEntry(k, v.toString()));
  }

  String? _code;
  Map<String, String>? _otherFields;

  Details copyWith({String? code, Map<String, String>? otherFields}) => Details(
        code: code ?? _code,
        otherFields: _otherFields ?? _otherFields,
      );

  String? get code => _code;

  Map<String, String>? get otherFields => _otherFields;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['otherFields'] = _code;
    return map;
  }
}
