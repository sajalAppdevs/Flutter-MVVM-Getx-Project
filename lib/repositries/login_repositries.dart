import 'package:get/get.dart';
import 'package:mvvm_getx/data/network/api_services.dart';
import 'package:mvvm_getx/res/app_url/app_url.dart';

class LoginRepositries{

  final _apiServices=ApiServices();

  Future<dynamic> login(var data)async{
    var response=_apiServices.postApi(data, AppUrl.loginUrl);
    return response;
  }

}