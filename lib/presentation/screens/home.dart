import 'package:bloc_architecture_app/core/constants/constants.dart';
import 'package:bloc_architecture_app/presentation/screens/login_page.dart';
import 'package:bloc_architecture_app/presentation/screens/user_page.dart';
import 'package:bloc_architecture_app/presentation/screens/checklist_page.dart';
import 'package:bloc_architecture_app/presentation/screens/ready_guide.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/message.dart';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      Text('\nWelcome to the GetxGo preparedenss app',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff2c5977),
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 50,
                        child: TextButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffC6DCE4),
                          ),
                          child: const Text(
                            '\u{1F6CD} \u{25B6} Shop GetxGo Store',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff2c5977),
                            ),
                          ),
                          onPressed: () async {
                            String url = "https://www.getxgo.com";
                            var urllaunchable = await canLaunch(
                                url); //canLaunch is from url_launcher package
                            if (urllaunchable) {
                              await launch(
                                  url); //launch is from url_launcher package to launch URL
                            } else {
                              print("URL can't be launched.");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
