import 'package:bloc_architecture_app/core/constants/constants.dart';
import 'package:bloc_architecture_app/logic/cubit/signup/signup_cubit.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/NavBar2.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/message.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://flutter.dev';

class ReadyGuide extends StatefulWidget {
  @override
  _ReadyGuideState createState() => _ReadyGuideState();
}

class _ReadyGuideState extends State<ReadyGuide> {
  _launchURLea() async {
    const url = 'https://getxgo.com/pages/how-to-be-prepared-for-earthquake';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLfl() async {
    const url = 'https://getxgo.com/pages/how-to-be-prepared-for-flood';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLfr() async {
    const url = 'https://getxgo.com/pages/how-to-be-prepared-for-fire';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLhr() async {
    const url = 'https://getxgo.com/pages/how-to-prepare-for-an-hurricane';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLto() async {
    const url = 'https://getxgo.com/pages/how-to-prepare-for-an-tornado';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL() async {
    const url = 'https://getxgo.com/collections/all-products';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL1() async {
    const url =
        'https://getxgo.com/products/emergency-go-kit?variant=39397935775817';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL2() async {
    const url = 'https://getxgo.com/products/getxgokit?variant=39351217815625';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ready Guide'),
        backgroundColor: ColorConstants.primaryColor,
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('\nGet Ready for the Unknown.\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2c5977),
                      )),
                  Column(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffDF7C39)),
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          height: 180.0,
                          child: ListTile(
                            dense: true,
                            title: Column(children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "FIRE",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')),
                                    TextSpan(
                                        text:
                                            "\n\n\nHow to prepare for a Fire. \n\n",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Montserrat')),
                                    WidgetSpan(
                                      child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Image.asset(
                                            'assets/images/arrow_icon.png',
                                            width: 50,
                                            height: 50,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                        onTap: _launchURLfr,
                      ),
                      SizedBox(height: 10),
                      Container(),
                      SizedBox(height: 10),
                      Container(),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff345D98),
                          ),
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          height: 180.0,
                          child: ListTile(
                            dense: true,
                            title: Column(children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "FLOOD",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')),
                                    TextSpan(
                                        text:
                                            "\n\n\nHow to prepare for a Flood. \n\n",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Montserrat')),
                                    WidgetSpan(
                                      child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Image.asset(
                                            'assets/images/arrow_icon.png',
                                            width: 50,
                                            height: 50,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                        onTap: _launchURLfl,
                      ),
                      SizedBox(height: 10),
                      Container(),
                      SizedBox(height: 10),
                      Container(),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffEED023),
                          ),
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          height: 180.0,
                          child: ListTile(
                            dense: true,
                            title: Column(children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "EARTHQUAKE",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')),
                                    TextSpan(
                                        text:
                                            "\n\n\nHow to prepare for an Earthquake. \n\n",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Montserrat')),
                                    WidgetSpan(
                                      child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Image.asset(
                                            'assets/images/arrow_icon.png',
                                            width: 50,
                                            height: 50,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                        onTap: _launchURLea,
                      ),
                      SizedBox(height: 10),
                      Container(),
                      SizedBox(height: 10),
                      Container(),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff3A7359),
                          ),
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          height: 180.0,
                          child: ListTile(
                            dense: true,
                            title: Column(children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "HURRICANE",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')),
                                    TextSpan(
                                        text:
                                            "\n\n\nHow to prepare for a Hurricane. \n\n",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Montserrat')),
                                    WidgetSpan(
                                      child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Image.asset(
                                            'assets/images/arrow_icon.png',
                                            width: 50,
                                            height: 50,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                        onTap: _launchURLhr,
                      ),
                      SizedBox(height: 10),
                      Container(),
                      SizedBox(height: 10),
                      Container(),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xff99B1C9),
                          ),
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          height: 180.0,
                          child: ListTile(
                            dense: true,
                            title: Column(children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "TORNADO",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')),
                                    TextSpan(
                                        text:
                                            "\n\n\nHow to prepare for a Tornado. \n\n",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Montserrat')),
                                    WidgetSpan(
                                      child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Image.asset(
                                            'assets/images/arrow_icon.png',
                                            width: 50,
                                            height: 50,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                        onTap: _launchURLto,
                      ),
                      SizedBox(height: 10),
                      Container(),
                      SizedBox(height: 10),
                      Container(),
                    ],
                  ),
                  Container(
                    height: 200.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          child: ListTile(
                            dense: true,
                            title: Column(children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                        child: GestureDetector(
                                      onTap: _launchURL,
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.shopping_bag_outlined,
                                            size: 50,
                                            color: Color(0xff2c5977),
                                          )),
                                    )),
                                    TextSpan(
                                        text: "GetxGo",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff2c5977),
                                            fontFamily: 'Montserrat')),
                                    TextSpan(
                                        text: "Shop",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff2c5977),
                                            fontFamily: 'Montserrat')),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffC6DCE4),
                          ),
                          width: 100.0,
                        ),
                        SizedBox(width: 10),
                        Container(),
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: ListTile(
                            dense: true,
                            title: Column(children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: GestureDetector(
                                        onTap: _launchURL1,
                                        child: Image.asset(
                                          'assets/images/waterproofkit.png', // On click should redirect to an URL

                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                        text: "Waterproof",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff2c5977),
                                            fontFamily: 'Montserrat')),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffC6DCE4),
                          ),
                          width: 150.0,
                        ),
                        SizedBox(width: 10),
                        Container(),
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: ListTile(
                            dense: true,
                            title: Column(children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: GestureDetector(
                                        onTap: _launchURL2,
                                        child: Image.asset(
                                          'assets/images/fire_getxgokit.png', // On click should redirect to an URL

                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                        text: "Water/Fire-resistant",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff2c5977),
                                            fontFamily: 'Montserrat')),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              )
                            ]),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffC6DCE4),
                          ),
                          width: 150.0,
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
      // bottomNavigationBar: NavBar2(),
    );
  }
}
