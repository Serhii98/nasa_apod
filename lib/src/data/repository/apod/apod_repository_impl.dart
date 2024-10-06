import 'package:nasa_apod/src/data/repository/apod/apod_repository.dart';
import 'package:nasa_apod/src/data/sources/remote/remote_data_source.dart';
import 'package:nasa_apod/src/di/global_binding.dart';
import 'package:nasa_apod/src/domain/responses/api_response.dart';
import 'package:nasa_apod/src/domain/responses/apod_response.dart';

final class ApodRepositoryImpl extends ApodRepository {
  late final RemoteDataSource _api = getIt.get();

  @override
  Future<APIResponse<ApodResponse>> getApod() {
    return _api.getApod();
  }
}
