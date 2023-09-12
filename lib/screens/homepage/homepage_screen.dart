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

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

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
                      // AppBarWidget(
                      //     title: "no",
                      //     CastIcon: Icon(Icons.cast_rounded),
                      //     notificationsIcon: Icon(Icons.emoji_emotions)),
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
                        ? AnimatedContainer(
                            duration: Duration(seconds: 4),
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(.7),
                            child: homeappbarwidget(),
                          )
                        : const SizedBox(
                            height: 10,
                          ),
                  ],
                ),
              );
            }));
  }
}

class homeappbarwidget extends StatelessWidget {
  const homeappbarwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              "https://1000logos.net/wp-content/uploads/2017/05/Netflix-Logo-2006.png",
              height: 40,
              width: 50,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.cast,
                      color: Colors.white, // Set the icon color to white
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.emoji_emotions,
                      color: Colors.white, // Set the icon color to white
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "TV Shows",
              style: TextStyle(color: white, fontWeight: FontWeight.bold),
            ),
            Text(
              "Movies",
              style: TextStyle(color: white, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  "Categories",
                  style: TextStyle(color: white, fontWeight: FontWeight.bold),
                ),
                // IconButton(
                //     onPressed: () {},
                //     icon: Icon(Icons.arrow_downward))
              ],
            )
          ],
        )
      ],
    );
  }
}
