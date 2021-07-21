import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'do_user_login_state.dart';

class DoUserLoginCubit extends Cubit<DoUserLoginState> {
  DoUserLoginCubit(param0) : super(DoUserLoginInitial());

  void login(DoUserLoginState user) => emit(user);
}
