import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CheckConnectingNetwork extends ChangeNotifier {
  Future<bool> appCheckConnectivity() async {
    bool connected = false;
    ConnectivityResult conn = await (Connectivity().checkConnectivity());
    if (conn != ConnectivityResult.none) connected = true;
    notifyListeners();
    return connected;
  }
}
