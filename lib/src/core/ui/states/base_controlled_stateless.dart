import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_event.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_state.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateless_widget.dart';

abstract class BaseControlledStateless<BS extends BaseBlocState,
    BB extends BaseBloc<BaseBlocEvent, BS>> extends BaseStatelessWidget {
  const BaseControlledStateless({super.key});

  @protected
  BB getBloc(final BuildContext context) {
    return BlocProvider.of<BB>(context, listen: false);
  }

  @protected
  bool buildWhen(final BS previous, final BS current) => true;

  @protected
  bool listenWhen(final BS previous, final BS current) => true;

  @protected
  Widget onBuild(final BuildContext context, final BS state);

  Widget _getBlocContent() {
    return BlocBuilder<BB, BS>(
      builder: onBuild,
      buildWhen: buildWhen,
    );
  }

  @override
  Widget build(final BuildContext context) {
    return _getBlocContent();
  }
}
