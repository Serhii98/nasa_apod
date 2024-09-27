import 'package:nasa_apod/src/core/base_repository.dart';
import 'package:nasa_apod/src/domain/responses/api_response.dart';
import 'package:nasa_apod/src/domain/responses/apod_response.dart';

abstract class ApodRepository extends BaseRepository {
  Future<APIResponse<ApodResponse>> getApod();
}
