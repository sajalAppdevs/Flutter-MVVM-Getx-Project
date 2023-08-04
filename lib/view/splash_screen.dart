import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/view_model/controller/user_pref/user_pref.dart';
import 'package:mvvm_getx/view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashServices splashServices=SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLognn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "welcome".tr
        ),
      ),
    );
  }
}
