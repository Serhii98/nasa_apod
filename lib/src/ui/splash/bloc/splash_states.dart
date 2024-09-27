import 'package:auto_route/auto_route.dart';
import 'package:meta/meta.dart';
import 'package:nasa_apod/src/core/bloc/base_bloc_state.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';

/// {@template temp_state_placeholder}
/// Entity placeholder for State
/// {@endtemplate}
typedef BlocData = PageRouteInfo;

sealed class SplashBlocState extends _SplashBlocStateBase {
  /// Idling state
  /// {@macro temp_state}
  const factory SplashBlocState.idle({
    required final BlocData? data,
    final ParsedError? parsedError,
  }) = SplashBlocStateIdle;

  /// Loading
  /// {@macro temp_state}
  const factory SplashBlocState.loading({
    required final BlocData? data,
    final ParsedError? parsedError,
  }) = SplashBlocStateLoading;

  /// Processing
  /// {@macro temp_state}
  const factory SplashBlocState.processing({
    required final BlocData? data,
    final ParsedError? parsedError,
  }) = SplashBlocStateProcessing;

  /// Successful
  /// {@macro temp_state}
  const factory SplashBlocState.successful({
    required final BlocData? data,
    final ParsedError? parsedError,
  }) = SplashBlocStateSuccessful;

  /// An error has occurred
  /// {@macro temp_state}
  const factory SplashBlocState.error({
    required final BlocData? data,
    required final ParsedError? parsedError,
  }) = SplashBlocStateError;

  /// {@macro temp_state}
  const SplashBlocState({required super.data, required super.parsedError});
}

/// Idling state
/// {@nodoc}
final class SplashBlocStateIdle extends SplashBlocState with _SplashBlocState {
  /// {@nodoc}
  const SplashBlocStateIdle({required super.data, super.parsedError});
}

/// Loading
/// {@nodoc}
final class SplashBlocStateLoading extends SplashBlocState
    with _SplashBlocState {
  /// {@nodoc}
  const SplashBlocStateLoading({required super.data, super.parsedError});
}

/// Processing
/// {@nodoc}
final class SplashBlocStateProcessing extends SplashBlocState
    with _SplashBlocState {
  /// {@nodoc}
  const SplashBlocStateProcessing({required super.data, super.parsedError});
}

/// Successful
/// {@nodoc}
final class SplashBlocStateSuccessful extends SplashBlocState
    with _SplashBlocState {
  /// {@nodoc}
  const SplashBlocStateSuccessful({required super.data, super.parsedError});
}

/// Error
/// {@nodoc}
final class SplashBlocStateError extends SplashBlocState with _SplashBlocState {
  /// {@nodoc}
  const SplashBlocStateError({required super.data, required super.parsedError});
}

/// {@nodoc}
base mixin _SplashBlocState on SplashBlocState {}

/// Pattern matching for [SplashBlocState].
typedef SplashBlocStateMatch<R, S extends SplashBlocState> = R Function(
    S state,);

/// {@nodoc}
@immutable
abstract base class _SplashBlocStateBase extends BaseBlocState {
  /// {@nodoc}
  const _SplashBlocStateBase({required this.data, required this.parsedError});

  /// Data entity payload.
  @nonVirtual
  final BlocData? data;

  /// Message or state description.
  @nonVirtual
  final ParsedError? parsedError;

  /// Has data?
  bool get hasData => data != null;

  /// If an error has occurred?
  bool get hasError => maybeMap<bool>(orElse: () => false, error: (final _) => true);

  /// Is in processing state?
  bool get isProcessing =>
      maybeMap<bool>(orElse: () => false, processing: (final _) => true);

  /// Is in loading state?
  bool get isLoading =>
      maybeMap<bool>(orElse: () => false, loading: (final _) => true);

  /// Is in idle state?
  bool get isIdling => !isProcessing && !isLoading;

  /// Pattern matching for [SplashBlocState].
  R map<R>({
    required final SplashBlocStateMatch<R, SplashBlocStateIdle> idle,
    required final SplashBlocStateMatch<R, SplashBlocStateLoading> loading,
    required final SplashBlocStateMatch<R, SplashBlocStateProcessing> processing,
    required final SplashBlocStateMatch<R, SplashBlocStateSuccessful> successful,
    required final SplashBlocStateMatch<R, SplashBlocStateError> error,
  }) =>
      switch (this) {
        final SplashBlocStateIdle s => idle(s),
        final SplashBlocStateLoading s => loading(s),
        final SplashBlocStateProcessing s => processing(s),
        final SplashBlocStateSuccessful s => successful(s),
        final SplashBlocStateError s => error(s),
        _ => throw AssertionError(),
      };

  /// Pattern matching for [SplashBlocState].
  R maybeMap<R>({
    required final R Function() orElse, final SplashBlocStateMatch<R, SplashBlocStateIdle>? idle,
    final SplashBlocStateMatch<R, SplashBlocStateLoading>? loading,
    final SplashBlocStateMatch<R, SplashBlocStateProcessing>? processing,
    final SplashBlocStateMatch<R, SplashBlocStateSuccessful>? successful,
    final SplashBlocStateMatch<R, SplashBlocStateError>? error,
  }) =>
      map<R>(
        idle: idle ?? (final _) => orElse(),
        loading: loading ?? (final _) => orElse(),
        processing: processing ?? (final _) => orElse(),
        successful: successful ?? (final _) => orElse(),
        error: error ?? (final _) => orElse(),
      );

  /// Pattern matching for [SplashBlocState].
  R? mapOrNull<R>({
    final SplashBlocStateMatch<R, SplashBlocStateIdle>? idle,
    final SplashBlocStateMatch<R, SplashBlocStateLoading>? loading,
    final SplashBlocStateMatch<R, SplashBlocStateProcessing>? processing,
    final SplashBlocStateMatch<R, SplashBlocStateSuccessful>? successful,
    final SplashBlocStateMatch<R, SplashBlocStateError>? error,
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
