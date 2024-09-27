import 'package:meta/meta.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_state.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';
import 'package:nasa_apod/src/ui/home/data/home_bloc_dto.dart';

/// {@template temp_state_placeholder}
/// Entity placeholder for State
/// {@endtemplate}
typedef BlocData = HomeBlocDto;

sealed class HomeBlocState extends _HomeBlocStateBase {
  /// Idling state
  /// {@macro temp_state}
  const factory HomeBlocState.idle({
    required BlocData? data,
    ParsedError? parsedError,
  }) = HomeBlocStateIdle;

  /// Loading
  /// {@macro temp_state}
  const factory HomeBlocState.loading({
    required BlocData? data,
    ParsedError? parsedError,
  }) = HomeBlocStateLoading;

  /// Processing
  /// {@macro temp_state}
  const factory HomeBlocState.processing({
    required BlocData? data,
    ParsedError? parsedError,
  }) = HomeBlocStateProcessing;

  /// Successful
  /// {@macro temp_state}
  const factory HomeBlocState.successful({
    required BlocData? data,
    ParsedError? parsedError,
  }) = HomeBlocStateSuccessful;

  /// An error has occurred
  /// {@macro temp_state}
  const factory HomeBlocState.error({
    required BlocData? data,
    required ParsedError? parsedError,
  }) = HomeBlocStateError;

  /// {@macro temp_state}
  const HomeBlocState({required super.data, required super.parsedError});
}

/// Idling state
/// {@nodoc}
final class HomeBlocStateIdle extends HomeBlocState with _HomeBlocState {
  /// {@nodoc}
  const HomeBlocStateIdle({required super.data, super.parsedError});
}

/// Loading
/// {@nodoc}
final class HomeBlocStateLoading extends HomeBlocState with _HomeBlocState {
  /// {@nodoc}
  const HomeBlocStateLoading({required super.data, super.parsedError});
}

/// Processing
/// {@nodoc}
final class HomeBlocStateProcessing extends HomeBlocState with _HomeBlocState {
  /// {@nodoc}
  const HomeBlocStateProcessing({required super.data, super.parsedError});
}

/// Successful
/// {@nodoc}
final class HomeBlocStateSuccessful extends HomeBlocState with _HomeBlocState {
  /// {@nodoc}
  const HomeBlocStateSuccessful({required super.data, super.parsedError});
}

/// Error
/// {@nodoc}
final class HomeBlocStateError extends HomeBlocState with _HomeBlocState {
  /// {@nodoc}
  const HomeBlocStateError({required super.data, required super.parsedError});
}

/// {@nodoc}
base mixin _HomeBlocState on HomeBlocState {}

/// Pattern matching for [HomeBlocState].
typedef HomeBlocStateMatch<R, S extends HomeBlocState> = R Function(S state);

/// {@nodoc}
@immutable
abstract base class _HomeBlocStateBase extends BaseBlocState {
  /// {@nodoc}
  const _HomeBlocStateBase({required this.data, required this.parsedError});

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

  /// Pattern matching for [HomeBlocState].
  R map<R>({
    required HomeBlocStateMatch<R, HomeBlocStateIdle> idle,
    required HomeBlocStateMatch<R, HomeBlocStateLoading> loading,
    required HomeBlocStateMatch<R, HomeBlocStateProcessing> processing,
    required HomeBlocStateMatch<R, HomeBlocStateSuccessful> successful,
    required HomeBlocStateMatch<R, HomeBlocStateError> error,
  }) =>
      switch (this) {
        HomeBlocStateIdle s => idle(s),
        HomeBlocStateLoading s => loading(s),
        HomeBlocStateProcessing s => processing(s),
        HomeBlocStateSuccessful s => successful(s),
        HomeBlocStateError s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [HomeBlocState].
  R maybeMap<R>({
    HomeBlocStateMatch<R, HomeBlocStateIdle>? idle,
    HomeBlocStateMatch<R, HomeBlocStateLoading>? loading,
    HomeBlocStateMatch<R, HomeBlocStateProcessing>? processing,
    HomeBlocStateMatch<R, HomeBlocStateSuccessful>? successful,
    HomeBlocStateMatch<R, HomeBlocStateError>? error,
    required R Function() orElse,
  }) =>
      map<R>(
        idle: idle ?? (_) => orElse(),
        loading: loading ?? (_) => orElse(),
        processing: processing ?? (_) => orElse(),
        successful: successful ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );

  /// Pattern matching for [HomeBlocState].
  R? mapOrNull<R>({
    HomeBlocStateMatch<R, HomeBlocStateIdle>? idle,
    HomeBlocStateMatch<R, HomeBlocStateLoading>? loading,
    HomeBlocStateMatch<R, HomeBlocStateProcessing>? processing,
    HomeBlocStateMatch<R, HomeBlocStateSuccessful>? successful,
    HomeBlocStateMatch<R, HomeBlocStateError>? error,
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
