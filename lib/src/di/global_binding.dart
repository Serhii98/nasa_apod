import 'package:get_it/get_it.dart';
import 'package:nasa_apod/src/core/network/dio_manager.dart';
import 'package:nasa_apod/src/data/repository/apod/apod_repository.dart';
import 'package:nasa_apod/src/data/repository/apod/apod_repository_impl.dart';
import 'package:nasa_apod/src/data/sources/remote/remote_data_source.dart';
import 'package:nasa_apod/src/data/sources/remote/remote_data_source_v1.dart';

final GetIt getIt = GetIt.instance;

abstract class GlobalBinding {
  static void setup() {
    DioManager.configure();

    getIt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceV1(),
    );
    getIt.registerLazySingleton<ApodRepository>(
      () => ApodRepositoryImpl(),
    );
  }
}
