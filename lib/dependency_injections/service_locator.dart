import 'package:get_it/get_it.dart';

import '../core/theme_preference/theme_model.dart';
import '../features/auth/presenter/controllers/auth_controller.dart';
import '../features/debug_view/controllers/debug_view_controller.dart';
import '../features/home/presenter/controllers/home_controller.dart';
import '../features/splash/presenter/controllers/splash_controller.dart';

class ServiceLocator {
  final getIt = GetIt.instance;

  void setup() {

    getIt.registerSingleton<DebugViewController>(DebugViewController());

    ///Reconstroi sempre que é chamada
    getIt.registerFactory<ThemeModel>(() => ThemeModel());
    getIt.registerFactory<SplashController>(() => SplashController());
    getIt.registerFactory<HomeController>(() => HomeController());
    getIt.registerFactory(() => AuthController(getIt.get<DebugViewController>()));
  }
  
}
