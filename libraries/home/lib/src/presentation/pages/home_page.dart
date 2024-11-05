import 'package:core/entities/customer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home/src/presentation/widgets/home_page_mobile_widget.dart';

import '../widgets/home_page_web_widget.dart';

class HomePage extends StatelessWidget {
  final Customer customer;
  const HomePage({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return HomePageWebWidget(customer: customer);
    } else {
      return HomePageMobileWidget(customer: customer);
    }
  }
}
