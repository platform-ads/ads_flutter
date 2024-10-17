import 'package:flutter/material.dart';

class HomePageMobileWidget extends StatelessWidget {
  const HomePageMobileWidget({super.key, required this.keyFromRemote});
  final String keyFromRemote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Home Web'),
          ),
          Center(
            child: Text(keyFromRemote),
          ),
        ],
      ),
    );
  }
}
