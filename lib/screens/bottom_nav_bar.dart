import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vibhu_epics/screens/location.dart';
import 'package:vibhu_epics/screens/profile.dart';
import 'package:vibhu_epics/screens/recieve.dart';

import 'home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Profile profile;
  late Recieve receive;
  late Location location;

  @override
  void initState() {
    homepage = const Home();
    receive = const Recieve();
    location = const Location();
    profile = const Profile();
    pages = [homepage, receive, location, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          setState(
            () {
              currentTabIndex = index;
            },
          );
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.call_received_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.location_on_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
