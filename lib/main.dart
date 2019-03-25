import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

// 2bdc18ea3e9b4fd690b1e1a98c3630a8
// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2bdc18ea3e9b4fd690b1e1a98c3630a8

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
