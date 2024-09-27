import 'package:nasa_apod/src/domain/responses/apod_response.dart';

final class HomeBlocDto {
  HomeBlocDto({required this.apod});

  final ApodResponse apod;

  HomeBlocDto copyWith({
    final ApodResponse? apod,
  }) {
    return HomeBlocDto(
      apod: apod ?? this.apod,
    );
  }
}
