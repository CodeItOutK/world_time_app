import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  //int count=0;

  List<WorldTime> locations=[
    WorldTime('London','uk.png','Europe/London'),
    WorldTime('Athens','greece.png','Europe/Berlin'),
    WorldTime('Cairo','Egypt.png','Africa/Cairo'),
    WorldTime('Nairobi','kenya.png','Africa/Nairobi'),
    WorldTime('Chicago','usa.png','America/Chicago'),
    WorldTime('New York','usa.png','America/New_York'),
    WorldTime('Seoul','south_korea.png','Asia/Seoul'),
    WorldTime('Jakarta','indonesia.png','Asia/Jakarta'),
    //WorldTime('India','India.png','Asia/India')
  ];

  void updateTime(index) async {
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{    //pop is used to simply pop choose loc pg and get back to home pg without rebulding all widgets for home thats why argum are not passed old one will be used
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }

  @override

  Widget build(BuildContext context) {
    //print('main func');
    //print('build func ran');
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(         //if we have come from a prev pg to this one then appbar will automatically provide back button
        title:Text('Choose the location'),
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
        elevation:0
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){    //will go to each item of list based on index
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(   //listTile is used to get an icon and adjacent text
                onTap : (){
                  updateTime(index);
                },
                title:Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),



      // body:RaisedButton(
      //   onPressed: (){
      //     setState(() {
      //       count+=1;
      //     });
      //   },
      //   child:Text('count is $count'),
      // ),
    );
  }
}
