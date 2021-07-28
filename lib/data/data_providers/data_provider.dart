import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LoginAPI {
  Future<String> getLoginAttempt(String username, String password) async {
    final user = ParseUser(username, password, null);

    var response = await user.login();

    if (response.success) {
      return 'user_page';
    } else {
      return response.error!.message;
    }
  }
}

class SignupAPI {
  Future<String> getSignupAttempt(
    String username,
    String password,
    String email,
  ) async {
    final user = ParseUser.createUser(username, password, email);

    var response = await user.signUp();

    if (response.success) {
      return 'User was successfully created! Please verify your email before Login';
    } else {
      return response.error!.message;
    }
  }
}

class ResetPasswordAPI {
  Future<String> getResetPasswordAttempt(
    String email,
  ) async {
    bool isEmailValid = await doCallCloudEmailExists(email);

    if (isEmailValid) {
      final ParseUser user = ParseUser(null, null, email);
      final ParseResponse parseResponse = await user.requestPasswordReset();

      if (parseResponse.success) {
        return 'Password reset instructions have been sent to email!';
      } else {
        return parseResponse.error!.message;
      }
    } else {
      return 'Email not found in database';
    }
  }
}

dynamic doCallCloudEmailExists(email) async {
  final ParseCloudFunction function = ParseCloudFunction('emailExists');
  final Map<String, dynamic> params = <String, dynamic>{
    'email': email,
  };
  final ParseResponse parseResponse =
      await function.execute(parameters: params);
  if (parseResponse.success) {
    return parseResponse.result;
  }
}
