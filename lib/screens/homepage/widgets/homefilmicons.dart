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
          style: TextStyle(
              color: Colors.white.withOpacity(.6),
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ],
    );
  }
}
