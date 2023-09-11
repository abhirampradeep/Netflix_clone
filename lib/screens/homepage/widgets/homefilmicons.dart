import 'package:flutter/material.dart';

class HomeFilmWidget extends StatelessWidget {
  const HomeFilmWidget({
    Key? key,
    required this.titlefilm,
    required this.filmicon,
  }) : super(key: key);

  final String titlefilm;
  final Icon filmicon; // Keep the type as Icon

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        filmicon, // Use the Icon widget directly
        Text(
          titlefilm,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
