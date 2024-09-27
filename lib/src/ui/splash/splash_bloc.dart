import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod/constants/app_durations.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc.dart';
import 'package:nasa_apod/src/core/errors/display_mode.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';
import 'package:nasa_apod/src/routing/router.dart';
import 'package:nasa_apod/src/routing/router.gr.dart';
import 'package:nasa_apod/src/ui/splash/bloc/splash_events.dart';
import 'package:nasa_apod/src/ui/splash/bloc/splash_states.dart';
import 'package:nasa_apod/values/l10n/gen/translation.dart';

final class SplashBloc extends BaseBloc<SplashEvent, SplashBlocState> {
  SplashBloc(final Translation t)
      : super(t, const SplashBlocState.loading(data: null));

  @override
  void initTransformers() {
    on<DisplayError>(
      (final DisplayError event, final Emitter<SplashBlocState> emit) {
        emit(
          SplashBlocState.error(
            data: state.data,
            parsedError: event.error,
          ),
        );
      },
    );
    on<StartLoading>(
      (final StartLoading event, final Emitter<SplashBlocState> emit) {
        emit(SplashBlocState.loading(data: state.data));
      },
    );
  }

  /// Method to refresh the data
  void refresh() => onCreated();

  @override
  void onCreated() async {
    try {
      add(StartLoading());
      await Future.delayed(AppDurations.splashDuration);
      AppRouter().popAllAndPush(const HomeScreen());
    } catch (err, stackTrace) {
      final ParsedError parsedError = handleError(err, stackTrace)
          .copyWith(displayMode: DisplayMode.refreshAndMessage);
      add(DisplayError(error: parsedError));
    }
  }
}
