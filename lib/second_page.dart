import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Secondpage extends StatefulWidget {
  var name;

  var age;

  var address;

  var gender;

  var language1;

  var language2;

   Secondpage({Key? key,required this.name,required this.age,required this.address,required this.gender,required this.language1,required this.language2}) : super(key: key);

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  var name;
  var age;
  var address;
  var gender;
 Future getData() async {

    SharedPreferences spref=await  SharedPreferences.getInstance();
    name=spref.getString("name");
    age=spref.getString("age");
    address=spref.getString("adress");
    gender=spref.getString("gender");
    print(name);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
      ),
      body:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Name:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.name),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Age:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.age),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Address:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.address),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Gender:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.gender),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Languages:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${widget.language1},${widget.language2}"),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )

    );
  }
}
