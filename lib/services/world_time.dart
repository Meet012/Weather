import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; // Location name for the UI
  String time=""; // te time in that location
  String flag; // url to assest flad icon
  String url; //location url for api endpoints
  bool daytime=false; // fo setting background color accordinglily

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{

    try{
      Response time = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(time.body);
      // print(data);
      // get all the needed data from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);
      // Create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      this.time = DateFormat.jm().format(now);
      this.daytime= now.hour>6 && now.hour<20?true:false;
    }catch(error){
      this.time = 'Could Not Found';
    }

  }
}
