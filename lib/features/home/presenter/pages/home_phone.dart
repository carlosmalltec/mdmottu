import 'package:flutter/material.dart';
import 'package:mdmottu/core/navigation_state/navigator_service.dart';
import 'package:mdmottu/core/scaffold_app/scaffold_app.dart';
import 'package:mdmottu/core/theme_preference/theme_model.dart';
import 'package:mdmottu/features/design_system/colors/colors_app.dart';
import 'package:mdmottu/routes/app_pages.dart';

import '../../../../core/responsive/responsive_builder.dart';
import '../../../../dependency_injections/service_locator.dart';
import '../controllers/home_controller.dart';

class HomePhone extends StatefulWidget {
  final HomeController controller;

  const HomePhone({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomePhone> createState() => _HomePhoneState();
}

class _HomePhoneState extends State<HomePhone> {
  HomeController get _controller => widget.controller;
  final ThemeModel themeModel = ServiceLocator().getIt.get<ThemeModel>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      appBar: AppBar(
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorsApp.ffFFFFFF),
        ),
        centerTitle: true,
        leading: Container(),
      ),
      body: ResponsiveBuilder(builder: (context, view) {
        return Container(
          height: view.localWidgetSize?.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: ListView(
            children: [
              ValueListenableBuilder(
                  valueListenable: _controller.batteryLevel,
                  builder: (_, String level, child) {
                    return Card(
                      child: ListTile(
                        onTap: () async => await _controller.getBatteryLevel(),
                        leading: const Icon(Icons.battery_charging_full),
                        title: const Text('Informações da bateria, clique!'),
                        subtitle: Text(level),
                      ),
                    );
                  }),
              ValueListenableBuilder(
                valueListenable: _controller.valuePrintPlataform,
                builder: (_, String print, child) {
                  return Card(
                    child: ListTile(
                      onTap: () async => await _controller.getPrintPlataform(),
                      leading: const Icon(Icons.info_outline),
                      title: const Text('Função para print, clique!'),
                      subtitle: Text(print),
                    ),
                  );
                },
              ),
              const Divider(height: 30),
              const SizedBox(
                height: 100,
                child: Card(
                  child: ListTile(
                    title: Text('Teste de internet'),
                    subtitle: Text('Altere para modo de avião e ligue novamente!'),
                  ),
                ),
              ),
              const Divider(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: ListTile(
                        onTap: () => NavigatorService.navigatorPage(Routes.auth),
                        title: const Text('Login'),
                        subtitle: const Text('Página de login'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: ListTile(
                        onTap: () => NavigatorService.navigatorPage(Routes.character),
                        title: const Text('Lista dos personagens'),
                        subtitle: const Text('Leitura da API'),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                // height: 600,
                child: Card(
                  child: ListTile(
                    title: const Text('Temas disponíveis'),
                    subtitle: AnimatedBuilder(
                        animation: themeModel,
                        builder: (BuildContext context, Widget? widget) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text('Escolha uma cor de tema'),
                              const Divider(height: 40),
                              Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: [
                                  _button(ColorsApp.ffFF7C7C, 0, 'Tema 0'),
                                  _button(ColorsApp.ff820000, 1, 'Tema 1'),
                                  _button(ColorsApp.ff554994, 2, 'Tema 2'),
                                  _button(ColorsApp.ff80558C, 3, 'Tema 3'),
                                  _button(ColorsApp.ff100720, 4, 'Tema 4'),
                                ],
                              ),
                            ],
                          );
                        }),
                  ),
                ),
              ),
              const Divider(height: 30),
            ],
          ),
        );
      }),
    );
  }

  _button(Color color, int index, String nameButton) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
      ),
      onPressed: () => themeModel.setThemeData(index),
      child: Text(nameButton, style: Theme.of(context).textTheme.displayMedium),
    );
  }
}
