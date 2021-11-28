import 'package:breview/pages/friends_list_page.dart';
import 'package:breview/pages/otp_page.dart';
import 'package:breview/pages/profile_page.dart';
import 'package:breview/pages/profile_search_page.dart';
import 'package:breview/pages/test_page.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    // Icon(
    //   Icons.call,
    //   size: 150,
    // ),
    TestPage(),
    ProfileSearchPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        backgroundColor: Colors.black12,
        selectedIconTheme: IconThemeData(color: Colors.amber[600], size: 24),
        selectedItemColor: Colors.amber[600],
        unselectedIconTheme: IconThemeData(color: Colors.amber[100], size: 24),
        unselectedItemColor: Colors.amber[100],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
