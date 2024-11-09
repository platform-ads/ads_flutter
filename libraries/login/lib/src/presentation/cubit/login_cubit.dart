import 'package:core/entities/customer.dart';
import 'package:equatable_export/equatable.dart';
import 'package:flutter_bloc_export/flutter_bloc.dart';
import 'package:login/src/domain/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  LoginCubit(this.loginRepository) : super(LoginInitial());

  Future<void> onPressLogin(String username, String password) async {
    emit(LoginLoading());
    final response = await loginRepository.getLogin(username, password);
    if (response != null) {
      emit(
        LoginSucess(response),
      );
    } else {
      emit(const LoginFailure('Erro ao conectar'));
    }
  }
}
