import 'package:flutter/material.dart';
import 'package:sy_expedition_travel_challenge/main_page.dart';
import 'package:sy_expedition_travel_challenge/styles.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: mainBlack,
      ),
      home: MainPage(),
    );
  }
}
