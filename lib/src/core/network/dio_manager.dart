import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer2/dio_flutter_transformer2.dart';
import 'package:flutter/foundation.dart';
import 'package:nasa_apod/constants/app_strings.dart';
import 'package:nasa_apod/environment.dart';
import 'package:nasa_apod/src/core/network/platfrom_iterceptor.dart';
import 'package:nasa_apod/src/core/network/token_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Timeout of API call
const Duration timeout = Duration(seconds: 25);
const Duration receiveTimeout = Duration(seconds: 25);

const String dataArg = "data";
const String errorArg = "error";

/// Class that makes API call easier
final class DioManager {
  DioManager._internal();

  factory DioManager() => _singleton;

  ///Do not change
  static String _baseURL = AppStrings.emptyString;
  final Dio dio = Dio();
  final Dio dioIsolated = Dio();

  static final DioManager _singleton = DioManager._internal();

  static void configure() {
    _baseURL = Environment.fromEnv().backendUrl;
    _singleton.dio.options
      ..baseUrl = _baseURL
      ..connectTimeout = timeout
      ..sendTimeout = timeout
      ..receiveTimeout = receiveTimeout;

    _singleton.dioIsolated.options = _singleton.dio.options;
    _singleton.dioIsolated.transformer = FlutterTransformer();

    _singleton.dio.interceptors.add(TokenInterceptor());
    _singleton.dio.interceptors.add(PlatformInterceptor());
    _singleton.dioIsolated.interceptors.add(TokenInterceptor());
    _singleton.dioIsolated.interceptors.add(PlatformInterceptor());
    if (!kReleaseMode) {
      _singleton.dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: false,
          responseBody: true,
        ),
      );
      _singleton.dioIsolated.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: false,
          responseBody: true,
        ),
      );
    }
  }

  /// DIO GET
  /// take [url], concrete route
  Future<Response> get(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? json,
  }) =>
      dio.get(url, queryParameters: json, options: Options(headers: headers));

  /// DIO GET and map response in isolate
  /// take [url], concrete route
  Future<Response> getIsolated(
    final String url, {
    final Map<String, dynamic>? headers,
    final Map<String, dynamic>? json,
  }) =>
      dioIsolated.get(
        url,
        queryParameters: json,
        options: Options(headers: headers),
      );

  /// DIO POST
  /// take [url], concrete route
  Future<Response> post(
    final String url, {
    final Map<String, dynamic>? headers,
    final dynamic body,
  }) {
    return dio.post(url, data: body, options: Options(headers: headers));
  }

  /// DIO POST and map response in isolate
  /// take [url], concrete route
  Future<Response> postIsolated(
    final String url, {
    final Map<String, dynamic>? headers,
    final dynamic body,
  }) {
    return dioIsolated.post(
      url,
      data: body,
      options: Options(headers: headers),
    );
  }

  /// DIO PUT
  /// take [url], concrete route
  Future<Response> put(
    final String url, {
    final dynamic body,
    final Options? options,
  }) {
    return dio.put(url, data: body, options: options);
  }

  /// DIO PUT and map response in isolate
  /// take [url], concrete route
  Future<Response> putIsolated(
    final String url, {
    final dynamic body,
    final Options? options,
  }) {
    return dioIsolated.put(url, data: body, options: options);
  }

  /// DIO PATCH
  /// take [url], concrete route
  Future<Response> patch(
    final String url, {
    final dynamic body,
    final Options? options,
  }) {
    return dio.patch(url, data: body, options: options);
  }

  /// DIO PATCH and map response in isolate
  /// take [url], concrete route
  Future<Response> patchIsolated(
    final String url, {
    final dynamic body,
    final Options? options,
  }) {
    return dioIsolated.patch(url, data: body, options: options);
  }

  /// DIO DELETE
  /// take [url], concrete route
  Future<Response> delete(
    final String url, {
    final Map<String, dynamic>? headers,
    final dynamic body,
  }) {
    return dio.delete(url, data: body, options: Options(headers: headers));
  }

  /// DIO DELETE and map response in isolate
  /// take [url], concrete route
  Future<Response> deleteIsolated(
    final String url, {
    final Map<String, dynamic>? headers,
    final dynamic body,
  }) {
    return dioIsolated.delete(
      url,
      data: body,
      options: Options(headers: headers),
    );
  }
}
