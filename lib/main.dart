import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mdmottu/dependency_injections/service_locator.dart';

import 'app_debug.dart';
import 'app_prod.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  ///Serviço de injeção
  ServiceLocator().setup();

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
    return const Visibility(
      visible: kDebugMode,
      replacement: AppProd(),
      child: AppDebug(),
    );
  }
}
