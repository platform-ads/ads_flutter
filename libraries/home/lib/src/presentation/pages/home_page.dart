import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home/src/presentation/widgets/home_page_mobile_widget.dart';

import '../widgets/home_page_web_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const HomePageWebWidget();
    } else {
      return const HomePageMobileWidget();
    }
  }
}
