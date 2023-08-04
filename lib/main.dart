import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/getx_localization/getx_localization.dart';
import 'package:mvvm_getx/res/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: Locale('en_US'),
      fallbackLocale: Locale('en_US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: Routes.appRoutes(),
    );
  }
}

