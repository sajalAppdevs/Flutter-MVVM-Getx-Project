import 'dart:convert';
import 'dart:io';
import 'package:mvvm_getx/data/app_exceptions.dart';
import 'package:mvvm_getx/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class ApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    var jsonData;
    try {
      var response = await http.get(Uri.parse(url)).timeout(
          const Duration(seconds: 10));
      jsonData = jsonResponse(response);
    } on SocketException {
      throw InternetException('No Internet');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timeout');
    }
    return jsonData;
  }

  @override
  Future postApi(data, String url) async {
    var jsonData;
    try {
      var response = await http.post(Uri.parse(url),
          body: data
      ).timeout(const Duration(seconds: 10));
      jsonData = jsonResponse(response);
    } on SocketException {
      throw InternetException('No Internet');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timeout');
    }
    print(jsonData);
    return jsonData;
  }


  dynamic jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      default:
        throw FetchDataException(
            'Error while Communication ${response.statusCode}');
    }
  }


}