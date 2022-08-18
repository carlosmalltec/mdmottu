import 'package:flutter/material.dart';
import 'package:mdmottu/core/scaffold_app/scaffold_app.dart';
import 'package:mdmottu/core/theme_preference/theme_model.dart';
import 'package:mdmottu/features/design_system/colors/colors_app.dart';

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
        actions: [
          AnimatedBuilder(
            animation: themeModel,
            builder: (BuildContext context, Widget? widget) {
              return IconButton(
                icon: Icon(themeModel.isDark ? Icons.nightlight_round : Icons.wb_sunny),
                onPressed: () {
                  themeModel.isDark ? themeModel.isDark = false : themeModel.isDark = true;
                },
              );
            },
          )
        ],
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
                        onTap: () {},
                        title: const Text('Login'),
                        subtitle: const Text('Página de login'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: ListTile(
                        onTap: () {},
                        title: const Text('Lista'),
                        subtitle: const Text('Leitura da API'),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
