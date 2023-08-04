import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/model/login/user_model.dart';
import 'package:mvvm_getx/repositries/login_repositries.dart';
import 'package:mvvm_getx/res/routes/routes_name.dart';
import 'package:mvvm_getx/view_model/controller/user_pref/user_pref.dart';

import '../../../utils/utils.dart';

class LoginController extends GetxController{
  final email=TextEditingController().obs;
  final password=TextEditingController().obs;
  final emailFocus=FocusNode().obs;
  final passFocus=FocusNode().obs;
  final loginRepositry=LoginRepositries();
  RxBool loading=false.obs;
  final userPref=UserPreference();

  void login(){
    loading.value=true;
    Map data={
      "email": email.value.text,
      "password": password.value.text
    };
    loginRepositry.login(data).then((value) {
      loading.value=false;
      if(value['error']=='user not found'){
        
        Utils.snackBar("LOGIN", value['error']);
      }else{
        userPref.saveData(UserModel.fromJson(value)).then((value) {
          Get.toNamed(RoutesName.homeScreen);
          Utils.snackBar("Login", "Success");
        },).onError((error, stackTrace) {

        });
        
      }
    },).onError((error, stackTrace){
      loading.value=false;

    });
  }


}