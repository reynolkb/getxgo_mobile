import 'package:bloc/bloc.dart';
import 'package:bloc_architecture_app/data/repositories/repository.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.repo) : super(ResetPasswordState());

  final ResetPasswordRepository repo;

  Future<String> resetPassword(String email) async {
    try {
      final response = await repo.resetPasswordAttempt(email);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
