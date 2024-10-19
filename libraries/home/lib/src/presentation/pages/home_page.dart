import 'package:core/locator/locator.dart';
import 'package:feature_flag/feature_flag.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home/src/presentation/widgets/home_page_mobile_widget.dart';

import '../widgets/home_page_web_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteConfig = locator.get<FirebaseFeatureFlag>();
    final string = remoteConfig.getString('app_id_facebook');
    final clientSecret = remoteConfig.getString('app_secret_facebook');
    if (kIsWeb) {
      return HomePageWebWidget(
        appid: string,
        clientSecret: clientSecret,
      );
    } else {
      return HomePageMobileWidget(
        keyFromRemote: string,
      );
    }
  }
}
