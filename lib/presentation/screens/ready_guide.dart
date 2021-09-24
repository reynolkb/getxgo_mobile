import 'package:bloc_architecture_app/core/constants/constants.dart';
import 'package:bloc_architecture_app/logic/cubit/signup/signup_cubit.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/message.dart';
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

  _launchURL() async {
    const url = 'https://getxgo.com/collections/all-products';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\nGet Ready for the Unknown.\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2c5977),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                        ),
                        child: GestureDetector(
                          onTap: _launchURLfr,
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset("assets/images/fire.png",
                                  height: 150.0, fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                        ),
                        child: GestureDetector(
                          onTap: _launchURLea,
                          child: Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset("assets/images/earthquake.png",
                                  height: 150.0, fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // add this
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                        ),
                        child: GestureDetector(
                          onTap: _launchURLfl,
                          child: Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset("assets/images/flood.png",
                                  height: 150.0, fit: BoxFit.fill),
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
    );
  }
}
