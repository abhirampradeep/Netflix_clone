import 'package:flutter/material.dart';

class HomepageCard extends StatelessWidget {
  const HomepageCard({Key? key, required this.imageurl}) : super(key: key);

  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageurl),
          fit: BoxFit.cover, // You can adjust the BoxFit as needed
        ),
      ),
    );
  }
}
