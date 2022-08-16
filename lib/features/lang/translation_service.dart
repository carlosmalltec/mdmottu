import 'package:flutter/material.dart';

import 'en_us.dart';
import 'pt_br.dart';

class TranslationService {
  static Locale? get locale => const Locale('pt','BR');
  // static final fallbackLocale = Locale('en', 'US');

  static String defaultLanguage = 'pt_BR';

  static Map<String, Map<String, String>> data = {'en_US': en_US, 'pt_BR': pt_BR};

  static set language(String lang) => defaultLanguage = lang;

  static String tr(String kye) => data[defaultLanguage]?[kye] ?? kye;
}
