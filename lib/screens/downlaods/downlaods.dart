import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/screens/widgets/bottom_nav.dart';

class ScreenMainPAge extends StatefulWidget {
  const ScreenMainPAge({super.key});

  @override
  State<ScreenMainPAge> createState() => _ScreenMainPAgeState();
}

class _ScreenMainPAgeState extends State<ScreenMainPAge> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: Center(
        child: Text('daj', style: TextStyle(color: Colors.amber)),
      )),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
