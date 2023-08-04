import 'package:get/get.dart';
import 'package:mvvm_getx/model/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference extends GetxController{


  Future<bool> saveData(UserModel user)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString("TOKEN", user.token!);
    return true;
  }


  Future<UserModel> getUser()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    String? token=pref.getString("TOKEN");
    return UserModel(
      token: token
    );
  }

  Future<bool> removeUser()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.clear();
    return true;
  }


}
