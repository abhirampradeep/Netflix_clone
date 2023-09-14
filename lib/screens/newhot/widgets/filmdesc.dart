import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';

class filmshortdesc extends StatelessWidget {
  const filmshortdesc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Outlanders 2",
              style: TextStyle(
                  color: white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Landing the lead in the school musical is a dream come true for Jodi,until the pressure sends her confidence.",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
