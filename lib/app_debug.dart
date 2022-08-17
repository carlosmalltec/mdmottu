import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'lang/app_translation.dart';
import 'lang/translation_service.dart';
import 'routes/app_pages.dart';
import 'features/debug_view/pages/custom_error_view.dart';

class AppDebug extends StatefulWidget {
  const AppDebug({Key? key}) : super(key: key);

  @override
  State<AppDebug> createState() => _AppDebugState();
}

class _AppDebugState extends State<AppDebug> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.initial,
            routes: AppPages.routes(),
            locale: TranslationService.locale,
            localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
            supportedLocales: const [Locale("pt", "BR"), Locale("es", "ES"), Locale("en", "US")],
            title: AppTranslationString.string('company_name'),
            theme: ThemeData.light(),
            darkTheme: ThemeData.light(),
            themeMode: ThemeMode.light,
            builder: (BuildContext context, Widget? widget) {
              ErrorWidget.builder = (FlutterErrorDetails details) {
                return CustomErrorView(details: details);
              };
              return widget!;
            },
          ),
          Positioned(
            right: 100,
            top: 40,
            child: Align(
              alignment: Alignment.center,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.blue.withOpacity(0.25),
                onPressed: () => Navigator.pushNamed(context, Routes.logs),
                child: Icon(Icons.build, color: Colors.white.withOpacity(0.25)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
