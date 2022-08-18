import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdmottu/features/design_system/colors/colors_app.dart';

ThemeData themeDataDefault = ThemeData(
  fontFamily: GoogleFonts.openSans().fontFamily,
  scaffoldBackgroundColor: Colors.grey.shade300,
  primaryColor: ColorsApp.ffFF7C7C,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: ColorsApp.createMaterialColor(ColorsApp.ffFF7C7C),
  ).copyWith(
    secondary: ColorsApp.ffFF7C7C,
    primary: ColorsApp.ffFF7C7C,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.all(10),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    // //Focus no input sem error
    focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 2, color: ColorsApp.ff263545)),
    // //Input em modo de bloqueado
    disabledBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ColorsApp.ff263545)),
    // //Sem focus, input nao teve evento
    enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ColorsApp.ff263545)),
    // //Borda global aqui
    border: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ColorsApp.ff263545)),
    // //Com error sem evento, ou seja o focus esta em outro input
    errorBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ColorsApp.ffC21010)),
    // //Com error e o focus no input
    focusedErrorBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ColorsApp.ffC21010)),
    hintStyle: GoogleFonts.openSans(color: Colors.grey, fontSize: 14),
    helperStyle: GoogleFonts.openSans(color: ColorsApp.ff222E50),
    errorStyle: GoogleFonts.openSans(color: ColorsApp.ffC21010, fontSize: 14),
    labelStyle: GoogleFonts.openSans(fontSize: 19, fontWeight: FontWeight.w900, color: ColorsApp.ff263545),
    helperMaxLines: 5,
    errorMaxLines: 5,
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.openSans(
      color: ColorsApp.ff263545,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.55,
    ),
    titleMedium: GoogleFonts.openSans(
      color: ColorsApp.ff263545,
      fontSize: 17,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      height: 1.33,
    ),

    ///Para todos textos dos botões
    displayMedium: GoogleFonts.openSans(
      color: ColorsApp.ffFFFFFF,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      height: 1.33,
    ),
    // displayLarge:TextStyle(),
    // displayMedium:TextStyle(),
    // displaySmall:TextStyle(),
    // headlineMedium:TextStyle(),
    // headlineSmall:TextStyle(),
    // titleLarge:TextStyle(),
    // titleSmall:TextStyle(),
    // bodyLarge:TextStyle(),
    // bodyMedium:TextStyle(),
    // bodySmall:TextStyle(),
    // labelLarge:TextStyle(),
    // labelSmall:TextStyle(),
  ),
);
