import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/screens/widgets/bottom_nav.dart';

class Fastlaugh extends StatefulWidget {
  const Fastlaugh({super.key});

  @override
  State<Fastlaugh> createState() => _FastlaughState();
}

class _FastlaughState extends State<Fastlaugh> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Text('Fastlaugh', style: TextStyle(color: Colors.amber)),
      )),
    );
  }
}
