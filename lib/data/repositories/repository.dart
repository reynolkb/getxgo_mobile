import 'package:bloc_architecture_app/data/data_providers/data_provider.dart';

class LoginRepository {
  LoginAPI api = LoginAPI();

  Future<String> loginAttempt(String username, String password) async {
    var response = await api.getLoginAttempt(username, password);

    return response;
  }
}
