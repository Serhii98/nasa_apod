import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_event.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_state.dart';
import 'package:nasa_apod/src/core/ui/states/base_view_state.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateful_widget.dart';

abstract class BaseControlledState<
    BSW extends BaseStatefulWidget,
    BS extends BaseBlocState,
    BB extends BaseBloc<BaseBlocEvent, BS>> extends BaseViewState<BSW> {
  bool isSharedBloc();

  BB createBloc();

  BB? _blocObject;

  @protected
  BB getBloc(final BuildContext context) {
    return _blocObject ?? BlocProvider.of<BB>(context, listen: false);
  }

  @protected
  void onListen(final BuildContext context, final BS state);

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
    if (!isSharedBloc()) {
      return BlocProvider<BB>(
        create: (final BuildContext context) {
          _blocObject = createBloc();
          return _blocObject!;
        },
        child: BlocListener<BB, BS>(
          listener: onListen,
          listenWhen: listenWhen,
          child: _getBlocContent(),
        ),
      );
    }
    return _getBlocContent();
  }
}
