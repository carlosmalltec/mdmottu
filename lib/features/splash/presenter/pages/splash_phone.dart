import 'package:flutter/material.dart';
import 'package:mdmottu/features/design_system/style/style_app.dart';
import 'package:mdmottu/lang/app_translation.dart';

import '../controllers/splash_controller.dart';

class SplashPhone extends StatefulWidget {
  final SplashController controller;
  const SplashPhone({Key? key, required this.controller}) : super(key: key);

  @override
  State<SplashPhone> createState() => _SplashPhoneState();
}

class _SplashPhoneState extends State<SplashPhone> {

  @override
  void initState() {
  widget.controller.redirect(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(tag: 'logo', child: Icon(Icons.home)),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 1),
              ),
            ),
            Text(AppTranslationString.string('text_splash'), style: StyleApp.paragraphLgStrong),
          ],
        ),
      ),
    );
  }
}
