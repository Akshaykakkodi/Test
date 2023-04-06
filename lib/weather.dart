import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  var lat;
  var long;

 Future getData() async {

    var response= await  get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=34.5&lon=75.2&appid=499af8df690609d7b49851aba85cbcc4"));
    var data= jsonDecode(response.body);
    print (data);
    return data ;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return
              Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasData){
            return Container(
              color: Colors.lightBlue,


              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Temperature: ",style: TextStyle(color: Colors.white),),
                        ),
                        Text("${snapshot.data["main"]["temp"].toString()} ",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Feels like:",style: TextStyle(color: Colors.white),),
                        ),
                        Text("${snapshot.data["main"]["feels_like"].toString()} ",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,0
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Min:",style: TextStyle(color: Colors.white),),
                        ),
                        Text("${snapshot.data["main"]["temp_min"].toString()} ",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Max:",style: TextStyle(color: Colors.white),),
                        ),
                        Text("${snapshot.data["main"]["temp_max"].toString()} ",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Pressure:",style: TextStyle(color: Colors.white),),
                        ),
                        Text("${snapshot.data["main"]["pressure"].toString()} ",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Humidity:",style: TextStyle(color: Colors.white),),
                        ),
                        Text("${snapshot.data["main"]["humidity"].toString()} ",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Wind speed:",style: TextStyle(color: Colors.white),),
                        ),
                        Text("${snapshot.data["wind"]["speed"].toString()} m/s ",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                ],
              ),
            );
          }else{
            return Text(('no data'));
          }

        }
      ),
    );
  }
}
