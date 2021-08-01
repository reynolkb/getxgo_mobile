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
  Map? checklist;

  Future<String> getSignupAttempt(
    String username,
    String password,
    String email,
  ) async {
    final user = ParseUser.createUser(username, password, email);

    var response = await user.signUp();
    // get objectId and username from parse response

    if (response.success) {
      // without loop so you're only looking at the first one
      // final object1 = response.results?[0] as ParseObject;
      // print('----------------- printing username below ---------------');
      // print(object1.get<String>('username'));

      // loop through response, but there's only 1
      for (var o in response.results ?? []) {
        final object = o as ParseObject;

        Map checklist = new Map();
        // object is user
        checklist['userId'] = object;
        checklist['username'] = object.get<String>('username');
        checklist['passport'] = false;
        checklist['homeInsurance'] = false;
        checklist['autoInsurance'] = false;
        checklist['medicalCard'] = false;
        checklist['socialSecurityCard'] = false;
        checklist['cash'] = false;
        checklist['jacket'] = false;

        print(checklist);

        var newChecklist = ParseObject('Checklist')
          ..set('userId', checklist['userId'])
          ..set('username', checklist['username'])
          ..set('passport', checklist['passport'])
          ..set('homeInsurance', checklist['homeInsurance'])
          ..set('autoInsurance', checklist['autoInsurance'])
          ..set('medicalCard', checklist['medicalCard'])
          ..set('socialSecurityCard', checklist['socialSecurityCard'])
          ..set('cash', checklist['cash'])
          ..set('jacket', checklist['jacket']);

        await newChecklist.save();
      }
      return 'User was successfully created! Please verify your email before Login';
    } else {
      return response.error!.message;
    }
  }

  Future<void> createChecklist(
    String userId,
    String username,
    bool passport,
    bool homeInsurance,
    bool autoInsurance,
    bool medicalCard,
    bool socialSecurityCard,
    bool cash,
    bool jacket,
  ) async {
    var checklist = ParseObject('Checklist')
      ..set('userId', userId)
      ..set('username', username)
      ..set('passport', passport)
      ..set('homeInsurance', homeInsurance)
      ..set('autoInsurance', autoInsurance)
      ..set('medicalCard', medicalCard)
      ..set('socialSecurityCard', socialSecurityCard)
      ..set('cash', cash)
      ..set('jacket', jacket);
    await checklist.save();
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
