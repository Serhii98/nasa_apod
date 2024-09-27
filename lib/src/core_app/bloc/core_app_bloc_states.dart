import 'package:meta/meta.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_state.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';
import 'package:nasa_apod/src/core_app/data/core_app_bloc_dto.dart';

/// {@template temp_state_placeholder}
/// Entity placeholder for State
/// {@endtemplate}
typedef BlocData = CoreAppBlocDto;

sealed class CoreAppBlocState extends _CoreAppBlocStateBase {
  /// Idling state
  /// {@macro temp_state}
  const factory CoreAppBlocState.idle({
    required final BlocData? data,
    final ParsedError? parsedError,
  }) = CoreAppBlocStateIdle;

  /// Loading
  /// {@macro temp_state}
  const factory CoreAppBlocState.loading({
    required final BlocData? data,
    final ParsedError? parsedError,
  }) = CoreAppBlocStateLoading;

  /// Processing
  /// {@macro temp_state}
  const factory CoreAppBlocState.processing({
    required final BlocData? data,
    final ParsedError? parsedError,
  }) = CoreAppBlocStateProcessing;

  /// Successful
  /// {@macro temp_state}
  const factory CoreAppBlocState.successful({
    required final BlocData? data,
    final ParsedError? parsedError,
  }) = CoreAppBlocStateSuccessful;

  /// An error has occurred
  /// {@macro temp_state}
  const factory CoreAppBlocState.error({
    required final BlocData? data,
    required final ParsedError? parsedError,
  }) = CoreAppBlocStateError;

  /// {@macro temp_state}
  const CoreAppBlocState({required super.data, required super.parsedError});
}

/// Idling state
final class CoreAppBlocStateIdle extends CoreAppBlocState
    with _CoreAppBlocState {
  const CoreAppBlocStateIdle({required super.data, super.parsedError});
}

/// Loading
final class CoreAppBlocStateLoading extends CoreAppBlocState
    with _CoreAppBlocState {
  const CoreAppBlocStateLoading({required super.data, super.parsedError});
}

/// Processing
final class CoreAppBlocStateProcessing extends CoreAppBlocState
    with _CoreAppBlocState {
  const CoreAppBlocStateProcessing({required super.data, super.parsedError});
}

/// Successful
final class CoreAppBlocStateSuccessful extends CoreAppBlocState
    with _CoreAppBlocState {
  const CoreAppBlocStateSuccessful({required super.data, super.parsedError});
}

/// Error
final class CoreAppBlocStateError extends CoreAppBlocState
    with _CoreAppBlocState {
  const CoreAppBlocStateError({
    required super.data,
    required super.parsedError,
  });
}

base mixin _CoreAppBlocState on CoreAppBlocState {}

/// Pattern matching for [CoreAppBlocState].
typedef CoreAppBlocStateMatch<R, S extends CoreAppBlocState> = R Function(
  S state,
);

@immutable
abstract base class _CoreAppBlocStateBase extends BaseBlocState {
  const _CoreAppBlocStateBase({required this.data, required this.parsedError});

  /// Data entity payload.
  @nonVirtual
  final BlocData? data;

  /// Message or state description.
  @nonVirtual
  final ParsedError? parsedError;

  /// Has data?
  bool get hasData => data != null;

  /// If an error has occurred?
  bool get hasError =>
      maybeMap<bool>(orElse: () => false, error: (final _) => true);

  /// Is in processing state?
  bool get isProcessing =>
      maybeMap<bool>(orElse: () => false, processing: (final _) => true);

  /// Is in loading state?
  bool get isLoading =>
      maybeMap<bool>(orElse: () => false, loading: (final _) => true);

  /// Is in idle state?
  bool get isIdling => !isProcessing && !isLoading;

  /// Pattern matching for [CoreAppBlocState].
  R map<R>({
    required final CoreAppBlocStateMatch<R, CoreAppBlocStateIdle> idle,
    required final CoreAppBlocStateMatch<R, CoreAppBlocStateLoading> loading,
    required final CoreAppBlocStateMatch<R, CoreAppBlocStateProcessing>
        processing,
    required final CoreAppBlocStateMatch<R, CoreAppBlocStateSuccessful>
        successful,
    required final CoreAppBlocStateMatch<R, CoreAppBlocStateError> error,
  }) =>
      switch (this) {
        final CoreAppBlocStateIdle s => idle(s),
        final CoreAppBlocStateLoading s => loading(s),
        final CoreAppBlocStateProcessing s => processing(s),
        final CoreAppBlocStateSuccessful s => successful(s),
        final CoreAppBlocStateError s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [CoreAppBlocState].
  R maybeMap<R>({
    required final R Function() orElse,
    final CoreAppBlocStateMatch<R, CoreAppBlocStateIdle>? idle,
    final CoreAppBlocStateMatch<R, CoreAppBlocStateLoading>? loading,
    final CoreAppBlocStateMatch<R, CoreAppBlocStateProcessing>? processing,
    final CoreAppBlocStateMatch<R, CoreAppBlocStateSuccessful>? successful,
    final CoreAppBlocStateMatch<R, CoreAppBlocStateError>? error,
  }) =>
      map<R>(
        idle: idle ?? (final _) => orElse(),
        loading: loading ?? (final _) => orElse(),
        processing: processing ?? (final _) => orElse(),
        successful: successful ?? (final _) => orElse(),
        error: error ?? (final _) => orElse(),
      );

  /// Pattern matching for [CoreAppBlocState].
  R? mapOrNull<R>({
    final CoreAppBlocStateMatch<R, CoreAppBlocStateIdle>? idle,
    final CoreAppBlocStateMatch<R, CoreAppBlocStateLoading>? loading,
    final CoreAppBlocStateMatch<R, CoreAppBlocStateProcessing>? processing,
    final CoreAppBlocStateMatch<R, CoreAppBlocStateSuccessful>? successful,
    final CoreAppBlocStateMatch<R, CoreAppBlocStateError>? error,
  }) =>
      map<R?>(
        idle: idle ?? (final _) => null,
        loading: loading ?? (final _) => null,
        processing: processing ?? (final _) => null,
        successful: successful ?? (final _) => null,
        error: error ?? (final _) => null,
      );

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(final Object other) => identical(this, other);
}
