import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/screens/widgets/bottom_nav.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        CupertinoSearchTextField(
          backgroundColor: Colors.grey.withOpacity(.5),
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
          suffixIcon: Icon(
            CupertinoIcons.xmark_circle_fill,
            color: Colors.grey,
          ),
          style: TextStyle(color: Colors.white),
        )
      ],
    )));
  }
}
