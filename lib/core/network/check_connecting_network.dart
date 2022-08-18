import 'package:connectivity_plus/connectivity_plus.dart';

mixin CheckConnectingNetwork {
  Future<bool> appCheckConnectivity() async {
    var _conn = await (Connectivity().checkConnectivity());
    bool isDeviceConnected = _conn != ConnectivityResult.none;
    return isDeviceConnected;
  }
}
