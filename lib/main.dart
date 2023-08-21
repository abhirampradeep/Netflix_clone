import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/screens/downlaods/downlaods.dart';
import 'package:net/screens/main_page/screen_mainpage.dart';
import 'package:net/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: background,
      ),
      home: ScreenMainPage(),
    );
  }
}
