import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/screens/widgets/appbarwidget.dart';
import 'package:net/screens/widgets/bottom_nav.dart';

class NewHot extends StatefulWidget {
  const NewHot({super.key});

  @override
  State<NewHot> createState() => _NewHotState();
}

class _NewHotState extends State<NewHot> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: background,
            title: const Text(
              "New & Hot",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w900, color: white),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.cast,
                  size: 30,
                  color: white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.emoji_emotions,
                  size: 30,
                  color: white,
                ),
                onPressed: () {},
              ),
            ],
            bottom: const TabBar(
              // dividerColor: background,
              indicator: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              tabs: [
                Tab(
                  text: " Coming Soon",
                ),
                Tab(
                  text: "Everyone's watching",
                )
              ],
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: white,
              indicatorWeight: 0,
              // labelStyle: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          body: TabBarView(
            children: [buildtabbar("coming"), buildtabbar("watching")],
          )),
    );
  }
}

buildtabbar(String name) {
  return Center(
      child: Text(
    "$name",
    style: TextStyle(color: white),
  ));
}
