import 'package:bloc/bloc.dart';
import 'package:bloc_architecture_app/data/repositories/repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.repo) : super(SignupState());

  final SignupRepository repo;

  Future<String> signupUser(
      String username, String password, String email) async {
    try {
      final response = await repo.signupAttempt(username, password, email);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
