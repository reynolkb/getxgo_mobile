import 'package:bloc_architecture_app/data/data_providers/data_provider.dart';

class LoginRepository {
  LoginAPI api = LoginAPI();

  Future<String> loginAttempt(
    String username,
    String password,
  ) async {
    var response = await api.getLoginAttempt(username, password);

    return response;
  }
}

class SignupRepository {
  SignupAPI api = SignupAPI();

  Future<String> signupAttempt(
    String username,
    String password,
    String email,
  ) async {
    var response = await api.getSignupAttempt(username, password, email);

    return response;
  }
}

class ResetPasswordRepository {
  ResetPasswordAPI api = ResetPasswordAPI();

  Future<String> resetPasswordAttempt(
    String email,
  ) async {
    var response = await api.getResetPasswordAttempt(email);

    return response;
  }
}
