import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';

class HomepageTitle extends StatelessWidget {
  const HomepageTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: const TextStyle(
            color: white, fontWeight: FontWeight.w900, fontSize: 22),
      ),
    );
  }
}
