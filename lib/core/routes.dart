import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../features/helper/route_not_found_screen.dart';
import '../features/homepage/home_screen.dart';
import '../utils/name_routes.dart';

void configureRoutes() {
  final router = GetIt.I<FluroRouter>();
  router.notFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const RouteNotFoundPage();
    },
  );

  router.define(
    AppRoutes.homePage,
    handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      // final args = context?.arguments != null
      //     ? context?.arguments as Map<String, dynamic>
      //     : null;
      return const HomeScreen();
    }),
    transitionType: TransitionType.fadeIn,
  );
}
