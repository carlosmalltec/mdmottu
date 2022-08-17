import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mdmottu/core/navigation_state/navigator_service.dart';
import 'package:mdmottu/features/design_system/colors/colors_app.dart';
import 'package:provider/provider.dart';

import 'core/theme_preference/theme_model.dart';
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
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Stack(
              children: [
                MaterialApp(
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
                ),
                Positioned(
                  right: 100,
                  top: 40,
                  child: Align(
                    alignment: Alignment.center,
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: ColorsApp.ffCFE8A9.withOpacity(0.25),
                      onPressed: () => NavigatorService.navigatorPage(Routes.logs),
                      child: Icon(Icons.build, color: ColorsApp.ff222E50.withOpacity(0.25)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
