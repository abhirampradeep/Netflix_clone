import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            elevation: 0,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 24,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.collections,
                    size: 24,
                  ),
                  label: 'New & Hot'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.emoji_emotions,
                    size: 24,
                  ),
                  label: 'Laughs'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 24,
                  ),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.download,
                    size: 24,
                  ),
                  label: 'Downloads'),
            ],
            selectedFontSize: 9,
            unselectedFontSize: 12,
          );
        });
  }
}
