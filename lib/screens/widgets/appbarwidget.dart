import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final String title;
  final Icon CastIcon;
  final void Function()? onCastPress;
  final Icon notificationsIcon;
  final void Function()? onEmojiPress;

  const AppBarWidget({
    required this.title,
    required this.CastIcon,
    this.onCastPress,
    required this.notificationsIcon,
    this.onEmojiPress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: background,
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.cast,
            color: Colors.white, // Set the icon color to white
          ),
          onPressed: onCastPress,
        ),
        IconButton(
          icon: const Icon(
            Icons.emoji_emotions,
            color: Colors.white, // Set the icon color to white
          ),
          onPressed: onEmojiPress,
        ),
      ],
    );
  }
}
