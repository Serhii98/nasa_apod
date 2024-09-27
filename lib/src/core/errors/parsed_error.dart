import 'package:nasa_apod/src/core/errors/display_mode.dart';
import 'package:nasa_apod/src/core/errors/error_type.dart';

class ParsedError {
  ParsedError({
    required this.displayMessage,
    required this.errorType,
    this.displayMode = DisplayMode.onlyMessage,
  });

  final String displayMessage;
  final DisplayMode displayMode;
  final ErrorType errorType;

  bool get showMessage =>
      displayMode == DisplayMode.onlyMessage ||
      displayMode == DisplayMode.refreshAndMessage;

  bool get showDialog => displayMode == DisplayMode.dialog;

  bool get showRefresh =>
      displayMode == DisplayMode.onlyRefresh ||
      displayMode == DisplayMode.refreshAndMessage;

  bool get isPageNotFound => errorType == ErrorType.pageNotFound;

  ParsedError copyWith({
    final String? displayMessage,
    final DisplayMode? displayMode,
    final ErrorType? errorType,
  }) {
    return ParsedError(
      displayMessage: displayMessage ?? this.displayMessage,
      displayMode: displayMode ?? this.displayMode,
      errorType: errorType ?? this.errorType,
    );
  }
}
