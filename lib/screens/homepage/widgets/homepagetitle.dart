import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/colors/constants.dart';
import 'package:net/screens/widgets/main_card.dart';

class HomePageTitleContent extends StatelessWidget {
  const HomePageTitleContent({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                    color: white, fontWeight: FontWeight.w900, fontSize: 22),
              )),
          height,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) => HomepageCard()),
            ),
          ),
        ],
      ),
    );
  }
}
