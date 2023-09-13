import 'package:flutter/material.dart';

class newpageicon extends StatelessWidget {
  const newpageicon(
      {super.key,
      required this.title,
      required this.newicon,
      required this.newiconPress});

  final String title;
  final Icon newicon;
  final void Function()? newiconPress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: newiconPress,
          icon: newicon,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white.withOpacity(.7), fontSize: 12),
        )
      ],
    );
  }
}
