import 'package:flutter/material.dart';
import 'package:mdmottu/features/home/presenter/home_screen.dart';
import 'package:mdmottu/features/splash/presenter/splash_screen.dart';

import '../features/debug_view/pages/view_logs.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static Map<String, Widget Function(BuildContext)> routes() => {
        Routes.splash: (context) => const SplashScreen(),
        Routes.home: (context) => const HomeScreen(),
        Routes.logs: (context) => const ViewLogs(),
      };
}
