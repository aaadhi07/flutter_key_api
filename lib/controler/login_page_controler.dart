import 'package:flutter/material.dart';
import 'package:flutter_key_api/models/login_page_model.dart';
import 'package:flutter_key_api/view/app_config.dart';
import 'package:flutter_key_api/view/home_screen/home_screen.dart';
import 'package:http/http.dart'as http;

class LoginPageControler with ChangeNotifier{

 Future <void> loginData(BuildContext context,{required email,required password}) async {
    final Url = Uri.parse(AppConfig.baseUrl+ "login");
    try{
      
      final response =await http.post(Url,body: {
        "email":email,
    "password":password,
      });

      if(response.statusCode==200){
        LoginPageModel resModel = loginPageModelFromJson(response.body);
        if(resModel.access != null && resModel.access!.isNotEmpty){
          Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(
            builder: (context) => HomeScreen()
            ),
             (route) => false,);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("data"))
        );
      }
    }catch(e){

    }
  }
}