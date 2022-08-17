import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/responsive/orientation_layout.dart';
import '../../../core/responsive/screen_type_layout.dart';
import 'controllers/splash_controller.dart';
import 'pages/splash_phone.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      SplashController controller = context.watch<SplashController>();

    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: (context) =>  SplashPhone(controller: controller),
        landscape: (context) => SplashPhone(controller: controller),
      ),
      tablet: SplashPhone(controller: controller),
      desktop: SplashPhone(controller: controller),
    );
  }
}
