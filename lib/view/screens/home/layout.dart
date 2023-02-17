import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/constants.dart';
import 'package:news/view/screens/home/BookmarkScreen.dart';
import 'package:news/view/screens/home/ExplorerScreen.dart';
import 'package:news/view/screens/home/HomeScreen.dart';

class layoutScreen extends StatefulWidget {
  const layoutScreen({Key? key}) : super(key: key);

  @override
  State<layoutScreen> createState() => _layoutScreenState();
}

class _layoutScreenState extends State<layoutScreen> {
  int selectedindex = 0;
  List pages = [HomeScreen(), ExplorerScreen(), BookmarkScreen()];

  void onItemPressed(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset(HomeDisable),
              activeIcon: SvgPicture.asset(HomeActive),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(StateDisable),
              activeIcon: SvgPicture.asset(StateActive),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(bookDisable),
              activeIcon: SvgPicture.asset(bookActive),
              label: '')
        ],
        currentIndex: selectedindex,
        onTap: onItemPressed,
        backgroundColor: white,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,

      ),
    );
  }
}
