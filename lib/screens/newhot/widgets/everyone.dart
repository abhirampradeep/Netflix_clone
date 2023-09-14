import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/screens/newhot/widgets/filmdesc.dart';
import 'package:net/screens/newhot/widgets/newicon.dart';

class everyonewatching extends StatelessWidget {
  const everyonewatching({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 450,
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.network(
                      "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/nf3Vlxm3C9U1aKUUQHmKFZmxPSc.jpg",
                      fit: BoxFit.contain,
                    )),
              ),
              Positioned(
                  bottom: 20,
                  right: 10,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.black.withOpacity(.1),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_down_rounded,
                          color: background,
                          size: 30,
                        )),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              newpageicon(
                title: "Share",
                newicon: const Icon(
                  Icons.share,
                  color: white,
                ),
                newiconPress: () {},
              ),
              newpageicon(
                title: "My List",
                newicon: const Icon(
                  Icons.add,
                  color: white,
                ),
                newiconPress: () {},
              ),
              newpageicon(
                title: "Play",
                newicon: const Icon(
                  Icons.play_arrow,
                  color: white,
                ),
                newiconPress: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          filmshortdesc(),
        ],
      ),
    );
  }
}
