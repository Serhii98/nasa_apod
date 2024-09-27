import 'package:meta/meta.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_state.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';
import 'package:nasa_apod/src/ui/apod_details/data/apod_detials_dto.dart';

/// {@template temp_state_placeholder}
/// Entity placeholder for State
/// {@endtemplate}
typedef BlocData = ApodDetailsDto;

sealed class ApodDetailsBlocState extends _ApodDetailsBlocStateBase {
  /// Idling state
  /// {@macro temp_state}
  const factory ApodDetailsBlocState.idle({
    required BlocData? data,
    ParsedError? parsedError,
  }) = ApodDetailsBlocStateIdle;

  /// Loading
  /// {@macro temp_state}
  const factory ApodDetailsBlocState.loading({
    required BlocData? data,
    ParsedError? parsedError,
  }) = ApodDetailsBlocStateLoading;

  /// Processing
  /// {@macro temp_state}
  const factory ApodDetailsBlocState.processing({
    required BlocData? data,
    ParsedError? parsedError,
  }) = ApodDetailsBlocStateProcessing;

  /// Successful
  /// {@macro temp_state}
  const factory ApodDetailsBlocState.successful({
    required BlocData? data,
    ParsedError? parsedError,
  }) = ApodDetailsBlocStateSuccessful;

  /// An error has occurred
  /// {@macro temp_state}
  const factory ApodDetailsBlocState.error({
    required BlocData? data,
    required ParsedError? parsedError,
  }) = ApodDetailsBlocStateError;

  /// {@macro temp_state}
  const ApodDetailsBlocState({required super.data, required super.parsedError});
}

/// Idling state
/// {@nodoc}
final class ApodDetailsBlocStateIdle extends ApodDetailsBlocState
    with _ApodDetailsBlocState {
  /// {@nodoc}
  const ApodDetailsBlocStateIdle({required super.data, super.parsedError});
}

/// Loading
/// {@nodoc}
final class ApodDetailsBlocStateLoading extends ApodDetailsBlocState
    with _ApodDetailsBlocState {
  /// {@nodoc}
  const ApodDetailsBlocStateLoading({required super.data, super.parsedError});
}

/// Processing
/// {@nodoc}
final class ApodDetailsBlocStateProcessing extends ApodDetailsBlocState
    with _ApodDetailsBlocState {
  /// {@nodoc}
  const ApodDetailsBlocStateProcessing(
      {required super.data, super.parsedError});
}

/// Successful
/// {@nodoc}
final class ApodDetailsBlocStateSuccessful extends ApodDetailsBlocState
    with _ApodDetailsBlocState {
  /// {@nodoc}
  const ApodDetailsBlocStateSuccessful(
      {required super.data, super.parsedError});
}

/// Error
/// {@nodoc}
final class ApodDetailsBlocStateError extends ApodDetailsBlocState
    with _ApodDetailsBlocState {
  /// {@nodoc}
  const ApodDetailsBlocStateError(
      {required super.data, required super.parsedError});
}

/// {@nodoc}
base mixin _ApodDetailsBlocState on ApodDetailsBlocState {}

/// Pattern matching for [ApodDetailsBlocState].
typedef ApodDetailsBlocStateMatch<R, S extends ApodDetailsBlocState> = R
    Function(S state);

/// {@nodoc}
@immutable
abstract base class _ApodDetailsBlocStateBase extends BaseBlocState {
  /// {@nodoc}
  const _ApodDetailsBlocStateBase(
      {required this.data, required this.parsedError});

  /// Data entity payload.
  @nonVirtual
  final BlocData? data;

  /// Message or state description.
  @nonVirtual
  final ParsedError? parsedError;

  /// Has data?
  bool get hasData => data != null;

  /// If an error has occurred?
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  /// Is in processing state?
  bool get isProcessing =>
      maybeMap<bool>(orElse: () => false, processing: (_) => true);

  /// Is in loading state?
  bool get isLoading =>
      maybeMap<bool>(orElse: () => false, loading: (_) => true);

  /// Is in idle state?
  bool get isIdling => !isProcessing && !isLoading;

  /// Pattern matching for [ApodDetailsBlocState].
  R map<R>({
    required ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateIdle> idle,
    required ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateLoading> loading,
    required ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateProcessing>
        processing,
    required ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateSuccessful>
        successful,
    required ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateError> error,
  }) =>
      switch (this) {
        ApodDetailsBlocStateIdle s => idle(s),
        ApodDetailsBlocStateLoading s => loading(s),
        ApodDetailsBlocStateProcessing s => processing(s),
        ApodDetailsBlocStateSuccessful s => successful(s),
        ApodDetailsBlocStateError s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [ApodDetailsBlocState].
  R maybeMap<R>({
    ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateIdle>? idle,
    ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateLoading>? loading,
    ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateProcessing>? processing,
    ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateSuccessful>? successful,
    ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateError>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        loading: loading ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [ApodDetailsBlocState].
  R? mapOrNull<R>({
    ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateIdle>? idle,
    ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateLoading>? loading,
    ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateProcessing>? processing,
    ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateSuccessful>? successful,
    ApodDetailsBlocStateMatch<R, ApodDetailsBlocStateError>? error,
  }) =>
      map<R?>(
        idle: idle ?? (_) => null,
        loading: loading ?? (_) => null,
        processing: processing ?? (_) => null,
        successful: successful ?? (_) => null,
        error: error ?? (_) => null,
      );

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other);
}
