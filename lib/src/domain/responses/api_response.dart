import 'package:nasa_apod/src/domain/responses/api_error.dart';

final class APIResponse<T> {
  String? status;
  T? _data;
  ApiError? error;

  APIResponse.fromJson(dynamic json, T data) {
    status = json["status"];
    _data = data;
    final tmpError = json["error"];
    if (tmpError != null) {
      error = ApiError.fromJson(tmpError);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = data;
    data['error'] = error?.toJson();
    return data;
  }

  bool isSuccess() {
    return status != null && status == "success";
  }

  T? getApiData() {
    return _data;
  }
}
