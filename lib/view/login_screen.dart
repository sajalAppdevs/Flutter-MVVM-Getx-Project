import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/components/button.dart';
import 'package:mvvm_getx/utils/utils.dart';
import 'package:mvvm_getx/view_model/controller/login/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: loginController.emailFocus.value,
                controller: loginController.email.value,
                decoration: InputDecoration(
                    hintText: 'email_hint'.tr,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                validator: (value) {
                  if(value!.isEmpty){
                    Utils.snackBar("Wrong Email", "Enter Email");
                  }else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: loginController.password.value,
                focusNode: loginController.passFocus.value,
                decoration: InputDecoration(
                    hintText: 'pass_hint'.tr,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                validator: (value) {},
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => AppButton(
                  heigth: 50,
                  width: 150,
                  text: "login".tr,
                  onPress: () {
                    if(_key.currentState!.validate()){
                      loginController.login();
                    }
                  },
                  loading: loginController.loading.value))
            ],
          ),
        ),
      ),
    );
  }
}
