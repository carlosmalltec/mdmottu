import 'package:flutter/material.dart';
import 'package:mdmottu/core/theme_preference/theme_model.dart';
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
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            themeNotifier.isDark ? "Home Dark Mode" : "Home Light Mode",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
                icon: Icon(themeNotifier.isDark ? Icons.nightlight_round : Icons.wb_sunny),
                onPressed: () {
                  themeNotifier.isDark ? themeNotifier.isDark = false : themeNotifier.isDark = true;
                })
          ],
        ),
        body: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. \nLorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          );
        }),
      );
    });
  }
}
