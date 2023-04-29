import 'dart:async';
import 'dart:developer';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeapp/features/splash/splash_screen.dart';
import 'package:homeapp/services/app_service.dart';
import 'package:homeapp/services/navigation_service.dart';
import 'package:homeapp/utils/theme.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0x19000000),
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AppService.initialize();
    configureRoutes();
  }

  @override
  Widget build(BuildContext context) {
    final serviceLocator = GetIt.instance;
    return ScreenUtilInit(
      // designSize: const Size(360, 640),
      builder: (context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [
          SentryNavigatorObserver(),
        ],
        navigatorKey: serviceLocator<NavigationServiceMain>().navigatorKey,
        onGenerateRoute: serviceLocator<FluroRouter>().generator,
        themeMode: ThemeMode.light,
        //  themeMode: currentTheme.currentTheme(),
        theme: ThemeData(
          fontFamily: GoogleFonts.inter().fontFamily,
          primaryColor: lightTheme.primary,
          secondaryHeaderColor: lightTheme.secondary,
          scaffoldBackgroundColor: lightTheme.background,
          brightness: lightTheme.brightness,
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          colorScheme: lightTheme.copyWith(background: lightTheme.background),
        ),

        home: const SplashScreen(),
      ),
    );
  }
}
