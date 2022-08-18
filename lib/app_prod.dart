import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/navigation_state/navigator_service.dart';
import 'core/theme_preference/theme_model.dart';
import 'features/design_system/colors/colors_app.dart';
import 'features/design_system/style/style_app.dart';
import 'lang/app_translation.dart';
import 'lang/translation_service.dart';
import 'routes/app_pages.dart';
import 'features/debug_view/pages/custom_error_view.dart';

class AppProd extends StatefulWidget {
  const AppProd({Key? key}) : super(key: key);

  @override
  State<AppProd> createState() => _AppProdState();
}

class _AppProdState extends State<AppProd> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(builder: (context, ThemeModel themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.initial,
            navigatorKey: NavigatorService.navigatorKey,
            routes: AppPages.routes(),
            locale: TranslationService.locale,
            localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
            supportedLocales: const [Locale("pt", "BR"), Locale("es", "ES"), Locale("en", "US")],
            title: AppTranslationString.string('company_name'),
            theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
            builder: (BuildContext context, Widget? widget) {
              ErrorWidget.builder = (FlutterErrorDetails details) {
                return CustomErrorView(details: details);
              };
              return widget!;
            },
          );
        }));
  }
}
