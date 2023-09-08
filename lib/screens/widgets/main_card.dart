import 'package:flutter/material.dart';

class HomepageCard extends StatelessWidget {
  const HomepageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg"))),
    );
  }
}
