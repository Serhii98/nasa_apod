import 'package:flutter/foundation.dart';
import 'package:nasa_apod/src/core/network/api_versions.dart';
import 'package:nasa_apod/src/domain/responses/api_response.dart';
import 'package:nasa_apod/src/domain/responses/apod_response.dart';

abstract class RemoteDataSource {
  RemoteDataSource(this.apiVersion);

  @protected
  final ApiVersion apiVersion;

  Future<APIResponse<ApodResponse>> getApod();
}
