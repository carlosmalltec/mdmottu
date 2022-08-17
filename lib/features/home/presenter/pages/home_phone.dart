import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mdmottu/core/theme_preference/theme_model.dart';
import 'package:mdmottu/features/design_system/colors/colors_app.dart';
import 'package:mdmottu/features/design_system/style/style_app.dart';
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
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              themeNotifier.isDark ? "Home Dark Mode" : "Home Light Mode",
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(themeNotifier.isDark ? Icons.nightlight_round : Icons.wb_sunny),
                  onPressed: () {
                    themeNotifier.isDark ? themeNotifier.isDark = false : themeNotifier.isDark = true;
                  })
            ],
          ),
          body: Center(
            child: ValueListenableBuilder(
              valueListenable: _controller.batteryLevel,
              builder: (_, String level, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async => await _controller.getBatteryLevel(),
                      child: const Text('Nível da bateria', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                    Text(level, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
