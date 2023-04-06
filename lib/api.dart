import 'dart:convert';

import 'package:http/http.dart';

class service{
    static Future<dynamic> login(String email, password) async {
       var response=await post(Uri.parse("http://192.168.68.106/project2/login_api.php"),body: {
         "email":email,
         "password":password
       });
       if(response.statusCode==200){
         var data=jsonDecode(response.body);
         return data;
       }
       else{
         return "failed";
       }
     }


}