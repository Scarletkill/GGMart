import 'dart:js';

import 'package:flutter/material.dart';
import 'package:gg_mart/dashboard.dart';
import 'package:gg_mart/list_view.dart';
import 'package:gg_mart/login.dart';
import 'package:gg_mart/splash.dart';

void main() {
  runApp(
    MaterialApp(
      title: "The Good Grocer",
      debugShowCheckedModeBanner: false,
      theme : ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen)
      ),
        routes:{
        '/':(BuildContext context) => Splash(),
         '/dashboard':(context) => Dashboard(),
          '/ListviewScreen': (context) => ListviewScreen(),
          '/login':(context) => Login()
    },
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        "Driving Licence Test",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
      ),
        actions: const[
          Padding(padding: const EdgeInsets.only(right: 30),)
        ],
        centerTitle: true,
    ),
    );
  }
}


