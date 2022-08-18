import 'package:flutter/material.dart';
import 'package:mdmottu/core/navigation_state/navigator_service.dart';
import 'package:mdmottu/routes/app_pages.dart';
import 'package:provider/provider.dart';

import '../../../debug_view/controllers/debug_view_controller.dart';
import '../../../debug_view/models/debug_log_item.dart';
import '../../domain/entities/request_auth.dart';

class AuthController extends ChangeNotifier {
  // final DebugViewController debugViewController;

  // AuthController(this.debugViewController);

  final ValueNotifier<bool> visiblePassword = ValueNotifier<bool>(false);
  final ValueNotifier<bool> loading = ValueNotifier<bool>(false);

  void visiblePasswordShow() {
    visiblePassword.value = !visiblePassword.value;
    notifyListeners();
  }

  Future<void> signIn(RequestAuth data, DebugViewController debugViewController) async {
    var item = DebugLogItem(
      dataPost: data.toMap().toString(),
      baseUrl: 'https://teste.com',
      path: '/auth',
      method: 'POST',
      type: 'REQUISIÇÃO'
    );
    loading.value = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    if (data.login == 'teste@teste.com' && data.password == '123') {
      item = item.copyWith(type: 'RESPONSE',statusCode: '200', body: 'Login com sucesso');
      debugViewController.addLog(item);
    } else {
      item = item.copyWith(type: 'ERROR RESPONSE',statusCode: '404', errorStatusMessage: 'Usuário e senha não corresponde');
      debugViewController.addLog(item);
      loading.value = false;
      notifyListeners();
      return;
    }

    loading.value = false;
    notifyListeners();

    NavigatorService.navigatorPage(Routes.home);
  }
}
