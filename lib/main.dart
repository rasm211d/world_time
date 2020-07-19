import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/" : (context) => Builder(builder: (_){
      return Loading();
    }) ,
    "/home" : (context) => Builder(builder: (_){
      return Home();
    }) ,
    "/location" : (context) => Builder(builder: (_){
      return ChooseLocation();
    }),
  },
));

