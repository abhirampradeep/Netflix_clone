import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/colors/constants.dart';

class HomeNumberContent extends StatelessWidget {
  const HomeNumberContent({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(
              color: white,
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          ),
        ),
        height,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:
                List.generate(10, (index) => NumberCard(index: index + 1)),
          ),
        ),
      ],
    );
  }
}

class NumberCard extends StatelessWidget {
  final int index;

  const NumberCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/mYD7rtnL2s8zkZ9Vuc2HvHrlFsQ.jpg",
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "$index", // Display the index as the numbering
            style: TextStyle(
              color: white,
              fontSize: 72,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
