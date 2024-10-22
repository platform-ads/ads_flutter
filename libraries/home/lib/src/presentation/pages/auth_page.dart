import 'package:core/main.dart';
import 'package:flutter/material.dart';
import 'package:home/src/utils/home_strings.dart';

class AuthPage extends StatelessWidget {
  final String code;
  const AuthPage({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SystemColors.lightGray,
      body: Column(
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
          )),
        ],
      ),
    );
  }
}
