import 'package:flutter/material.dart';
import 'package:net/colors/colors.dart';
import 'package:net/screens/downlaods/downlaods.dart';
import 'package:net/screens/fastlaugh/fastlaugh.dart';
import 'package:net/screens/homepage/homepage_screen.dart';
import 'package:net/screens/newhot/newhot.dart';
import 'package:net/screens/search/search_page.dart';
import 'package:net/screens/widgets/bottom_nav.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final List<Widget> _pages = [
    HomepageScreen(),
    NewHot(),
    Fastlaugh(),
    SearchPage(),
    Downloads(),
    // Downloadexample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<int>(
          valueListenable: indexChangeNotifier,
          builder: (context, index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
