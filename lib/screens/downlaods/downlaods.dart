import 'dart:math';

import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/screens/widgets/appbarwidget.dart';
import 'package:net/screens/widgets/bottom_nav.dart';

class Downloads extends StatelessWidget {
  Downloads({super.key});

  final _WidgetsList = [
    const ScreenDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
              title: 'Download',
              CastIcon: Icon(Icons.cast),
              notificationsIcon: Icon(Icons.emoji_emotions)),
        ),
        body: ListView.separated(
            itemBuilder: (ctx, index) => _WidgetsList[index],
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _WidgetsList.length));
  }
}

class Section3 extends StatelessWidget {
  const Section3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
              padding: EdgeInsets.only(top: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.blue,
              onPressed: () {},
              child: const Text(
                "Setup",
                style: TextStyle(color: white, fontWeight: FontWeight.bold),
              )),
        ),
        MaterialButton(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {},
            child: const Text(
              "See what you can download",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({
    super.key,
  });

  final List<String> imageList = [
    "https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 1),
            child: Text(
              "Introducing Downloads for you",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "We will download a personalized selection of movies and shows for you",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.width + 30,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * .38,
                  backgroundColor: Colors.grey,
                ),
                DownloadsImageWidget(
                  margin: EdgeInsets.only(left: 130, bottom: 25),
                  imageList: imageList[0],
                  angle: 22,
                ),
                DownloadsImageWidget(
                  margin: EdgeInsets.only(right: 130, bottom: 25),
                  imageList: imageList[0],
                  angle: -22,
                ),
                DownloadsImageWidget(
                    margin: EdgeInsets.only(left: 0), imageList: imageList[0]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(padding: EdgeInsets.all(10)),
        Icon(Icons.settings, color: Colors.white),
        Text(
          "Screen Downloads",
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * 0.4,
        height: size.width * 0.58,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage(imageList, scale: 1))),
        // child: Image.network(
        //   imageList[1],
        // ),
      ),
    );
  }
}
