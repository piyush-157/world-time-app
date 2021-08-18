import 'package:flutter/material.dart';
import 'package:world_time/views/choose_location.dart';
import 'package:world_time/views/home_screen.dart';
import 'package:world_time/views/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        "HomeScreen": (BuildContext context) => HomeScreen(),
        "ChooseLocation": (BuildContext context) => ChooseLocation(),
        "LoadingScreen": (BuildContext context) => LoadingScreen(),
      },
    );
  }
}