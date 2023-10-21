import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:travel_c/infrastructure/logger/logger.dart';

class LogInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String headerMessage = "";
    options.headers.forEach((k, v) => headerMessage += '► $k: $v\n');
    String queryParameters = "";
    options.queryParameters.forEach((k, v) => queryParameters += '► $k: $v\n');
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final String prettyJson = encoder.convert(options.data);
    Log.info(
      "API Request: onRequest info",
      // ignore: unnecessary_null_comparison
      "REQUEST ► ︎ ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"${options.baseUrl}${options.path}"}\n\n"
          "❖ Headers:\n"
          "$headerMessage\n"
          "❖ QueryParameters : \n"
          "$queryParameters\n"
          "❖ Body: $prettyJson",
    );
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    Log.error(
      "API Request: onError message",
      "◀ ERROR ${err.message} ${err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL'}\n\n"
          "${err.response != null ? err.response!.data : 'Unknown Error'}",
    );
    super.onError(err, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    String headerMessage = "";
    response.headers.forEach((k, v) => headerMessage += '► $k: $v\n');
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final String prettyJson = encoder.convert(response.data);
    Log.info(
      "API Request: onResponse info",
      // ignore: unnecessary_null_comparison
      "◀ ︎RESPONSE ${response.statusCode} ${response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL'}\n\n"
          "❖ Headers:\n"
          "$headerMessage\n"
          "❖ Results : \n"
          "❖ Response: $prettyJson",
    );
    super.onResponse(response, handler);
  }
}
