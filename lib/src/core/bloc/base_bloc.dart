import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_event.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_state.dart';
import 'package:nasa_apod/src/core/errors/errors_handler.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';
import 'package:nasa_apod/src/core/messaging/message_dto.dart';
import 'package:nasa_apod/src/core/messaging/message_type.dart';
import 'package:nasa_apod/src/data/managers/logger/log_manager.dart';
import 'package:nasa_apod/src/utils/elvis.dart';
import 'package:nasa_apod/values/l10n/gen/translation.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends Bloc<E, S> {
  BaseBloc(this.translation, super.initialState) {
    initTransformers();
    onCreated();
  }

  late final ErrorsHandler _errorHandler = ErrorsHandler();

  late final PublishSubject<MessageDto> messageSubject =
      PublishSubject<MessageDto>();

  @protected
  final Translation translation;

  @protected
  void initTransformers();

  @protected
  void onCreated();

  @protected
  ParsedError handleError(final dynamic err, final StackTrace stackTrace) {
    LogManager().log(err, stackTrace);
    final ParsedError parsedError = _errorHandler.parse(translation, err);
    return parsedError;
  }

  @protected
  String getLanguageForAPI() {
    return translation.localeName;
  }

  @override
  void add(final E event) {
    if (isClosed.not()) {
      super.add(event);
    }
  }

  void showSuccessMessage(final String msg) {
    messageSubject.add(
      MessageDto(
        message: msg,
        type: MessageType.success,
      ),
    );
  }

  void showInfoMessage(final String msg) {
    messageSubject.add(
      MessageDto(
        message: msg,
        type: MessageType.info,
      ),
    );
  }

  void showWarningMessage(final String msg) {
    messageSubject.add(
      MessageDto(
        message: msg,
        type: MessageType.warning,
      ),
    );
  }

  void showErrorMessage(final String msg) {
    messageSubject.add(
      MessageDto(
        message: msg,
        type: MessageType.error,
      ),
    );
  }

  @override
  Future<void> close() {
    messageSubject.close().ignore();
    return super.close();
  }
}

extension BlocExtensions on BuildContext {
  T read<T extends BaseBloc>() {
    return BlocProvider.of<T>(this, listen: false);
  }
}
