import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  VideoListItem({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.accents[index % Colors.accents.length],
      ),

      //use can use position as well
      Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 30),

              //left side
              child: CircleAvatar(
                  radius: 25,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.volume_up))),
            ),

            //right side
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VideoIconsWidgets(
                    videoicon: const Icon(Icons.emoji_emotions_outlined),
                    videoiconPress: () {},
                    videotitle: "LOL",
                  ),
                  VideoIconsWidgets(
                      videoicon: Icon(Icons.plus_one_outlined),
                      videoiconPress: () {},
                      videotitle: "My List"),
                  VideoIconsWidgets(
                      videoicon: Icon(Icons.share),
                      videoiconPress: () {},
                      videotitle: "Share"),
                  VideoIconsWidgets(
                      videoicon: Icon(Icons.play_arrow),
                      videoiconPress: () {},
                      videotitle: "Play"),
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }
}

class VideoIconsWidgets extends StatelessWidget {
  const VideoIconsWidgets(
      {super.key,
      required this.videoicon,
      required this.videoiconPress,
      required this.videotitle});

  final Icon videoicon;
  final void Function()? videoiconPress;
  final String videotitle;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 25,
          child: IconButton(onPressed: videoiconPress, icon: videoicon),
        ),
      ),
      Text(
        videotitle,
        style: const TextStyle(color: white),
      )
    ]);
  }
}
