import 'package:nasa_apod/src/domain/responses/api_response.dart';
import 'package:nasa_apod/src/domain/responses/apod_response.dart';

abstract class RemoteDataSource {
  Future<APIResponse<ApodResponse>> getApod();
}
