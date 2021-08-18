import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Map data = {};
  String bgImage = "";
  var bgColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, (){
      setState(() {
        data = ModalRoute.of(context)!.settings.arguments as Map;
      });
      bgImage = data["isDayTime"] == "morning" ? "day.png" : data["isDayTime"] == "evening" ? "evening.png" : "night.png";
      bgColor = data["isDayTime"] == "morning" ? Colors.blue[700] : data["isDayTime"] == Colors.blue[300] ? "evening.png" : Colors.black;
      print(data);
      print(data["isDayTime"]);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImage"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed("ChooseLocation");
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  icon: Icon(Icons.edit_location),
                  label: Text("Edit Location"),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data["location"],
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  data["time"],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 66
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
