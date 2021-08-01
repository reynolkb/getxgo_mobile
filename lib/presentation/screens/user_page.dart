import 'package:bloc_architecture_app/core/constants/constants.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/message.dart';

import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'checklist_page.dart';
import 'login_page.dart';

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
        title: Text('User logged in - Current User'),
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('Hello, ${snapshot.data![0].username}')),
                    SizedBox(
                      height: 16,
                    ),
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
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 50,
                      child: ElevatedButton(
                        child: const Text('Logout'),
                        onPressed: () => doUserLogout(),
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
