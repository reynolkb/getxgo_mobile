// Dummy file

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LoginRepository {
  Future<String> loginAttempt(String username, String password) async {
    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
      return 'user_page';
    } else {
      throw Error;
    }
  }
}
