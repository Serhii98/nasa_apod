
import 'package:nasa_apod/src/core/bloc/base_bloc_event.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';
import 'package:nasa_apod/src/core/localization/lang_model.dart';
import 'package:nasa_apod/src/core_app/bloc/core_app_bloc_states.dart';

sealed class CoreAppBlocEvent extends BaseBlocEvent {}

final class StartProcessing extends CoreAppBlocEvent {}

final class StartLoading extends CoreAppBlocEvent {}

final class DisplayError extends CoreAppBlocEvent {
  DisplayError({required this.parsedError});
  final ParsedError parsedError;
}

final class ShowData extends CoreAppBlocEvent {
  ShowData({required this.data});
  final BlocData data;
}

final class OnLanguageChanged extends CoreAppBlocEvent {
  OnLanguageChanged({required this.langModel});
  final LangModel langModel;
}
