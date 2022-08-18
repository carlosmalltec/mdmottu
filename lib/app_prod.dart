import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/navigation_state/navigator_service.dart';
import 'core/theme_preference/theme_model.dart';
import 'dependency_injections/service_locator.dart';
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
  var themeNotifier = ServiceLocator().getIt.get<ThemeModel>();
  final scaffoldMessengerStateKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeNotifier,
      builder: (BuildContext context, Widget? widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.initial,
          navigatorKey: NavigatorService.navigatorKey,
          scaffoldMessengerKey: scaffoldMessengerStateKey,
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
      },
    );
  }
}
