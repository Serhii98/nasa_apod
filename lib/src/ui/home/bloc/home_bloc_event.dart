

import 'package:nasa_apod/src/core/bloc/base_bloc_event.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc_state.dart';

sealed class HomeBlocEvent extends BaseBlocEvent {}

final class StartProcessing extends HomeBlocEvent {}

final class StartLoading extends HomeBlocEvent {}

final class DisplayError extends HomeBlocEvent {
  DisplayError({required this.parsedError});

  final ParsedError parsedError;
}

final class ShowData extends HomeBlocEvent {
  ShowData({required this.data});

  final BlocData data;
}
