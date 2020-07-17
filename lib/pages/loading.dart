import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: "Berlin", flag: "germany.png", url: "Europe/Berlin");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments:  {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text("loading"),
      ),
    );
  }
}
