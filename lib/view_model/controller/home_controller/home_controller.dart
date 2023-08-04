import 'package:get/get.dart';
import 'package:mvvm_getx/data/response/status.dart';
import 'package:mvvm_getx/model/user/user_model_list.dart';
import 'package:mvvm_getx/repositries/home_repositry.dart';

class HomeController extends GetxController{
  final _apiRepo= HomeRepositries();
  final rxRequestStatus=Status.LOADING.obs;
  final userList=UserListModel().obs;
  setRxRequest(Status val) => rxRequestStatus.value=val;
  setUserList(UserListModel val) => userList.value=val;


  void userListApi(){

    _apiRepo.userListApi().then((value) {
      setRxRequest(Status.COMPLETE);
      userList.value=value;
    }).onError((error, stackTrace) {
      setRxRequest(Status.ERROR);
    });
  }


}