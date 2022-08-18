import 'package:flutter/material.dart';

import '../../../features/design_system/colors/colors_app.dart';
import '../../../lang/app_translation.dart';
import '../../navigation_state/navigator_service.dart';

SnackBar snackBarSuccess({String text = 'sucess_network'}) => SnackBar(
      backgroundColor: ColorsApp.ff277BC0,
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      content: Text(
        AppTranslationString.string(text),
        style: Theme.of(NavigatorService.navigatorKey.currentContext!).textTheme.titleMedium?.copyWith(
              color: ColorsApp.ffFFFFFF,
              fontWeight: FontWeight.w700,
              fontSize: 14.0,
            ),
        textAlign: TextAlign.center,
      ),
    );

SnackBar snackBarWarning() => SnackBar(
      backgroundColor: ColorsApp.ffC21010,
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      content: Text(
        AppTranslationString.string('failure_network'),
        style: Theme.of(NavigatorService.navigatorKey.currentContext!).textTheme.titleMedium?.copyWith(
              color: ColorsApp.ffFFFFFF,
              fontWeight: FontWeight.w700,
              fontSize: 14.0,
            ),
        textAlign: TextAlign.center,
      ),
    );
