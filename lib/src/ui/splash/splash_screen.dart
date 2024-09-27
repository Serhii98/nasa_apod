import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nasa_apod/constants/app_durations.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc.dart';
import 'package:nasa_apod/src/core/localization/localization.dart';
import 'package:nasa_apod/src/core/theme/extensions/theme_extension.dart';
import 'package:nasa_apod/src/core/ui/states/base_stateful_screen.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:nasa_apod/src/routing/router.dart';
import 'package:nasa_apod/src/ui/custom/refresh_view.dart';
import 'package:nasa_apod/src/ui/splash/bloc/splash_states.dart';
import 'package:nasa_apod/src/ui/splash/splash_bloc.dart';
import 'package:nasa_apod/values/dimens.dart';

@RoutePage()
final class SplashScreen extends BaseStatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

final class SplashScreenState
    extends BaseStatefulScreen<SplashScreen, SplashBlocState, SplashBloc> {
  @override
  void onListen(final BuildContext context, final SplashBlocState state) {
    if (state.hasData) {
      AppRouter().popAllAndPush(state.data!);
    }
  }

  @override
  SplashBloc createBloc() => SplashBloc(Localization.from(context));

  @override
  Color getBackgroundColor() {
    return context.colors.background;
  }

  Widget _getContent(final BuildContext context, final SplashBlocState state) {
    if (state.isLoading) {
      return const Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FlutterLogo(
                size: AppSizes.size128,
              ),
              Gap(AppSizes.sizeM),
              LinearProgressIndicator(
                borderRadius: AppBordersRadius.borderRadiusAll100,
                minHeight: AppSizes.sizeSSM,
              ),
            ],
          ),
        ),
      );
    }
    if (state.hasError) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 512),
          child: RefreshView(
            onClick: context.read<SplashBloc>().refresh,
            parsedError: state.parsedError,
            showAnimation: true,
          ),
        ),
      );
    }
    return const Offstage();
  }

  @override
  Widget buildBody(final BuildContext context, final SplashBlocState state) {
    return AnimatedSwitcher(
      duration: AppDurations.defaultAnimationDuration,
      transitionBuilder:
          (final Widget child, final Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: Builder(
        key: ValueKey(state),
        builder: (final BuildContext ctx) {
          return _getContent(context, state);
        },
      ),
    );
  }

  @override
  bool isSharedBloc() => false;
}
