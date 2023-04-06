import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_project/login_page.dart';
import 'package:new_project/second_page.dart';
import 'package:new_project/weather.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String gender="";
  bool english=false;
  bool malayalam=false;
  var lang1;
  var lang2;
  TextEditingController name=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController address=TextEditingController();
  var fkey= GlobalKey<FormState>();






  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Welcome"),
        centerTitle: true,
        actions: [
          

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                SharedPreferences spref= await SharedPreferences.getInstance();
                spref.clear();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false);
              },

                child: Icon(Icons.logout_outlined)),
          ),

        ],
      ),
      body: Form(
        key: fkey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Enter details",style: TextStyle(color: Colors.blue,fontSize: 18),)),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(

                controller: name,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter name";
                  }
                },
                decoration: InputDecoration(hintText: "Name",contentPadding: EdgeInsets.all(10),border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: age,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter Age";
                  }
                },
                decoration: InputDecoration(hintText: "Age",contentPadding: EdgeInsets.all(10),border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: address,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter Address";
                  }
                },
                decoration: InputDecoration(hintText: "Address",contentPadding: EdgeInsets.all(10),border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
              ),
            ),

            Center(child: Text("Gender")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Male"),
                  Radio(
                    value: "male", groupValue: gender, onChanged: (v) {
                      setState(() {
                        gender=v!;
                      });

                  },),
                  Text("Female"),
                  Radio(
                    value: "female", groupValue: gender, onChanged: (v) {
                    setState(() {
                      gender=v!;
                    });

                  },),

                ],
              ),

            ),
            Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Languages"),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("English"),
                Checkbox(

                  value: english, onChanged: (value) {
                  setState(() {
                    english=value!;
                    english==true?lang1="English":lang1="";
                    print(lang1);
                  });

                },),
                Text("Malayalam"),
                Checkbox(

                  value: malayalam, onChanged: (value) {
                  setState(() {
                    malayalam=value!;
                    malayalam==true?lang2="Malayalam":lang2="";
                  });

                },),
              ],
            ),

            FloatingActionButton(onPressed: () {

              if(fkey.currentState!.validate()){
                if(gender=="male" || gender=="female"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Secondpage(name:name.text,age:age.text,address:address.text,gender:gender.toString(),language1:lang1,language2:lang2) ,));
                }
                else{
                  Fluttertoast.showToast(msg: "select gender");
                }



              }
            },
                child: Text("Submit")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherScreen(),));
              },label: Text("Weather"),
           ),
            )
          ],
        ),
      ),
    );
  }
}
