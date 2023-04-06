import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_project/api.dart';
import 'package:new_project/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email =TextEditingController();
  TextEditingController password= TextEditingController();
 var fkey= GlobalKey<FormState>();
 var logData;
 var id;

 getId() async {
   SharedPreferences spref=await SharedPreferences.getInstance();
   id=spref.getString("id");
 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:id==null? Form(
        key: fkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login",style: TextStyle(fontSize: 19,color: Colors.blue),),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: email,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter email";
                  }
                },
                decoration: InputDecoration(hintText: "Email",contentPadding: EdgeInsets.all(10),border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: password,
                validator: (value) {
                  if(value!.isEmpty){
                    return "enter password";
                  }
                },
                decoration: InputDecoration(hintText: "password",contentPadding: EdgeInsets.all(10),border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
            ),
            ElevatedButton(onPressed: () async {
              if(fkey.currentState!.validate()){
                var data=await service.login(email.text, password.text);
                print(data["id"]);
                if(data["message"]=="success"){
                  SharedPreferences spref=await SharedPreferences.getInstance();
                  spref.setString("id", data["id"]);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
                }else if(data["message"]=="failed"){
                  Fluttertoast.showToast(msg: "invalid details");
                }


              }
            }, child: Text("Login"))
          ],
        ),
      ):Home()
    );
  }
}
