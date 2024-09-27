import 'package:flutter/services.dart';

bool isPermissionError(final dynamic err) {
  return err is PlatformException &&
      err.code.toLowerCase().contains("read_external_storage_denied");
}
