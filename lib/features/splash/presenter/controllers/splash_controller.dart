import 'package:flutter/material.dart';
import 'package:mdmottu/routes/app_pages.dart';

class SplashController extends ChangeNotifier {
  
  redirect(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushNamed(context, Routes.home);
  }
}
