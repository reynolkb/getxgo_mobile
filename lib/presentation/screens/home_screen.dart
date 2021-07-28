import 'package:bloc_architecture_app/core/constants/constants.dart';
import 'package:bloc_architecture_app/presentation/screens/login_page.dart';
import 'package:bloc_architecture_app/presentation/screens/user_page.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class HomeScreen extends StatelessWidget {
  Future<bool> hasUserLogged() async {
    //return Future.value(false);
    ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
    if (currentUser == null) {
      return false;
    }
    //Checks whether the user's session token is valid
    final ParseResponse? parseResponse =
        await ParseUser.getCurrentUserFromServer(currentUser.sessionToken!);
    if (parseResponse?.success == null || !parseResponse!.success) {
      //Invalid session. Logout
      await currentUser.logout();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: hasUserLogged(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Scaffold(
                body: Center(
                  child: Container(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator()),
                ),
              );
            default:
              if (snapshot.hasData && snapshot.data!) {
                return UserPage();
              } else {
                return LoginPage();
              }
          }
        },
      ),
    );
  }
}
