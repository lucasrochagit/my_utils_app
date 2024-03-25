import 'package:flutter/material.dart';
import 'package:my_utils_app/home/home_bottom_navigation_bar.dart';
import 'package:my_utils_app/home/home_drawer_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _bottomTabBarController;

  @override
  void initState() {
    super.initState();
    _initTabs();
  }

  _initTabs() async {
    _bottomTabBarController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _bottomTabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text(
          "Meus Utilitários",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: HomeDrawerList(
        withHeader: true,
      ),
      body: HomeDrawerList(),
      bottomNavigationBar: const HomeBottomNavigationBar(),
    );
  }
}
