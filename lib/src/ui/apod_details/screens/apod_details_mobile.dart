import 'package:flutter/material.dart';
import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/src/core/ui/states/base_stateful_screen.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:nasa_apod/src/ui/apod_details/bloc/apod_details_bloc.dart';
import 'package:nasa_apod/src/ui/apod_details/bloc/apod_details_bloc_state.dart';
import 'package:nasa_apod/src/ui/apod_details/parts/apod_details_content.dart';
import 'package:nasa_apod/src/ui/custom/empty_view.dart';
import 'package:nasa_apod/src/ui/custom/get_progress.dart';
import 'package:nasa_apod/src/ui/custom/refresh_view.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc_state.dart';
import 'package:nasa_apod/src/ui/home/parts/home_content.dart';

final class ApodDetailsMobile extends BaseStatefulWidget {
  const ApodDetailsMobile({super.key});

  @override
  State<ApodDetailsMobile> createState() => ApodDetailsMobileState();
}

final class ApodDetailsMobileState
    extends BaseStatefulScreen<ApodDetailsMobile, ApodDetailsBlocState, ApodDetailsBloc> {
  @override
  ApodDetailsBloc createBloc() {
    throw UnimplementedError(AppStrings.developerError);
  }

  @override
  bool isSharedBloc() => true;

  @override
  void onListen(final BuildContext context, final ApodDetailsBlocState state) {}

  @override
  PreferredSizeWidget? buildAppbar(
    final BuildContext context,
    final ApodDetailsBlocState state,
  ) {
    return null;
  }

  @override
  Widget buildBody(final BuildContext context, final ApodDetailsBlocState state) {
    if (state.isLoading) {
      return const GetProgress();
    }
    if (state.hasError && state.parsedError?.showRefresh == true) {
      return EmptyView();
    }
    return const ApodDetailsContent();
  }
}
