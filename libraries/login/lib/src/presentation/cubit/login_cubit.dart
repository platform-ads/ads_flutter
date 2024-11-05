import 'package:equatable_export/equatable.dart';
import 'package:flutter_bloc_export/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}
