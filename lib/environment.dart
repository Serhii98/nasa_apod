import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/src/di/flavor.dart';
import 'package:nasa_apod/src/di/global_binding.dart';

final class Environment {
  factory Environment.fromEnv() {
    switch (GlobalBinding.flavor) {
      case Flavor.dev:
        return const Environment._(
            backendUrl: AppStrings.devServerUrl,
            nasaApiKey: AppStrings.devNasaApiKey);
      case Flavor.stage:
        return const Environment._(
            backendUrl: AppStrings.stageServerUrl,
            nasaApiKey: AppStrings.stageNasaApiKey);
      case Flavor.prod:
        return const Environment._(
            backendUrl: AppStrings.prodServerUrl,
            nasaApiKey: AppStrings.prodNasaApiKey);
      default:
        throw Exception('Unknown environment ${GlobalBinding.flavor}');
    }
  }

  const Environment._({
    /// Url of your backend API / or Supabase URL / or Firebase Functions region
    required this.backendUrl,
    required this.nasaApiKey,
  });

  /// Url of your backend API / or Supabase URL / or Firebase Functions region
  final String backendUrl;

  final String nasaApiKey;
}
