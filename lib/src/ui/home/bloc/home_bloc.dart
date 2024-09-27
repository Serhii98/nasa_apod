import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc.dart';
import 'package:nasa_apod/src/core/errors/display_mode.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';
import 'package:nasa_apod/src/data/managers/router_arguments/router_args_manager.dart';
import 'package:nasa_apod/src/data/repository/apod/apod_repository.dart';
import 'package:nasa_apod/src/di/global_binding.dart';
import 'package:nasa_apod/src/domain/responses/api_response.dart';
import 'package:nasa_apod/src/domain/responses/apod_response.dart';
import 'package:nasa_apod/src/routing/router.dart';
import 'package:nasa_apod/src/routing/router.gr.dart';
import 'package:nasa_apod/src/ui/apod_details/data/apod_details_init_dto.dart';
import 'package:nasa_apod/src/ui/home/bloc/controls_block.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc_event.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc_state.dart';
import 'package:nasa_apod/src/ui/home/data/home_bloc_dto.dart';
import 'package:nasa_apod/values/l10n/gen/translation.dart';

final class HomeBloc extends BaseBloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc(final Translation t)
      : super(t, const HomeBlocState.loading(data: null));

  late final ApodRepository _apodRepository = getIt.get();
  late final HomeControlsBlock controlsBlock = HomeControlsBlock();

  @override
  void initTransformers() {
    on<StartProcessing>(
        (final StartProcessing event, final Emitter<HomeBlocState> emit) {
      emit(HomeBlocState.processing(data: state.data));
    });
    on<StartLoading>(
        (final StartLoading event, final Emitter<HomeBlocState> emit) {
      emit(HomeBlocState.loading(data: state.data));
    });
    on<ShowData>((final ShowData event, final Emitter<HomeBlocState> emit) {
      emit(HomeBlocState.successful(data: event.data));
    });
    on<DisplayError>(
        (final DisplayError event, final Emitter<HomeBlocState> emit) {
      emit(
        HomeBlocState.error(
          data: state.data,
          parsedError: event.parsedError,
        ),
      );
    });
  }

  @override
  void onCreated() {
    _loadData();
  }

  void navigateApodDetails(final String url) async {
    await controlsBlock.controller.reverse();
    await AppRouter().push(
      ApodDetailsScreen(
        initDtoEncoded: RouterArgsManager().getEncodedValue(
          ApodDetailsInitDto(url).toMap(),
        ),
      ),
    );
    await controlsBlock.controller.forward();
  }

  void refresh() => _loadData();

  void _loadData() async {
    try {
      add(StartLoading());
      final APIResponse<ApodResponse> response =
          await _apodRepository.getApod();
      add(
        ShowData(
          data: HomeBlocDto(
            apod: response.getApiData() ?? ApodResponse(),
          ),
        ),
      );
    } catch (err, stackTrace) {
      final ParsedError parsedError = handleError(err, stackTrace).copyWith(
        displayMode: DisplayMode.refreshAndMessage,
      );
      add(DisplayError(parsedError: parsedError));
    }
  }
}
