import 'package:conduit_application/view/1.dart';
import 'package:conduit_application/view/2.dart';
import 'package:conduit_application/view/3.dart';
import 'package:flutter/material.dart';

class PageMain extends StatefulWidget {
  static const routeName = '/PageMain';
  const PageMain({super.key});

  @override
  State<PageMain> createState() => _PageMainState();
}



class _PageMainState extends State<PageMain> {
  int _currentIndex = 0;
  final List<Widget> _pages = [PageHome(), PageAllNotes(), ThreePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
      body: _pages[_currentIndex],
    );
  }
}
