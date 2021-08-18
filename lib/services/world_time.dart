import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime
{
  String location = "";
  String time = "";
  String flag = "";
  String url = "";
  String isDayTime = "";

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try
        {
          Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
          Map data = jsonDecode(response.body);
          // print(data);
          String dateTime = data["utc_datetime"];
          String offSet = data["utc_offset"];
          String subOffset = offSet.substring(1, 3);

          DateTime now = DateTime.parse(dateTime);
          now = now.add(Duration(hours: int.parse(subOffset)));

          isDayTime = now.hour > 6 && now.hour < 16 ? "morning" : now.hour > 16 && now.hour < 20 ? "evening" : "night";
          time = DateFormat.jm().format(now);
        }
    catch(e)
    {
      print("caught error $e");
      time = "Could not get time data";
    }
  }
}