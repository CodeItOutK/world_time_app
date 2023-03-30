import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';   //this used to get loading icon
class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

 // String time='Loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime('Berlin','germany.png','Europe/Berlin');
    await instance.getTime();
    //to go to home pg  -not used pushNamed to avoid making stack of widgets
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
    });


    // setState(() {
    //   time=instance.time;
    // });
  }

  /*void getTime()async{
    var path=Uri.parse('https://worldtimeapi.org/api/timezone/Europe/London');
    Response response=await get(path);
    Map data = jsonDecode(response.body);
    //print(data);
    //get properties from data
    String datetime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);
    //create dateTime object
    DateTime now=DateTime.parse(datetime);
    now=now.add(Duration(hours:int.parse(offset)));
    print(now);
  }
*/
  /*void getData()async{
    var path = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    Response response = await get(path);
   // print(response.body);   //response.body returns a json String which is to be converted into Map
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);   //by converting into Map we can get value of individual prop also
  /*  //stimulate network request for username
    String username=await Future.delayed(Duration(seconds:4),(){
      return('yoshi');
    });

    //stimulate network request for biodata of username
    // (this is dependent on upper name so we will use await to complete upr vala code first)
    String bio=await Future.delayed(Duration(seconds:3),(){
      return('cook 25 years of age');
    });
    print('$username- $bio');

   */
  }*/
//initState run first and only once when state is created
  //build runs once with initState and also every time state changes ie setState is called
  @override
  void initState() {
    setupWorldTime();
    super.initState();

    //getTime();
    //getData();
    //print('initState func ran');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body:Center(
        child:SpinKitThreeInOut(
          color: Colors.white,
          size: 50.0,
        ),
      ),


      // body:Padding(
      //   padding: EdgeInsets.all(60.0),
      //   child:Text('Loading'),
      //   //child:Text(time),
      // ),
    );
  }
}
