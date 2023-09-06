import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoListItem extends StatelessWidget {
  VideoListItem({
    required this.index,
    Key? key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.accents[index % Colors.accents.length],
    );
  }
}
