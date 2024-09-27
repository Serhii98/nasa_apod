import 'package:flutter/material.dart';
import 'package:nasa_apod/constants/app_durations.dart';
import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/src/core/ui/states/base_controlled_state.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateful_widget.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc.dart';
import 'package:nasa_apod/src/ui/home/bloc/home_bloc_state.dart';
import 'package:nasa_apod/src/utils/elvis.dart';

class AnimatedText extends BaseStatefulWidget {
  const AnimatedText({super.key});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState
    extends BaseControlledState<AnimatedText, HomeBlocState, HomeBloc>
    with SingleTickerProviderStateMixin {
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    getBloc(context).controlsBlock.controller = AnimationController(
      duration: AppDurations.textFadeDuration,
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: getBloc(context).controlsBlock.controller,
      curve: Curves.easeInOut,
    );
    getBloc(context).controlsBlock.controller.forward();
    super.initState();
  }

  @override
  bool isSharedBloc() => true;

  @override
  Widget onBuild(final BuildContext context, final HomeBlocState state) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Text(
        state.data!.apod.title.orEmpty(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
      ),
    );
  }

  @override
  void onListen(final BuildContext context, final HomeBlocState state) {}

  @override
  HomeBloc createBloc() {
    throw UnimplementedError(AppStrings.developerError);
  }

  @override
  void dispose() {
    getBloc(context).controlsBlock.controller.dispose();
    super.dispose();
  }
}
