import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: EdgeInsets.only(top: 5, bottom: 30),
      color: Color(0xff2c5977),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              size: 44.0,
              color: Colors.white,
            ),
            onPressed: () {
              // print("Home Pressed");
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.map_outlined,
              size: 44.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'ready_guide');
            },
          ),
        ],
      ),
    );
  }
}
