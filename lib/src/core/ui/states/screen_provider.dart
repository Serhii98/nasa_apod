import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_event.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_state.dart';
import 'package:nasa_apod/src/core/messaging/inapp_notification_manager.dart';
import 'package:nasa_apod/src/core/messaging/message_dto.dart';
import 'package:nasa_apod/src/core/messaging/message_type.dart';
import 'package:nasa_apod/src/core/ui/states/base_view_state.dart';
import 'package:nasa_apod/src/core/ui/widgets/base_stateful_widget.dart';

abstract class ScreenProvider<
    BSW extends BaseStatefulWidget,
    BS extends BaseBlocState,
    BB extends BaseBloc<BaseBlocEvent, BS>> extends BaseViewState<BSW> {
  BB? _blocObject;
  StreamSubscription<MessageDto>? _messageSubscription;

  BB createBloc();

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
  Widget onBuild(final BuildContext context);

  @protected
  bool messagingEnabled() => false;

  @override
  void initState() {
    super.initState();
    if (messagingEnabled()) {
      WidgetsBinding.instance.addPostFrameCallback((final Duration timeStamp) {
        _messageSubscription =
            getBloc(context).messageSubject.listen((final MessageDto value) {
          showMessage(value.message, messageType: value.type);
        });
      });
    }
  }

  @override
  void dispose() {
    _messageSubscription?.cancel().ignore();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<BB>(
      create: (final BuildContext context2) {
        _blocObject = createBloc();
        return _blocObject!;
      },
      child: BlocListener<BB, BS>(
        listener: onListen,
        listenWhen: listenWhen,
        child: onBuild(context),
      ),
    );
  }

  /// Method to show message
  /// Params: [msg]
  void showMessage(
    final String? msg, {
    final MessageType messageType = MessageType.error,
  }) {
    InAppNotificationManager().showMessage(
      context,
      msg,
      messageType: messageType,
    );
  }
}
