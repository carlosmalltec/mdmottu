import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/responsive/orientation_layout.dart';
import '../../../core/responsive/screen_type_layout.dart';
import 'controllers/auth_controller.dart';
import 'pages/auth_phone.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController controller = context.watch<AuthController>();

    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: (context) => AuthPhone(controller: controller),
        landscape: (context) => AuthPhone(controller: controller),
      ),
      tablet: AuthPhone(controller: controller),
      desktop: AuthPhone(controller: controller),
    );
  }
}


