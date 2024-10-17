import 'package:flutter/material.dart';

class HomePageWebWidget extends StatelessWidget {
  const HomePageWebWidget({
    super.key,
    required this.keyFromRemote,
  });
  final String keyFromRemote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
