import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/screens/homepage/widgets/homefilmicons.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: 550,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/lUpMckVHaB55YJ3SMK0arwxKmCt.jpg"))),
      ),
      Positioned(
        bottom: 10,
        right: 0,
        left: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const HomeFilmWidget(
              filmicon: Icon(
                Icons.add,
                color: white,
                size: 25,
              ),
              titlefilm: "Play List",
            ),
            playbutton(),
            const HomeFilmWidget(
              filmicon: Icon(
                Icons.info_outline,
                color: white,
                size: 25,
              ),
              titlefilm: "Info",
            ),
          ],
        ),
      )
    ]);
  }

  TextButton playbutton() {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(white)),
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
        ),
        label: const Padding(padding: EdgeInsets.all(6), child: Text("Play")));
  }
}
