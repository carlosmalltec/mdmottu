import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeController extends ChangeNotifier {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  static const platformPrint = MethodChannel('samples.flutter.dev/mdprint');

  ValueNotifier<String> batteryLevel = ValueNotifier<String>('Nível da bateria');
  ValueNotifier<String> valuePrintPlataform = ValueNotifier<String>('');

  Future<void> getBatteryLevel() async {
    String valueBatteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      valueBatteryLevel = 'O nível da bateria é $result % .';
    } on PlatformException catch (e) {
      valueBatteryLevel = "Falha ao tentar ler os dados da bateria: '${e.message}'.";
    }
    batteryLevel.value = valueBatteryLevel;
    notifyListeners();
  }

  Future<void> getPrintPlataform() async {
    String valuePrint;
    try {
      var result = await platformPrint.invokeMethod('MdPrint');
      valuePrint = '$result';
    } on PlatformException catch (e) {
      valuePrint = "${e.message}";
    }
    valuePrintPlataform.value = valuePrint;
    notifyListeners();
  }
}
