part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucess extends LoginState {
  final Customer customer;

  const LoginSucess(this.customer);
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);
}
