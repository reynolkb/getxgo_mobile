import 'package:flutter/material.dart';

class NavBar1 extends StatelessWidget {
  const NavBar1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: EdgeInsets.only(top: 5, bottom: 30),
      color: Color(0xffF4F8FA),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.home, size: 30.0, color: Color(0xff2C5977)),
            onPressed: () {
              // print("Home Pressed");
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
          IconButton(
            icon:
                Icon(Icons.map_outlined, size: 30.0, color: Color(0xff2C5977)),
            onPressed: () {
              Navigator.pushNamed(context, 'ready_guide');
            },
          ),
        ],
      ),
    );
  }
}
