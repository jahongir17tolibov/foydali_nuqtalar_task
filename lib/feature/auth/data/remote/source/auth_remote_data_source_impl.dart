import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:foydali_nuqtalar_task/core/base/result_handle.dart';
import 'package:foydali_nuqtalar_task/core/constants/api_constants.dart';
import 'package:foydali_nuqtalar_task/core/provider/remote/api_client.dart';
import 'package:foydali_nuqtalar_task/core/provider/remote/dio_exception_handler.dart';
import 'package:foydali_nuqtalar_task/feature/auth/data/remote/auth_remote_data_source.dart';
import 'package:foydali_nuqtalar_task/feature/auth/data/remote/dto/auth_dto.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<Result<AuthDto>> loginUser(String email, String password) async {
    AuthDto authDto;
    try {
      authDto = await _apiClient.post(
        ApiConstants.loginUrl,
        options: Options(headers: _apiClient.postOption),
        data: {
          'email': email,
          'password': password,
        },
      ).then((response) => AuthDto.fromJson(response));
    } on DioException catch (e, st) {
      debugPrintStack(stackTrace: st);
      final DioExceptionHandler exceptionHandler = DioExceptionHandler.fromDioError(e);
      throw Exception(e);
      return Result(errorMessage: exceptionHandler.errorMessage);
    }
    return Result(data: authDto);
  }

  @override
  Future<Result<AuthDto>> registerUser(String fullName, String email, String password) async {
    AuthDto authDto;
    try {
      authDto = await _apiClient.post(
        ApiConstants.registerUrl,
        options: Options(headers: _apiClient.postOption),
        data: {
          'full_name': fullName,
          'email': email,
          'password': password,
        },
      ).then((response) => AuthDto.fromJson(response));
    } on DioException catch (e, st) {
      debugPrintStack(stackTrace: st);
      final DioExceptionHandler exceptionHandler = DioExceptionHandler.fromDioError(e);
      return Result(errorMessage: exceptionHandler.errorMessage);
    }
    return Result(data: authDto);
  }
}
