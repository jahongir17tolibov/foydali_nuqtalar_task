import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:foydali_nuqtalar_task/core/base/base_functions.dart';
import 'package:foydali_nuqtalar_task/core/constants/api_constants.dart';
import 'package:foydali_nuqtalar_task/core/provider/remote/api_client.dart';
import 'package:foydali_nuqtalar_task/feature/home/data/dto/get_books_result.dart';

class RemoteDataSource {
  RemoteDataSource({required ApiClient client}) : _client = client;

  final ApiClient _client;

  Future<GetBooksResult> getBookContent() async {
    try {
      return await _client
          .get(ApiConstants.getBooksUrl, options: Options(headers: {'accept': 'application/json'}))
          .then((response) {
        return GetBooksResult.fromJson(response);
      });
    } on DioException catch (e, str) {
      printOnDebug(e.toString());
      debugPrintStack(stackTrace: str);
      return const GetBooksResult();
    }
  }
}
