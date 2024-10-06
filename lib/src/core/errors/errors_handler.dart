import 'package:dio/dio.dart';
import 'package:nasa_apod/src/core/errors/error_type.dart';
import 'package:nasa_apod/src/core/errors/parsed_error.dart';
import 'package:nasa_apod/src/utils/errors/network_errors.dart';
import 'package:nasa_apod/values/l10n/gen/translation.dart';

final class ErrorsHandler {
  ParsedError _parseDioError(
    final Translation translation,
    final DioException exception,
  ) {
    final dynamic data = exception.response?.data;
    if (exception.response?.statusCode == 429) {
      return ParsedError(
        displayMessage: translation.serverOverloadedMsg,
        errorType: ErrorType.other,
      );
    }
    if (exception.response?.statusCode == 400) {
      return ParsedError(
        displayMessage: "Bad request",
        errorType: ErrorType.other,
      );
    }
    if (data == null) {
      return ParsedError(
        displayMessage: translation.unexpectedError,
        errorType: ErrorType.other,
      );
    }
    return ParsedError(
      displayMessage: translation.unexpectedError,
      errorType: ErrorType.other,
    );
  }

  ParsedError parse(final Translation translation, final dynamic error) {
    if (isInternetException(error)) {
      return ParsedError(
        displayMessage: translation.noInternetError,
        errorType: ErrorType.network,
      );
    }
    if (error is DioException) {
      return _parseDioError(translation, error);
    }
    return ParsedError(
      displayMessage: translation.unexpectedError,
      errorType: ErrorType.other,
    );
  }
}
