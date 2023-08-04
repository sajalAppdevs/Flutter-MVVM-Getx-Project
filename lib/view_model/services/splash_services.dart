import 'dart:async';

import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';
import '../controller/user_pref/user_pref.dart';


class SplashServices {
  void isLognn(){

    final userPref=UserPreference();
    Timer(const Duration(milliseconds: 1000),() {
      userPref.getUser().then((value) {
        if(value.token==null || value.token!.isEmpty){
          Get.toNamed(RoutesName.loginScreen);
        }else{
          Get.toNamed(RoutesName.homeScreen);
        }
      },).onError((error, stackTrace) {
        print(error.toString());
      },);
    },);
  }
}