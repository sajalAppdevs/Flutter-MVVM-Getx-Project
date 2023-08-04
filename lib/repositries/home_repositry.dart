import 'package:get/get.dart';
import 'package:mvvm_getx/data/network/api_services.dart';
import 'package:mvvm_getx/model/login/user_model.dart';
import 'package:mvvm_getx/res/app_url/app_url.dart';

import '../model/user/user_model_list.dart';

class HomeRepositries extends GetxController{

  final _apiServices=ApiServices();
  Future<UserListModel> userListApi()async{
    var response=await _apiServices.getApi(AppUrl.userList);
    return UserListModel.fromJson(response);
  }

}