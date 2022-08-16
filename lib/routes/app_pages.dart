import 'package:flutter/material.dart';

import '../features/debug_view/pages/view_logs.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static Map<String, Widget Function(BuildContext)> routes() => {
        Routes.splash: (context) => const ViewLogs(),
        Routes.logs: (context) => const ViewLogs(),

      };
}
