import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/screens/newhot/widgets/comingsoon.dart';

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
                  fontSize: 18, fontWeight: FontWeight.w900, color: white),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.cast,
                  size: 24,
                  color: white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.emoji_emotions,
                  size: 24,
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
              labelColor: Colors.black,
              // labelColor: background,
              indicatorWeight: 0,
              // labelStyle: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          body: TabBarView(
            children: [buildcomingtabbar(), buildEveryonetabbar()],
          )),
    );
  }

  Widget buildcomingtabbar() {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 12,
      itemBuilder: (BuildContext context, int index) =>
          Comingsoonwidget(size: size),
    );
  }

  Widget buildEveryonetabbar() {
    return const SizedBox();
  }
}
