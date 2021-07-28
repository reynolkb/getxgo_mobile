import 'package:bloc_architecture_app/core/constants/constants.dart';
import 'package:bloc_architecture_app/presentation/screens/widgets/message.dart';

import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'login_page.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  ParseUser? currentUser;
  bool _isCheckedPassport = false;
  bool _isCheckedAutoInsurance = false;

  Future<ParseUser?> getUser() async {
    currentUser = await ParseUser.currentUser() as ParseUser;
    return currentUser;
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
      body: FutureBuilder<ParseUser?>(
        future: getUser(),
        builder: (context, snapshot) {
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
                  children: <Widget>[
                    Center(child: Text('Hello, ${snapshot.data!.username}')),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorConstants.primaryColor)),
                      child: CheckboxListTile(
                        title: Text('Passport'),
                        value: _isCheckedPassport,
                        onChanged: (bool? value) {
                          setState(() {
                            _isCheckedPassport = value!;
                          });
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorConstants.primaryColor)),
                      child: CheckboxListTile(
                        title: Text('Auto Insurance'),
                        value: _isCheckedAutoInsurance,
                        onChanged: (bool? value) {
                          setState(() {
                            _isCheckedAutoInsurance = value!;
                          });
                        },
                      ),
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
