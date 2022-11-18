import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vgym/discover.dart';
import 'package:vgym/history.dart';
import 'package:vgym/home_screen.dart';
import 'package:vgym/more.dart';
import 'package:vgym/screens/categories/music.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    const HomeScreen(),
    Discover(),
     HistoryScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.indigo.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 5,
                offset: const Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: SalomonBottomBar(
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.indigo.withOpacity(0.3),
            unselectedItemColor: const Color(0xffC3C4CD),
            onTap: onTabTapped,
            itemShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            items: [
              SalomonBottomBarItem(
                icon: _selectedIndex == 0
                    ? const Icon(
                        Icons.home,
                        color: Colors.indigo,
                      )
                    : const Icon(
                        Icons.home,
                        color: Color(0xffC3C4CD),
                      ),
                title: const Text("Home"),
                selectedColor: Colors.indigo,
                unselectedColor: const Color(0xffC3C4CD),
              ),
              SalomonBottomBarItem(
                icon: _selectedIndex == 1
                    ? const Icon(
                        Icons.disc_full,
                        color: Colors.indigo,
                      )
                    : const Icon(
                        Icons.disc_full,
                        color: Color(0xffC3C4CD),
                      ),
                title: const Text("Discover"),
                selectedColor: Colors.indigo,
                unselectedColor: const Color(0xffC3C4CD),
              ),
              SalomonBottomBarItem(
                icon: _selectedIndex == 2
                    ? const Icon(
                        Icons.history,
                        color: Colors.indigo,
                      )
                    : const Icon(
                        Icons.history,
                        color: Color(0xffC3C4CD),
                      ),
                title: const Text("History"),
                selectedColor: Colors.indigo,
                unselectedColor: const Color(0xffC3C4CD),
              ),
              SalomonBottomBarItem(
                icon: _selectedIndex == 3
                    ? const Icon(
                        Icons.menu,
                        color: Colors.indigo,
                      )
                    : const Icon(
                        Icons.menu,
                        color: Color(0xffC3C4CD),
                      ),
                title: const Text("More"),
                selectedColor: Colors.indigo,
                unselectedColor: const Color(0xffC3C4CD),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
