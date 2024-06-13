import 'package:dio/dio.dart';
import 'package:foydali_nuqtalar_task/core/base/base_functions.dart';
import 'package:foydali_nuqtalar_task/core/constants/api_constants.dart';
import 'package:path/path.dart';

class ApiClient {
  Dio get getDio => Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        contentType: 'application/json',
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
      ));

  final Map<String, String> postOption = const {
    'accept': 'application/json',
    'Content-Type': 'application/json',
    'X-CSRFTOKEN': ApiConstants.csrfToken,
  };

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await getDio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    if (response.statusCode == 200) {
      return response.data;
    }
    throw response.statusCode.toString();
  }

  Future<Map<String, dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    printOnDebug('$path');
    final Response response = await getDio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    printOnDebug('$path: ${response.statusCode} and ${response.data}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    }
    throw response.statusCode.toString();
  }

  Future<Map<String, dynamic>> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await getDio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    if (response.statusCode == 200) {
      return response.data;
    }
    throw response.statusCode.toString();
  }

  ///Delete Method
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Response response = await getDio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    if (response.statusCode == 204) {
      return response.data;
    }
    throw response.statusCode.toString();
  }
}
