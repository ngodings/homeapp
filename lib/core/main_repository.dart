import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:homeapp/services/app_service.dart';
import 'package:homeapp/utils/string.dart';

import '../services/navigation_service.dart';
import '../utils/name_routes.dart';

class MainRepository {
  MainRepository() {
    _init();
  }
}

_init() async {
  Dio dio = _setupDio('id');
  AppService.initializeConfig(dio);
//for any logic if there's login
  GetIt.I<NavigationServiceMain>().pushNamed(AppRoutes.homePage);
}

Dio _setupDio(String lang) {
  BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 8000,
      receiveTimeout: 8000,
      sendTimeout: 8000,
      headers: {
        'accept': 'application/json',
        'X-Localization': lang,
      });

  Dio dio = Dio(options);

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    request: true,
    requestBody: true,
    // requestHeader: true,
    // responseHeader: true,
  ));

  return dio;
}
