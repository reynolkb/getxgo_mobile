import 'package:bloc/bloc.dart';
import 'package:bloc_architecture_app/data/repositories/repository.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginSuccess());

  final LoginRepository repo;

  Future<String> loginUser(String username, String password) async {
    try {
      final successRoute = await repo.loginAttempt(username, password);
      return successRoute;
    } catch (e) {
      throw e;
    }
  }
}
