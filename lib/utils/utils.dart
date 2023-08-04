import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Utils{


  static changeFieldFocus(BuildContext context,FocusNode currentFocus,FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static snackBar(String title,String message){
    Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM
    );
  }
}