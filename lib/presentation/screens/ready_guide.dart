import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bloc_architecture_app/presentation/screens/user_page.dart';

class ReadyGuide extends StatelessWidget {
  const ReadyGuide({Key? key}) : super(key: key);

  _launchURL() async {
    const url = 'https://getxgo.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL1() async {
    const url = 'https://getxgo.com/products/emergency-go-kit';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL2() async {
    const url = 'https://getxgo.com/products/getxgokit';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
          child: FutureBuilder(
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('\nGet Ready.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff2c5977),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserPage()),
                              );
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset("assets/images/fire.png",
                                    height: 150.0, fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.stretch, // add this
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserPage()),
                              );
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                    "assets/images/earthquake.png",
                                    height: 150.0,
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 200.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            child: GestureDetector(
                              onTap: _launchURL,
                              child: Image.asset(
                                'assets/images/getxgo_shop.png', // On click should redirect to an URL
                                fit: BoxFit.fill,
                              ),
                            ),
                            padding: const EdgeInsets.only(right: 10.0),
                            // width: 180.0,
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: _launchURL1,
                              child: Image.asset(
                                'assets/images/waterproofkit.png', // On click should redirect to an URL
                                // width: 80.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            padding: const EdgeInsets.only(right: 10.0),
                            // width: 180.0,
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: _launchURL2,
                              child: Image.asset(
                                'assets/images/fire_getxgokit.png', // On click should redirect to an URL
                                // width: 80.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            padding: const EdgeInsets.only(right: 10.0),
                            // width: 180.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        // body: SingleChildScrollView(

        //     child: Column(
        //   children: [
        //     Container(
        //       width: double.infinity,
        //       height: 200.0,
        //       decoration: BoxDecoration(
        //           color: Colors.orangeAccent,
        //           border: Border.all(
        //               style: BorderStyle.solid, color: Colors.white)),
        //       child: Center(
        //           child: RichText(
        //         text: TextSpan(
        //           text: 'Earthquake',
        //           children: [
        //             TextSpan(
        //               text:
        //                   '\n\n How to prepare for earthquake \n \n Ready More >>',
        //             ),
        //           ],
        //           style: TextStyle(
        //               fontWeight: FontWeight.bold,
        //               fontSize: 20,
        //               fontFamily: 'Montserrat'),
        //         ),
        //       )),
        //     ),
        //     Container(
        //       width: double.infinity,
        //       decoration: BoxDecoration(
        //           color: Colors.blueAccent,
        //           border: Border.all(
        //               style: BorderStyle.solid, color: Colors.white)),
        //       child: Center(
        //         child: Text("EARTHQUAKE, How to prepare for earthquake."),
        //       ),
        //     ),
        //   ],
        // )
        // ),
      ),
    );
  }
}
