import 'package:dio/dio.dart';

final class DataInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    // TODO: provide language header

    return super.onRequest(options, handler);
  }
}
