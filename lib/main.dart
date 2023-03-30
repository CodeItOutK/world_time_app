//@dart=2.9
import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
void main() {
  runApp(MaterialApp(
    //default screen can be overwritten by initialRoute but not by home:Home()
    initialRoute:'/',
    routes:{
      '/':(context)=>Loading(),  //...'/'is default page that will appear
      // value of this page is a func that takes context as parameter
      //context helps to tell where in widget tree we are and then Loading widget is returned
      '/home':(context)=>Home(),
      '/location':(context)=>ChooseLocation(),
    },
  ));
}


