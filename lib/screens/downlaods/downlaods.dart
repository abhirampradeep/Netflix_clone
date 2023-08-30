import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/screens/widgets/appbarwidget.dart';
import 'package:net/screens/widgets/bottom_nav.dart';

class Downloads extends StatelessWidget {
  Downloads({super.key});

  final List<String> imageList = [
    "https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
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
      body: ListView(
        children: [
          const Row(
            children: [
              Icon(Icons.settings, color: Colors.white),
              Text(
                "Screen Downloads",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          const Text(
            "Introducing Downloads for you",
            style: TextStyle(color: white),
          ),
          const Text(
            "We will download a personalized selection of movies and shows for you",
            style: TextStyle(color: white),
          ),
          Container(
            width: size.width,
            height: size.width + 30,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * .38,
                  backgroundColor: Colors.grey,
                ),
                Transform.rotate(
                  angle: 45,
                  child: Container(
                    width: size.width * 0.4,
                    height: size.width * 0.58,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(imageList[0], scale: 1))),
                    // child: Image.network(
                    //   imageList[1],
                    // ),
                  ),
                )
              ],
            ),
          ),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: const Text(
                "Setup",
                style: TextStyle(color: white),
              )),
          MaterialButton(
              color: Colors.white,
              onPressed: () {},
              child: const Text(
                "See what you can download",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
