import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

final class PlatformInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    // TODO: provide mechanism for platform
    // options.headers["source"] = PlatformMethods.getPlatform();
    options.headers["app_version"] = (await PackageInfo.fromPlatform()).version;
    return super.onRequest(options, handler);
  }
}
