import 'package:flutter/material.dart';

class ColorsApp {
  ColorsApp._();

  static const Color ff222E50 = Color(0xFF222E50);
  static const Color ffC21010 = Color(0xFFC21010);
  static const Color ffCFE8A9 = Color(0xFFCFE8A9);
  static const Color ffFFFFFF = Color(0xFFFFFFFF);
  static const Color ff263545 = Color(0xFF263545);
  static const Color ff277BC0 = Color(0xFF277BC0);
  static const Color ffEEEEEE = Color(0xFFEEEEEE);
  static const Color ffB9005B = Color(0xFFB9005B);


///Temas
  static const Color ffFF7C7C = Color(0xFFFF7C7C);
  static const Color ff820000 = Color(0xFF820000);
  static const Color ff554994 = Color(0xFF554994);
  static const Color ff80558C = Color(0xFF80558C);
  static const Color ff100720 = Color(0xFF100720);


  // static MaterialColor primarySwatch = createMaterialColor(blue);

  static MaterialColor createMaterialColor(Color color) {
    final List strengths = <double>[.05];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}


