import 'package:flutter/material.dart';
import 'package:login/src/presentation/widgets/form_field_custom.dart';
import 'package:login/src/utils/login_strings.dart';

class LoginWebWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  LoginWebWidget({super.key});

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
              child: Form(
                key: _formKey,
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FormFieldCustom(
                        controller: _emailEC,
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
                        controller: _passwordEC,
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
                          child: const Text('Esqueceu a sua senha?'),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 35, 15, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF90CAF9),
                              elevation: 2,
                              shadowColor: const Color(0xFF00B0FF)),
                          onPressed: () {},
                          child: const Text(
                            'Entrar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
