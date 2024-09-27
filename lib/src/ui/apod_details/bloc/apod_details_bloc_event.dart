

import 'package:nasa_apod/src/core/bloc/base_bloc_event.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc_state.dart';

sealed class ApodDetailsBlocEvent extends BaseBlocEvent {}

final class StartProcessing extends ApodDetailsBlocEvent {}

final class StartLoading extends ApodDetailsBlocEvent {}

final class DisplayError extends ApodDetailsBlocEvent {
  DisplayError({required this.parsedError});

  final ParsedError parsedError;
}

final class ShowData extends ApodDetailsBlocEvent {
  ShowData({required this.data});

  final BlocData data;
}
