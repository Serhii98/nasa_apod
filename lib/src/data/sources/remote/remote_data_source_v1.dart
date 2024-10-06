import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/src/core/network/dio_manager.dart';
import 'package:nasa_apod/src/data/sources/remote/remote_data_source.dart';
import 'package:nasa_apod/src/domain/responses/api_response.dart';
import 'package:nasa_apod/src/domain/responses/apod_response.dart';

final class RemoteDataSourceV1 extends RemoteDataSource {
  RemoteDataSourceV1() : super();

  @override
  Future<APIResponse<ApodResponse>> getApod() async {
    return await DioManager()
        .get("planetary/apod?api_key=${AppStrings.nasaApiKey}")
        .then((response) {
      late ApodResponse model;
      if (response.data != null) {
        model = ApodResponse.fromJson(response.data);
      }
      return APIResponse.fromJson(response.data, model);
    });
  }
}
