import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:net/colors/colors.dart';
import 'package:net/colors/constants.dart';
import 'package:net/screens/fastlaugh/VideolistItem.dart';
import 'package:net/screens/homepage/widgets/backgroundcard.dart';
import 'package:net/screens/homepage/widgets/homeNumberContent.dart';
import 'package:net/screens/homepage/widgets/homefilmicons.dart';
import 'package:net/screens/homepage/widgets/homepagetitle.dart';
import 'package:net/screens/search/search_result.dart';
import 'package:net/screens/widgets/appbarwidget.dart';
import 'package:net/screens/widgets/bottom_nav.dart';
import 'package:net/screens/widgets/main_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (Notification) {
                  final ScrollDirection direction = Notification.direction;
                  print(direction);
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(children: const [
                      AppBarWidget(
                          title: "no",
                          CastIcon: Icon(Icons.cast_rounded),
                          notificationsIcon: Icon(Icons.emoji_emotions)),
                      Column(children: [
                        BackgroundCard(),
                        HomePageTitleContent(
                          title: "Released in Past Year",
                        ),
                        HomePageTitleContent(title: "Trending"),
                        HomePageTitleContent(title: "Tense Dramas"),
                        HomeNumberContent(title: "Numbers"),
                        HomePageTitleContent(title: "South Indian Movies"),
                      ]),
                    ]),
                    scrollNotifier.value == true
                        ? Container(
                            width: double.infinity,
                            height: 60,
                            color: Colors.yellow,
                          )
                        : SizedBox(
                            height: 10,
                          ),
                  ],
                ),
              );
            }));
  }
}
