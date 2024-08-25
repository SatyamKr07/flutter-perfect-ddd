import 'package:flutter/material.dart';
import 'package:flutter_perfect_ddd/presentation/pages/some_actions/some_actions.dart';
import '../anime/anime_page.dart';
import '../fly_with_flutter/fly_with_flutter.dart';
import '../profile/profile_page.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  // Create instances once
  final List<Widget> _widgetOptions = <Widget>[
    const AnimePage(),
    SomeActons(),
    FlyWithFlutter(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Anime',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Some Actions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: 'Fly With Flutter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
