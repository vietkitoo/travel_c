import 'package:dio/dio.dart';
import 'package:travel_c/infrastructure/client/app_interceptor.dart';
import 'package:travel_c/infrastructure/client/log_interceptor.dart';

class DioClient {
  DioClient._();

  static final DioClient _instance = DioClient._();

  factory DioClient() => _instance;

  static Dio dio = Dio();

  static initialize() {
    dio.options.baseUrl = "http://172.17.24.37:4000/"; //"http://127.0.0.1:8000/fetch"
    dio.interceptors.add(AppInterceptors());
    dio.interceptors.add(LogInterceptors());
  }

  Future<Response> requestGet(
    final String path, {
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data ?? <String, dynamic>{},
        queryParameters: queryParameters ?? <String, dynamic>{},
        options: options,
      );

      final int statusCode = response.statusCode ?? 0;
      if (statusCode < 200 || statusCode > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }
  
  Future<Response> requestPost(
    final String path, {
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data ?? <String, dynamic>{},
        queryParameters: queryParameters ?? <String, dynamic>{},
        options: options,
      );

      final int statusCode = response.statusCode ?? 0;
      if (statusCode < 200 || statusCode > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
