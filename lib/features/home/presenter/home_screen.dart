import 'package:flutter/material.dart';

import '../../../core/responsive/orientation_layout.dart';
import '../../../core/responsive/screen_type_layout.dart';
import '../../../dependency_injections/service_locator.dart';
import 'controllers/home_controller.dart';
import 'pages/home_phone.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = ServiceLocator().getIt.get<HomeController>();

    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: (context) => HomePhone(controller: controller),
        landscape: (context) => HomePhone(controller: controller),
      ),
      tablet: HomePhone(controller: controller),
      desktop: HomePhone(controller: controller),
    );
  }
}
