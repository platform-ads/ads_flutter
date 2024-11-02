import 'package:core/main.dart';
import 'package:feature_flag/firebase/firebase_feature_flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_export/flutter_bloc.dart';
import 'package:get_it_export/get_it.dart';
import 'package:go_router_export/go_router.dart';
import 'package:home/src/presentation/cubit/auth/auth_cubit.dart';
import 'package:home/src/utils/home_strings.dart';

class AuthPage extends StatefulWidget {
  final String code;
  const AuthPage({super.key, required this.code});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final authCubit = GetIt.I.get<AuthCubit>();
  final remoteConfig = GetIt.I.get<FirebaseFeatureFlag>();
  @override
  void initState() {
    _sendCodeToApi();
    super.initState();
  }

  Future<void> _sendCodeToApi() async {
    final appId = remoteConfig.getString('app_id_facebook');
    final clientSecret = remoteConfig.getString('app_secret_facebook');
    await authCubit.sendCode(
      code: widget.code,
      appId: appId,
      clientSecret: clientSecret,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SystemColors.lightGray,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.pushReplacementNamed('/');
          }
        },
        builder: (context, state) {
          if (state is AuthError) {
            return Column(
              children: [
                const SizedBox(height: 100),
                Center(
                  child: Container(
                    width: 400,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: SystemColors.lightest,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            HomeStrings.errorMessage,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            HomeStrings.errorDescription,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 20),
                          StyledButton(
                            text: HomeStrings.buttonback,
                            action: () {
                              context.pushReplacementNamed('/');
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                const SizedBox(height: 100),
                Center(
                  child: Container(
                    width: 400,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: SystemColors.lightest,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            HomeStrings.titleMessage,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          StyledButton(
                            text: HomeStrings.buttonback,
                            action: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
