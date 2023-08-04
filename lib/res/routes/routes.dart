import 'package:get/get.dart';
import 'package:mvvm_getx/res/routes/routes_name.dart';

import '../../view/splash_screen.dart';
class Routes{
  static appRoutes()=>[
    GetPage(name: RoutesName.loginScreen, page: () => const SplashScreen())
  ];
}