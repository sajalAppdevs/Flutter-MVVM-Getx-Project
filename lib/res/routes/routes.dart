import 'package:get/get.dart';
import 'package:mvvm_getx/res/routes/routes_name.dart';
import 'package:mvvm_getx/view/home_screen.dart';
import 'package:mvvm_getx/view/login_screen.dart';

import '../../view/splash_screen.dart';
class Routes{
  static appRoutes()=>[
    GetPage(name: RoutesName.splashScreen, page: () => const SplashScreen()),
    GetPage(name: RoutesName.loginScreen, page: () => const LoginScreen()),
    GetPage(name: RoutesName.homeScreen, page: () => const HomeScreen())
  ];
}