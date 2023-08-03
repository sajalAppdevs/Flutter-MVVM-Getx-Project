

import 'package:mvvm_getx/data/response/status.dart';

class ApiStatus<T>{
  Status? status;
  T? data;
  String? message;
  ApiStatus.loading() : status=Status.LOADING;
  ApiStatus.complete(this.data) : status=Status.COMPLETE;
  ApiStatus.error(this.message) : status=Status.ERROR;


  @override
  String toString(){
    return 'Status $status \n Data $data \n Message $message ' ;
  }
}