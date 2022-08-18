import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdmottu/features/design_system/colors/colors_app.dart';

class StyleApp {
  StyleApp._();

  static TextStyle caption = GoogleFonts.openSans(
    fontSize: 27,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.33,
    color: ColorsApp.ff222E50,
  );

  static TextStyle titleLarge = GoogleFonts.openSans(
    fontSize: 55,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    height: 1.40,
    color: ColorsApp.ffCFE8A9,
  );

  static TextStyle paragraphMdRegular = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.33,
    color: ColorsApp.ff222E50,
  );
}
