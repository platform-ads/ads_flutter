import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login/src/presentation/widgets/login_web_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return LoginWebWidget();
    } else {
      return const Placeholder();
    }
  }
}
