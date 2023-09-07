import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/colors/constants.dart';
import 'package:net/screens/homepage/widgets/homepagetitle.dart';
import 'package:net/screens/widgets/bottom_nav.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomepageTitle(title: "Released in Past Year"),
          height,
          Container(
            width: 150,
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg"))),
          ),
        ],
      ),
    );
  }
}
