import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeController extends ChangeNotifier {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  ValueNotifier<String> batteryLevel = ValueNotifier<String>('Nível da bateria');

  Future<void> getBatteryLevel() async {
    String _batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      _batteryLevel = 'O nível da bateria é $result % .';
    } on PlatformException catch (e) {
      _batteryLevel = "Falha ao tentar ler os dados da bateria: '${e.message}'.";
    }
    batteryLevel.value = _batteryLevel;
    notifyListeners();
  }
}
