import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/colors/constants.dart';
import 'package:net/screens/fastlaugh/VideolistItem.dart';
import 'package:net/screens/homepage/widgets/homeNumberContent.dart';
import 'package:net/screens/homepage/widgets/homepagetitle.dart';
import 'package:net/screens/search/search_result.dart';
import 'package:net/screens/widgets/appbarwidget.dart';
import 'package:net/screens/widgets/bottom_nav.dart';
import 'package:net/screens/widgets/main_card.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const AppBarWidget(
          title: "no",
          CastIcon: Icon(Icons.cast_rounded),
          notificationsIcon: Icon(Icons.emoji_emotions)),
      Column(children: [
        Stack(children: [
          Container(
            width: double.infinity,
            height: 550,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/lUpMckVHaB55YJ3SMK0arwxKmCt.jpg"))),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoIconsWidgets(
                    videoicon: Icon(Icons.list),
                    videoiconPress: () {},
                    videotitle: "List"),
                TextButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(white)),
                    icon: Icon(Icons.play_arrow),
                    label: Text("Play")),
                VideoIconsWidgets(
                    videoicon: Icon(Icons.list),
                    videoiconPress: () {},
                    videotitle: "List"),
              ],
            ),
          )
        ]),
        const HomePageTitleContent(
          title: "Released in Past Year",
        ),
        const HomePageTitleContent(title: "Trending"),
        const HomePageTitleContent(title: "Tense Dramas"),
        const HomeNumberContent(title: "Numbers"),
        const HomePageTitleContent(title: "South Indian Movies"),
      ]),
    ]);
  }
}
