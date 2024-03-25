import 'package:flutter/material.dart';
import 'package:my_utils_app/common/utils/nav.dart';
import 'package:my_utils_app/info/info.constants.dart';
import 'package:my_utils_app/info/info.dialog.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int _selectedIndex = 0;
  final int _infoIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == _infoIndex) {
      List<Widget> actions = [
        TextButton(
          onPressed: () {
            pop(context);
          },
          child: const Text("ENTENDI"),
        )
      ];
      infoDialog(
        context,
        DEFAULT_INFO_MESSAGE,
        actions: actions,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            activeIcon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            activeIcon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
