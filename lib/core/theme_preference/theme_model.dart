//theme_model.dart
import 'package:flutter/material.dart';
import 'package:mdmottu/core/theme_preference/theme_preference.dart';
import 'package:mdmottu/features/design_system/temes/theme_data_1.dart';
import 'package:mdmottu/features/design_system/temes/theme_data_2.dart';
import 'package:mdmottu/features/design_system/temes/theme_data_3.dart';
import 'package:mdmottu/features/design_system/temes/theme_data_4.dart';

import '../../features/design_system/temes/theme_data_default.dart';

class ThemeModel extends ChangeNotifier {
  int themeDefault = 0;
  late ThemePreferences _preferences;

  // int get themeDefault => _themeDefault;

  List<ThemeData> listThemesData = [
    themeDataDefault,
    themeData1,
    themeData2,
    themeData3,
    themeData4,
  ];

  ThemeModel() {
    themeDefault = 0;
    _preferences = ThemePreferences();
    getPreferences();
  }

   setThemeData(int value) {
    themeDefault = value;
    notifyListeners();

    print('_themeDefault $themeDefault');
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    themeDefault = await _preferences.getTheme();
    notifyListeners();
  }
}
