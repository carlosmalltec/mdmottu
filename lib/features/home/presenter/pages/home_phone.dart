import 'package:flutter/material.dart';
import 'package:mdmottu/core/scaffold_app/scaffold_app.dart';
import 'package:mdmottu/core/theme_preference/theme_model.dart';
import 'package:mdmottu/features/design_system/colors/colors_app.dart';
import 'package:provider/provider.dart';

import '../controllers/home_controller.dart';

class HomePhone extends StatefulWidget {
  final HomeController controller;

  const HomePhone({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomePhone> createState() => _HomePhoneState();
}

class _HomePhoneState extends State<HomePhone> {
  HomeController get _controller => widget.controller;

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
          Consumer<ThemeModel>(
            builder: (context, ThemeModel themeNotifier, child) {
              return IconButton(
                icon: Icon(themeNotifier.isDark ? Icons.nightlight_round : Icons.wb_sunny),
                onPressed: () {
                  themeNotifier.isDark ? themeNotifier.isDark = false : themeNotifier.isDark = true;
                },
              );
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const Divider(
              height: 60,
            ),
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
      ),
    );
  }
}
