import 'package:nasa_apod/src/core/bloc/base_bloc_event.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';

sealed class SplashEvent extends BaseBlocEvent {}

final class OpenLogin extends SplashEvent {}

final class DisplayError extends SplashEvent {
  DisplayError({required this.error});

  final ParsedError error;
}

final class StartLoading extends SplashEvent {}
