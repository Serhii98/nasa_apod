import 'package:flutter/material.dart';
import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/src/core/ui/states/base_stateful_screen.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:nasa_apod/src/ui/custom/get_progress.dart';
import 'package:nasa_apod/src/ui/custom/refresh_view.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc_state.dart';
import 'package:nasa_apod/src/ui/home/parts/home_content.dart';

final class HomeMobile extends BaseStatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => HomeMobileState();
}

final class HomeMobileState
    extends BaseStatefulScreen<HomeMobile, HomeBlocState, HomeBloc> {
  @override
  HomeBloc createBloc() {
    throw UnimplementedError(AppStrings.developerError);
  }

  @override
  bool isSharedBloc() => true;

  @override
  void onListen(final BuildContext context, final HomeBlocState state) {}

  @override
  PreferredSizeWidget? buildAppbar(
    final BuildContext context,
    final HomeBlocState state,
  ) {
    return null;
  }

  @override
  Widget buildBody(final BuildContext context, final HomeBlocState state) {
    if (state.isLoading) {
      return const GetProgress();
    }
    if (state.hasError && state.parsedError?.showRefresh == true) {
      return RefreshView(
        onClick: getBloc(context).refresh,
        parsedError: state.parsedError,
      );
    }
    return const HomeContent();
  }
}
