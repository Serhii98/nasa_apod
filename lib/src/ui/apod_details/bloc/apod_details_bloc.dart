import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc.dart';
import 'package:nasa_apod/src/core/errors/error_type.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';
import 'package:nasa_apod/src/ui/apod_details/bloc/apod_details_bloc_event.dart';
import 'package:nasa_apod/src/ui/apod_details/bloc/apod_details_bloc_state.dart';
import 'package:nasa_apod/src/ui/apod_details/data/apod_details_init_dto.dart';
import 'package:nasa_apod/src/ui/apod_details/data/apod_detials_dto.dart';
import 'package:nasa_apod/values/l10n/gen/translation.dart';

final class ApodDetailsBloc
    extends BaseBloc<ApodDetailsBlocEvent, ApodDetailsBlocState> {
  ApodDetailsBloc(final Translation t, final ApodDetailsInitDto? initDto)
      : super(
          t,
          initDto == null
              ? ApodDetailsBlocState.error(
                  data: null,
                  parsedError: ParsedError(
                    displayMessage: t.unableToOpen,
                    errorType: ErrorType.pageNotFound,
                  ),
                )
              : ApodDetailsBlocState.idle(
                  data: ApodDetailsDto(url: initDto.url),
                ),
        );

  @override
  void initTransformers() {
    on<StartProcessing>((final StartProcessing event,
        final Emitter<ApodDetailsBlocState> emit) {
      emit(ApodDetailsBlocState.processing(data: state.data));
    });
    on<StartLoading>(
        (final StartLoading event, final Emitter<ApodDetailsBlocState> emit) {
      emit(ApodDetailsBlocState.loading(data: state.data));
    });
    on<ShowData>(
        (final ShowData event, final Emitter<ApodDetailsBlocState> emit) {
      emit(ApodDetailsBlocState.successful(data: state.data));
    });
    on<DisplayError>(
        (final DisplayError event, final Emitter<ApodDetailsBlocState> emit) {
      emit(
        ApodDetailsBlocState.error(
          data: state.data,
          parsedError: event.parsedError,
        ),
      );
    });
  }

  @override
  void onCreated() {}
}
