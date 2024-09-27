import 'package:logger/logger.dart';

final class LogManager {
  factory LogManager() {
    _instance ??= LogManager._internal();
    return _instance!;
  }

  LogManager._internal();

  static LogManager? _instance;

  late final Logger _logger = Logger();

  void log(final dynamic err, [final StackTrace? stackTrace]) async {
    if (err is Exception) {
      _logger.e(
        err.toString(),
        error: err,
        stackTrace: stackTrace,
      );
    } else if (err is Error) {
      _logger.e(
        err.toString(),
        error: err,
        stackTrace: stackTrace,
      );
    } else {
      _logger.e(err);
    }
  }
}
