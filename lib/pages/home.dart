import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  //Object?parameters;
  @override
  Widget build(BuildContext context) {
    //print("this");
    //data = ModalRoute.of(context)!.settings.arguments as Map;   //to recieve argum from loading widget but is used for first time building widget not after choosing loc page
    data = data.isNotEmpty? data : ModalRoute.of(context)!.settings.arguments as Map;
    //data=jsonDecode(jsonEncode(parameters));
    //data=jsonDecode(a);
     print(data);
     print(data['isDaytime']);
  //set background
    String bgImg = data['isDaytime'] == true ? 'daytime.jpg' : 'night.jpg';

    Color? bgcol=data['isDaytime'] ? Colors.blue[200] : Colors.indigo;

    return Scaffold(
      backgroundColor:bgcol,
      //body:SafeArea(child: Text('Home screen'))     //...->use wrap with widget safearea
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover,  //this will make img cover whole screen
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed:() async {
                   // Navigator.pushNamed(context,'/location');//this pushes a new screen over current screen
                   dynamic result=await Navigator.pushNamed(context,'/location');//getting data from choose loc and storing it in result
                   setState(() {
                     data={
                       'time':result['time'],
                       'location':result['location'],
                       'flag' : result['flag'],
                       'isDaytime' : result['isDaytime']
                     };
                   });
                  },
                  icon:Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label:Text(
                      'Edit location',
                      style:TextStyle(
                        color:Colors.grey[300],
                        fontSize: 18.0,
                      ),
                  ),
                ),
                SizedBox(height:20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize:28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height:20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize:66.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
