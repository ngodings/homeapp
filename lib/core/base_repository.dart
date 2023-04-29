import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:retry/retry.dart';

import 'base_response.dart';
import 'exception_handler.dart';

class BaseRepository {
  final Dio dio = GetIt.I<Dio>();
  Future<BaseResponse> get(
    String api, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await retry(
        () => dio.get(
          api,
          queryParameters: queryParams,
          options: Options(
            responseType: ResponseType.json,
          ),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      if (response.statusCode == 200) {
        return BaseResponse(
          statusCode: response.statusCode,
          message: response.data['message'],
          data: response.data['results'],
        );
      } else {
        return BaseResponse(
          statusCode: response.statusCode,
          message: response.data['message'],
          data: response.data['results'],
        );
      }
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }
}
