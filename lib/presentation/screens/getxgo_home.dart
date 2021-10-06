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
  get child => null;

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
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Hello, ${snapshot.data![0].username}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff2c5977),
                            )),
                      ),
                      Text('\nWelcome to the GetxGo preparedness app.\n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff2c5977),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff2c5977),
                              ),
                              padding: EdgeInsets.only(
                                top: 20.0,
                              ),
                              height: 250.0,
                              child: ListTile(
                                dense: true,
                                title: Column(children: <Widget>[
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "Readiness Checklist",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                        TextSpan(
                                            text:
                                                "\n\n\nMake copies of your important documents (personal ID cards, Insurance and medical). \n\n",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontFamily: 'Montserrat')),
                                        WidgetSpan(
                                          child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Image.asset(
                                                'assets/images/arrow_icon.png',
                                                width: 60,
                                                height: 60,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserPage()),
                              );
                            },
                          ), // SizedBox(height: 10),
                          // Container(),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        height: 200.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                child: GestureDetector(
                                  onTap: _launchURLfr,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'FIRE',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffDF7C39),
                                ),
                                width: 200.0,
                              ),
                              onTap: _launchURLfr,
                            ),
                            SizedBox(width: 10),
                            Container(),
                            InkWell(
                              child: Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'FLOOD',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff345D98),
                                ),
                                width: 200.0,
                              ),
                              onTap: _launchURLfl,
                            ),
                            SizedBox(width: 10),
                            Container(),
                            InkWell(
                              child: Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'EARTHQUAKE',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffEED023),
                                ),
                                width: 200.0,
                              ),
                              onTap: _launchURLea,
                            ),
                            SizedBox(width: 10),
                            Container(),
                            InkWell(
                              child: Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'HURRICANE',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff3A7359),
                                ),
                                width: 200.0,
                              ),
                              onTap: _launchURLhr,
                            ),
                            SizedBox(width: 10),
                            Container(),
                            InkWell(
                              child: Container(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'TORNADO',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff99B1C9),
                                ),
                                width: 200.0,
                              ),
                              onTap: _launchURLto,
                            ),
                            SizedBox(width: 10),
                            Container(),
                          ],
                        ),
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
            }
          },
        ),
      ),
      bottomNavigationBar: NavBar2(),
    );
  }
}
