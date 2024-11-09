import 'package:core/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_export/flutter_bloc.dart';
import 'package:get_it_export/get_it.dart';
import 'package:go_router_export/go_router.dart';
import 'package:login/src/presentation/cubit/login_cubit.dart';
import 'package:login/src/presentation/widgets/form_field_custom.dart';
import 'package:login/src/utils/login_strings.dart';

class LoginWebWidget extends StatelessWidget {
  LoginWebWidget({super.key});
  final loginCubit = GetIt.I.get<LoginCubit>();

  final _formKey = GlobalKey<FormState>();

  final _username = TextEditingController();

  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade100,
        child: Center(
          child: SizedBox(
            height: 400,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSucess) {
                    context.pushReplacementNamed(
                      '/home',
                      extra: state.customer,
                    );
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: ColoredBox(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FormFieldCustom(
                            controller: _username,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return LoginStrings.validatorUser;
                              }
                              return null;
                            },
                            text: LoginStrings.user,
                          ),
                          const SizedBox(height: 25),
                          FormFieldCustom(
                            controller: _password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return LoginStrings.validatorPassword;
                              }
                              return null;
                            },
                            text: LoginStrings.password,
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text(LoginStrings.forgotPassword),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          StyledButton(
                            action: () {
                              loginCubit.onPressLogin(
                                _username.text,
                                _password.text,
                              );
                            },
                            text: LoginStrings.loginButtonTitle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
