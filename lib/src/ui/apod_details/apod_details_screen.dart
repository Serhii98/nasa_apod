import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/src/core/localization/localization.dart';
import 'package:nasa_apod/src/core/ui/states/screen_provider.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:nasa_apod/src/data/managers/router_arguments/router_args_manager.dart';
import 'package:nasa_apod/src/ui/apod_details/bloc/apod_details_bloc.dart';
import 'package:nasa_apod/src/ui/apod_details/bloc/apod_details_bloc_state.dart';
import 'package:nasa_apod/src/ui/apod_details/data/apod_details_init_dto.dart';
import 'package:nasa_apod/src/ui/apod_details/screens/apod_details_desktop.dart';
import 'package:nasa_apod/src/ui/apod_details/screens/apod_details_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
final class ApodDetailsScreen extends BaseStatefulWidget {
  const ApodDetailsScreen({
    super.key,
    @QueryParam(
      AppStrings.jsonArg,
    )
    this.initDtoEncoded = '',
  });

  final String initDtoEncoded;

  @override
  State<StatefulWidget> createState() {
    return ApodDetailsState();
  }
}

final class ApodDetailsState extends ScreenProvider<ApodDetailsScreen,
    ApodDetailsBlocState, ApodDetailsBloc> {
  @override
  void onListen(
    final BuildContext context,
    final ApodDetailsBlocState state,
  ) {
    if (state.hasError && state.parsedError?.showMessage == true) {
      showMessage(state.parsedError?.displayMessage);
    }
  }

  @override
  ApodDetailsBloc createBloc() {
    try {
      return ApodDetailsBloc(
        context.tr(),
        ApodDetailsInitDto.fromMap(
          RouterArgsManager().getDecodedValue(widget.initDtoEncoded),
        ),
      );
    } catch (e) {
      return ApodDetailsBloc(
        context.tr(),
        null,
      );
    }
  }

  bool isSharedBloc() => false;

  @override
  Widget onBuild(final BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (final BuildContext context) => const ApodDetailsMobile(),
      tablet: (final BuildContext context) => const ApodDetailsMobile(),
      desktop: (final BuildContext context) => const ApodDetailsDesktop(),
    );
  }
}
