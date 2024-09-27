import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc.dart';
import 'package:nasa_apod/src/core/localization/lang_model.dart';
import 'package:nasa_apod/src/core_app/bloc/core_app_bloc_events.dart';
import 'package:nasa_apod/src/core_app/bloc/core_app_bloc_states.dart';
import 'package:nasa_apod/src/data/managers/language/language_manager.dart';
import 'package:nasa_apod/src/routing/router.dart';
import 'package:nasa_apod/src/routing/router.gr.dart';
import 'package:nasa_apod/values/l10n/gen/translation.dart';

final class CoreAppBloc extends BaseBloc<CoreAppBlocEvent, CoreAppBlocState> {
  CoreAppBloc(final Translation t)
      : super(
          t,
          const CoreAppBlocState.loading(
            data: null,
          ),
        );

  StreamSubscription<LangModel>? _languageChangedSubscription;

  @override
  void initTransformers() {
    on<StartProcessing>(
      (final StartProcessing event, final Emitter<CoreAppBlocState> emit) {
        emit(CoreAppBlocState.processing(data: state.data));
      },
    );
    on<StartLoading>(
      (final StartLoading event, final Emitter<CoreAppBlocState> emit) {
        emit(CoreAppBlocState.loading(data: state.data));
      },
    );
    on<ShowData>(
      (final ShowData event, final Emitter<CoreAppBlocState> emit) {
        emit(CoreAppBlocState.successful(data: event.data));
      },
    );
    on<DisplayError>(
      (final DisplayError event, final Emitter<CoreAppBlocState> emit) {
        emit(
          CoreAppBlocState.error(
            data: state.data,
            parsedError: event.parsedError,
          ),
        );
      },
    );
    on<OnLanguageChanged>(
      (final OnLanguageChanged event, final Emitter<CoreAppBlocState> emit) {
        emit(
          CoreAppBlocState.successful(
            data: state.data?.copyWith(
              langModel: event.langModel,
            ),
          ),
        );
      },
    );
  }

  void _changeLanguage(final LangModel langModel) {
    add(OnLanguageChanged(langModel: langModel));
  }

  @override
  void onCreated() async {
    // LocationManager().registerPlatformInstance();
    _languageChangedSubscription = LanguageManager()
        .onNewLanguagePropagated
        .listen((final LangModel value) {
      _changeLanguage(value);
      AppRouter().popAllAndPush(const SplashScreen());
    });
  }

  @override
  Future<void> close() async {
    await _languageChangedSubscription?.cancel();
    return super.close();
  }
}
