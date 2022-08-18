import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/network/check_connecting_network.dart';
import '../core/network/network.dart';
import '../core/theme_preference/theme_model.dart';
import '../features/auth/presenter/controllers/auth_controller.dart';
import '../features/character/external/datasource/character_datasource_impl.dart';
import '../features/character/presenter/controller/character_controller.dart';
import '../features/debug_view/controllers/debug_view_controller.dart';
import '../features/home/presenter/controllers/home_controller.dart';
import '../features/splash/presenter/controllers/splash_controller.dart';

class ServiceLocator {
  final getIt = GetIt.instance;

  void setup() {
    
    getIt.registerSingleton<ThemeModel>(ThemeModel());

    getIt.registerSingleton<DebugViewController>(DebugViewController());
    getIt.registerSingleton<Dio>(Dio());
    getIt.registerSingleton<Network>(Network(getIt.get<Dio>()));
    getIt.registerSingleton<CheckConnectingNetwork>(CheckConnectingNetwork());

    getIt.registerFactory<SplashController>(() => SplashController());
    getIt.registerFactory(() => AuthController(getIt.get<DebugViewController>()));
    getIt.registerFactory<HomeController>(() => HomeController());

    /// Modulo de listagem dos personagens
    getIt.registerFactory<CharacterDatasourceImpl>(() => CharacterDatasourceImpl(getIt.get<Network>()));
    getIt.registerFactory(() => CharacterController(getIt.get<CharacterDatasourceImpl>(), getIt.get<CheckConnectingNetwork>()));
  }
}
