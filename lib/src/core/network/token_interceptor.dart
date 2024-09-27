import 'package:dio/dio.dart';

final class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    // TODO: add bearer token or smth other
    return super.onRequest(options, handler);
  }

  @override
  void onError(
    final DioException err,
    final ErrorInterceptorHandler handler,
  ) async {
    //TODO: handle refreshing the token
    super.onError(err, handler);
  }
}
