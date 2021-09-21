import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'user_page.dart';
import 'ready_guide.dart';

//底部导航栏实现不同page的切换
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() {
    return _TabNavigatorState();
  }
}

class _TabNavigatorState extends State<TabNavigator> {
  //定义默认状态和点击状态的颜色
  Color _defaultColor = Color(0xff2c5977);
  Color _activeColor = Color(0xffC6DCE4);
  int _currentIndex = 0;

  //定义一个pagecontroller 用于控制指定页面的显示
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
          //添加需要显示的页面
          HomeScreen(),
          UserPage(),
          ReadyGuide(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          //添加底部导航栏
          currentIndex: _currentIndex, //当下点击的条目
          onTap: (index) {
            //点击事件  在点击到指定的图标  改变currentindex
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
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt, color: _defaultColor),
              activeIcon: Icon(Icons.camera_alt, color: _activeColor),
              title: Text(
                'Checklist',
                style: TextStyle(
                    color: _currentIndex != 1 ? _defaultColor : _activeColor),
              ),
            ),
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
