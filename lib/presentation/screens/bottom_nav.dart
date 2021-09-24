import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'user_page.dart';
import 'ready_guide.dart';
import 'login_page.dart';

//
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() {
    return _TabNavigatorState();
  }
}

class _TabNavigatorState extends State<TabNavigator> {
  Color _defaultColor = Color(0xff2c5977);
  Color _activeColor = Color(0xff2A75A7);
  int _currentIndex = 0;

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //pageview
        controller: _controller,
        children: <Widget>[
          //adding page
          HomeScreen(),
          // UserPage(),
          ReadyGuide(),
          LoginPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          //adding nav bar
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _defaultColor),
              activeIcon: Icon(Icons.home, color: _activeColor),
              title: Text(
                'Home',
                style: TextStyle(
                    color: _currentIndex != 0 ? _defaultColor : _activeColor),
              ),
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.camera_alt, color: _defaultColor),
            //   activeIcon: Icon(Icons.camera_alt, color: _activeColor),
            //   title: Text(
            //     'Checklist',
            //     style: TextStyle(
            //         color: _currentIndex != 1 ? _defaultColor : _activeColor),
            //   ),
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined, color: _defaultColor),
              activeIcon: Icon(Icons.map_outlined, color: _activeColor),
              title: Text(
                'Ready Guide',
                style: TextStyle(
                    color: _currentIndex != 2 ? _defaultColor : _activeColor),
              ),
            ),
          ]),
    );
  }
}
