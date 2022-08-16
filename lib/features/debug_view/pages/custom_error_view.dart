import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mdmottu/constants/const_drawables.dart';
import 'package:mdmottu/features/design_system/style/style_app.dart';

class CustomErrorView extends StatelessWidget {
  final FlutterErrorDetails? details;
  const CustomErrorView({Key? key, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ConstDrawables.image404),
              Text(
                kDebugMode ? details?.summary.toString() ?? 'Erro nulo da aplicação!' : 'Desculpe! Algo deu errado.',
                textAlign: TextAlign.center,
                style: StyleApp.paragraphLgStrong,
              ),
              Visibility(
                visible: kDebugMode,
                replacement: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'ocorreu um erro agora. O erro será analisado e corrigido por nossa equipe. Obrigado pela sua paciência',
                    style: StyleApp.paragraphLgStrong,
                  ),
                ),
                child: const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
