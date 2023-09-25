import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:net/colors/colors.dart';
import 'package:net/provider/coming_provider.dart';
import 'package:net/provider/download_provider.dart';
import 'package:net/provider/everyone_provider.dart';
import 'package:net/provider/searchresult_provider.dart';
import 'package:net/screens/main_page/screen_mainpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DownloadProvider()),
        ChangeNotifierProvider(create: (_) => ComingProvider()),
        ChangeNotifierProvider(create: (_) => FilmProvider()),
        ChangeNotifierProvider(create: (_) => SearchresultProvider())

        // Add other providers if needed
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: background,
      ),
      home: ScreenMainPage(),
    );
  }
}
