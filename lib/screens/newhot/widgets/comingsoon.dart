import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/screens/newhot/widgets/filmdesc.dart';
import 'package:net/screens/newhot/widgets/newicon.dart';

class Comingsoonwidget extends StatelessWidget {
  const Comingsoonwidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Add this line
      children: [
        const SizedBox(
          width: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "FEB",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                "11",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.network(
                        "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/nf3Vlxm3C9U1aKUUQHmKFZmxPSc.jpg",
                        fit: BoxFit.contain,
                      )),
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
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Outlanders 2",
                          style: TextStyle(
                              color: white,
                              fontSize: 24,
                              letterSpacing: -2,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Coming on Friday',
                          style: TextStyle(
                              color: Colors.white.withOpacity(.9),
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  newpageicon(
                    title: "Remind me",
                    newicon: const Icon(
                      Icons.ring_volume,
                      color: white,
                    ),
                    newiconPress: () {},
                  ),
                  newpageicon(
                    title: "info",
                    newicon: const Icon(
                      Icons.info,
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
        ),
      ],
    );
  }
}
