import 'dart:isolate';
import 'package:flutter/foundation.dart';

Future<R> runIsolatedPlatform<R>(final Future<R> Function() computation) {
  if (kIsWeb) return computation();
  return Isolate.run(() => computation());
}
