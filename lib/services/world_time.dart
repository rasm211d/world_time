import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // Location name for the UI
  String time; // the time in that location
  String flag; // url to asset flag icon
  String url; // this is the location url for api endpoints

  WorldTime({this.location, this.flag, this.url});


  Future<void> getTime() async {

    try {
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);

      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // sets time property
      time = DateFormat.jm().format(now);

    } catch (e) {
      print("Caught error: $e");
      time = "could not get time data";
    }
  }
}

