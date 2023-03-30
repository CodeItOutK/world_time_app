import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location = "";  //location name for the UI
  String time = "";  //the time in that location    late bec its value will be assigned not in constructor but afterwards
  String flag = "";  //url for flag icon of that location
  String url = "";   //location url for api endpoint
  bool isDaytime = false; //true or false if daytime ot not
  //ie in 'https://worldtimeapi.org/api/timezone/Europe/London' only change /Europe/London to $url for desired loc timing

  WorldTime(String location,String flag,String url){
    this.location = location;
    this.flag = flag;
    this.url = url;
    getTime();
  }

  Future <void> getTime()async{
    try{
      var path=Uri.parse('https://worldtimeapi.org/api/timezone/$url');
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
      now = now.add(Duration(hours:int.parse(offset)));

      //set the time property
      isDaytime = (now.hour>5 && now.hour<18) ? true : false;
     time=DateFormat.jm().format(now); //intl package used to format time in better way eg not 15:20 but 3:20pm
      //time=now.toString();
    }
    catch(e){
    print('caught error - $e');
    time='Unable to identify time of given location';
    }
  }
}

//WorldTime instance = WorldTime(location:'Berlin',flag:'germany.png',url:'Europe/Berlin')
//instance.getTime();