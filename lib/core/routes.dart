import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../features/helper/route_not_found_screen.dart';

void configureRoutes() {
  final router = GetIt.I<FluroRouter>();
  router.notFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const RouteNotFoundPage();
    },
  );
}
