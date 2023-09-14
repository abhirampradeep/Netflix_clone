import 'package:flutter/material.dart';
import 'package:net/screens/fastlaugh/VideolistItem.dart';

//page view is being used here,ie at a swipe we move from one widget to another widget

class Fastlaugh extends StatelessWidget {
  const Fastlaugh({Key? key}); // Fix the constructor syntax

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(10, (index) {
            return VideoListItem(
              index: index,
            );
          }),
        ),
      ),
    );
  }
}
