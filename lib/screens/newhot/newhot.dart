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
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
            title: 'New & Hot',
            CastIcon: Icon(Icons.cast),
            notificationsIcon: Icon(Icons.emoji_emotions)),
      ),
      body: SafeArea(
          child: Center(
        child: Text('daj', style: TextStyle(color: Colors.amber)),
      )),
    );
  }
}
