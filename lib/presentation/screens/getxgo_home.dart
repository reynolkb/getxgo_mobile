import 'package:bloc_architecture_app/core/constants/constants.dart';
import 'package:bloc_architecture_app/presentation/screens/user_page.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/NavBar2.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login_page.dart';

class GetxgoHome extends StatefulWidget {
  @override
  _GetxgoHomeState createState() => _GetxgoHomeState();
}

class _GetxgoHomeState extends State<GetxgoHome> {
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

  ParseUser? currentUser;
  Map? checklist;

  Future<ParseUser?> getUser() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;

    print(currentUser!.get('username'));

    String username = currentUser!.get('username');
    checklist = await getChecklist(username);
    print(checklist);

    return currentUser;
  }

  Future<Map?> getChecklist(username) async {
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('Checklist'));

    parseQuery.whereEqualTo('username', username);
  }

  @override
  Widget build(BuildContext context) {
    void doUserLogout() async {
      var response = await currentUser!.logout();
      if (response.success) {
        Message.showSuccess(
            context: context,
            message: 'User was successfully logout!',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            });
      } else {
        Message.showError(context: context, message: response.error!.message);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/getxgo_white_logo.png",
          fit: BoxFit.contain,
          height: 40,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () => doUserLogout(),
          )
        ],
        backgroundColor: ColorConstants.primaryColor,
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Future.wait([getUser()]),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Container(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator()),
                );
              default:
                var right;
                var ui;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text('\nHello, ${snapshot.data![0].username}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff2c5977),
                            )),
                      ),
                      Text('\nWelcome to the GetxGo preparedness app.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff2c5977),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly, // add this
                        children: <Widget>[
                          Container(
                            height: 200.0,
                            color: Color(0xff2c5977),
                            child: ListTile(
                              
                                onTap: _launchURLfr,
                              dense: true,
                              title: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "\nReadiness Checklist",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                        TextSpan(
                                            text:
                                                "\n\n\nMake copies of your important documents (personal ID cards, Insurance and medical). \n\n",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Montserrat')),
                                        WidgetSpan(
                                          child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Icon(
                                                Icons.read_more_sharp,
                                                size: 50,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
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
                                onTap: _launchURLfr,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('FIRE',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              width: 160.0,
                              color: Color(0xffDF7C39),
                            ),
                            Container(
                              child: GestureDetector(
                                onTap: _launchURLfl,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('FLOOD',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              width: 160.0,
                              color: Color(0xff345D98),
                            ),
                            Container(
                              child: GestureDetector(
                                onTap: _launchURLea,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('EARTHQUAKE',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              width: 160.0,
                              color: Color(0xffEED023),
                            ),
                            Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('HURRICANE',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
                              width: 160.0,
                              color: Color(0xff3A7359),
                            ),
                            Container(
                              // padding: const EdgeInsets.only(right: 10.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('TORNADO',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
                              width: 160.0,
                              color: Color(0xff99B1C9),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        height: 150.0,
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
            }
          },
        ),
      ),
      bottomNavigationBar: NavBar2(),
    );
  }
}
