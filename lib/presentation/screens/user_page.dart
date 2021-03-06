import 'package:bloc_architecture_app/core/constants/constants.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/NavBar2.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/message.dart';

import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'checklist_page.dart';
import 'login_page.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://flutter.dev';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
    final apiResponse = await parseQuery.query();

    if (apiResponse.success) {
      for (var o in apiResponse.results ?? []) {
        final object = o as ParseObject;

        Map checklist = new Map();
        checklist['objectId'] = object.get<String>('objectId');
        checklist['passport'] = object.get<bool>('passport');
        checklist['homeInsurance'] = object.get<bool>('homeInsurance');
        checklist['autoInsurance'] = object.get<bool>('autoInsurance');
        checklist['medicalCard'] = object.get<bool>('medicalCard');
        checklist['socialSecurityCard'] =
            object.get<bool>('socialSecurityCard');
        checklist['cash'] = object.get<bool>('cash');
        checklist['jacket'] = object.get<bool>('jacket');

        return checklist;
      }
    }
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
      body: FutureBuilder(
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
              return new SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text('Hello, ${snapshot.data![0].username}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2c5977),
                          )),
                    ),
                    SizedBox(height: 10),
                    Container(),
                    Container(
                      padding: EdgeInsets.only(
                        top: 5.0,
                      ),
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        color: Color((0xffF4F4F5)),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),

                      // height: 200.0,
                      child: ListTile(
                        dense: true,
                        title: Column(children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Step 1: Complete your checklist.",
                                    style: TextStyle(
                                        color: Color(0xff2c5977),
                                        fontSize: 14,
                                        fontFamily: 'Montserrat')),
                                TextSpan(
                                    text:
                                        "\nStep 2: Make copies of important documents.",
                                    style: TextStyle(
                                        color: Color(0xff2c5977),
                                        fontSize: 14,
                                        fontFamily: 'Montserrat')),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(),
                    Checklist(
                      objectId: checklist!['objectId'],
                      passport: checklist!['passport'],
                      homeInsurance: checklist!['homeInsurance'],
                      autoInsurance: checklist!['autoInsurance'],
                      medicalCard: checklist!['medicalCard'],
                      socialSecurityCard: checklist!['socialSecurityCard'],
                      cash: checklist!['cash'],
                      jacket: checklist!['jacket'],
                    ),
                    // Container(
                    //   height: 50,
                    //   child: TextButton(
                    //     child: const Text(
                    //       'Shop GetxGo Store',
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.bold,
                    //         color: Color(0xff2c5977),
                    //       ),
                    //     ),
                    //     onPressed: () async {
                    //       String url = "https://www.getxgo.com";
                    //       var urllaunchable = await canLaunch(
                    //           url); //canLaunch is from url_launcher package
                    //       if (urllaunchable) {
                    //         await launch(
                    //             url); //launch is from url_launcher package to launch URL
                    //       } else {
                    //         print("URL can't be launched.");
                    //       }
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              );
          }
        },
      ),
      bottomNavigationBar: NavBar2(),
    );
  }
}
