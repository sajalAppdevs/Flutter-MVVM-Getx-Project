import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{

  @override
  Map<String, Map<String,String>> get keys =>{

    'en_US' : {
      'welcome' : 'Welcome Back',
      'email_hint' : 'Enter Your Email',
      'pass_hint' : 'Enter Password',
      'login' : 'Login'
    },


    'ur_PK' : {
      'email_hint' : "Write in urdu keyboard"
    }

  };
}