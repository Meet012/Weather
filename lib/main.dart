import 'package:flutter/material.dart';
import 'package:world_time/pages/homePage.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/chosseLocation.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => LoadnigScreen(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChosseLocation()
    },
  ));
}
