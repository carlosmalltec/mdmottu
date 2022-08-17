import 'package:flutter/material.dart';
import 'package:mdmottu/features/design_system/colors/colors_app.dart';

ThemeData themeDataDefault = ThemeData(
  primaryColor: ColorsApp.ff222E50,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: ColorsApp.createMaterialColor(ColorsApp.ff222E50),
  ).copyWith(
    secondary: ColorsApp.ffC21010,
  ),
);
