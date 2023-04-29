import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:homeapp/services/navigation_service.dart';

class AppService {
  final serviceLocator = GetIt.instance;
  static void initialize() {
    GetIt.I.registerSingleton<NavigationServiceMain>(NavigationServiceMain());
    GetIt.I.registerSingleton<FluroRouter>(FluroRouter());
    GetIt.I
        .registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  }

  static void initializeConfig(Dio dio) {
    GetIt.I.registerSingleton<Dio>(dio);
  }
}
