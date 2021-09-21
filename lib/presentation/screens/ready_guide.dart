import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ReadyGuide extends StatelessWidget {
  const ReadyGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ready Guides'),
          backgroundColor: Color(0xff2c5977),
          brightness: Brightness.dark,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  border: Border.all(
                      style: BorderStyle.solid, color: Colors.white)),
              child: Center(
                  child: RichText(
                text: TextSpan(
                  text: 'Earthquake',
                  children: [
                    TextSpan(
                      text:
                          '\n\n How to prepare for earthquake \n \n Ready More >>',
                    ),
                  ],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Montserrat'),
                ),
              )),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(
                      style: BorderStyle.solid, color: Colors.white)),
              child: Center(
                child: Text("EARTHQUAKE, How to prepare for earthquake."),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
