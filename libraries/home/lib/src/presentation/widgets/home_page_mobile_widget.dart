import 'package:flutter/material.dart';

class HomePageMobileWidget extends StatelessWidget {
  const HomePageMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Home Web'),
          ),
          Center(
            child: Text('Nothing to show'),
          ),
        ],
      ),
    );
  }
}
