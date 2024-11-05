import 'package:core/entities/customer.dart';
import 'package:flutter/material.dart';

class HomePageMobileWidget extends StatelessWidget {
  final Customer customer;
  const HomePageMobileWidget({
    super.key,
    required this.customer,
  });

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
