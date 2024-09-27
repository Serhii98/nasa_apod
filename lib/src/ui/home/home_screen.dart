import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nasa_apod/src/core/localization/localization.dart';
import 'package:nasa_apod/src/core/ui/states/screen_provider.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc_state.dart';
import 'package:nasa_apod/src/ui/home/screens/home_desktop.dart';
import 'package:nasa_apod/src/ui/home/screens/home_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
final class HomeScreen extends BaseStatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

final class HomeScreenState
    extends ScreenProvider<HomeScreen, HomeBlocState, HomeBloc> {
  @override
  void onListen(final BuildContext context, final HomeBlocState state) {
    if (state.hasError && state.parsedError?.showMessage == true) {
      showMessage(state.parsedError?.displayMessage);
    }
  }

  @override
  HomeBloc createBloc() => HomeBloc(context.tr());

  bool isSharedBloc() => false;

  @override
  Widget onBuild(final BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (final BuildContext context) => const HomeMobile(),
      tablet: (final BuildContext context) => const HomeMobile(),
      desktop: (final BuildContext context) => const HomeDesktop(),
    );
  }
}
