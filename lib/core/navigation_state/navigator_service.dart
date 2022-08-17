import 'package:flutter/material.dart';

class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigatorPage(String page) => Navigator.pushNamed(navigatorKey.currentContext!, page);
}
