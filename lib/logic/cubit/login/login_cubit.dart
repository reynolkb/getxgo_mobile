import 'package:bloc/bloc.dart';
import 'package:bloc_architecture_app/data/repositories/repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginState());

  final LoginRepository repo;

  Future<String> loginUser(String username, String password) async {
    try {
      final response = await repo.loginAttempt(username, password);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
