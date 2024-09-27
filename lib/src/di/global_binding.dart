import 'package:get_it/get_it.dart';
import 'package:nasa_apod/src/core/network/api_versions.dart';
import 'package:nasa_apod/src/core/network/dio_manager.dart';
import 'package:nasa_apod/src/data/repository/apod/apod_repository.dart';
import 'package:nasa_apod/src/data/repository/apod/apod_repository_impl.dart';
import 'package:nasa_apod/src/data/sources/remote/remote_data_source.dart';
import 'package:nasa_apod/src/data/sources/remote/remote_data_source_v1.dart';
import 'package:nasa_apod/src/di/flavor.dart';

final GetIt getIt = GetIt.instance;

abstract class GlobalBinding {
  static Flavor? get flavor => _flavor;
  static Flavor? _flavor;

  static void setup(final Flavor value) {
    _flavor = value;

    DioManager.configure();

    getIt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceV1(),
      instanceName: ApiVersion.v1.value,
    );
    getIt.registerLazySingleton<ApodRepository>(
      () => ApodRepositoryImpl(),
    );
  }
}
