import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../features/helper/toast_helper.dart';
import '../utils/string.dart';
import 'base_response.dart';

class ExceptionHelper<T> {
  final DioError e;
  ExceptionHelper(this.e);

  Future<BaseResponse<T>> catchException() async {
    String message = '';
    // ignore: unused_local_variable
    int statusCode = 0;

    await Sentry.captureException(e, stackTrace: e.stackTrace);

    switch (e.type) {
      case DioErrorType.connectTimeout:
        message = kConnectionTimeout;
        statusCode = 500;
        break;
      case DioErrorType.sendTimeout:
        message = kConnectionTimeout;
        statusCode = 500;

        break;
      case DioErrorType.receiveTimeout:
        message = kConnectionTimeout;
        statusCode = 500;

        break;
      case DioErrorType.response:
        if (e.response == null) {
          return BaseResponse(
            message: kErrorCantReachServer,
          );
        }

        final eResponse = e.response!;
        showWarningTopFlash(eResponse.data['message'].toString());
        final statusCode = eResponse.statusCode;
        message = eResponse.data['message'].toString();

        if (statusCode == 422) {
          message = eResponse.data['message'].toString();
          showWarningTopFlash(message);
        } else if (statusCode == 401) {
          message = eResponse.data['message'].toString();

          showWarningTopFlash(message);
        } else {
          message = eResponse.data['message'].toString();
          showWarningTopFlash(message);
          // tak tambahi
          return BaseResponse(
            message: message,
            data: eResponse.data,
          );
        }

        break;
      case DioErrorType.cancel:
        message = kErrorException;
        statusCode = 500;

        break;
      case DioErrorType.other:
        if (e.error is SocketException) {
          message = kNoInternetConnection;
        } else {
          message = e.message;
        }
        statusCode = 500;

        break;
    }

    return BaseResponse(
      message: message,
      data:
          e.response?.data['message'] ?? e.response?.data['message'].toString(),
    );
  }
}
