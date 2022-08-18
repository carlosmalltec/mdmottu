import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app_debug.dart';
import 'app_prod.dart';
import 'features/auth/presenter/controllers/auth_controller.dart';
import 'features/debug_view/controllers/debug_view_controller.dart';
import 'features/home/presenter/controllers/home_controller.dart';
import 'features/splash/presenter/controllers/splash_controller.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  FlutterError.onError = (FlutterErrorDetails details) => FlutterError.dumpErrorToConsole(details);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runZonedGuarded(() {
    runApp(const MyApp());
  }, (e, s) {
    debugPrint(e.toString());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => DebugViewController()),
        ChangeNotifierProvider(create: (_) => AuthController()),

        // ChangeNotifierProvider<DebugViewController>.value(
        //     value: DebugViewController(),
        //     ),
      ],
      child: const Visibility(
        visible: kDebugMode,
        replacement: AppProd(),
        child: AppDebug(),
      ),
    );
  }
}
