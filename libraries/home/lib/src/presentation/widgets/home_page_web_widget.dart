// ignore_for_file: use_build_context_synchronously

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:core/entities/customer.dart';
import 'package:core/utils/system_colors.dart';
import 'package:feature_flag/firebase/firebase_feature_flag.dart';
import 'package:flutter/material.dart';
import 'package:get_it_export/get_it.dart';
import 'package:home/src/utils/home_strings.dart';
import 'package:landing/landing.dart';
import 'package:material_design_icons_export/material_design_icons.dart';
import 'package:secure_storage/secure_storage.dart';

class HomePageWebWidget extends StatefulWidget {
  final Customer customer;
  const HomePageWebWidget({
    required this.customer,
    super.key,
  });

  @override
  State<HomePageWebWidget> createState() => _HomePageWebWidgetState();
}

class _HomePageWebWidgetState extends State<HomePageWebWidget> {
  TextEditingController controller = TextEditingController();
  SidebarXController sidebarXController = SidebarXController(selectedIndex: 0);

  var token = 'token não encontrado';
  var accountsJson = '';

  final remoteConfig = GetIt.I.get<FirebaseFeatureFlag>();
  final secureStorage = GetIt.I.get<SecureStorageService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appId = remoteConfig.getString('app_id_facebook');
    final redirectUri = remoteConfig.getString('redirect_uri');
    if (widget.customer.firstLogin == true && widget.customer.role == HomeStrings.homeCompanyAdminRole) {
      Future.delayed(const Duration(milliseconds: 500), () async {
        if (context.mounted) {
          await _showDialog(context, appId, redirectUri);
        }
      });
    }

    return Scaffold(
      backgroundColor: SystemColors.scaffoldBackgroundColor,
      body: Row(
        children: [
          HomeSidebar(
            controller: sidebarXController,
            openDialog: () async => await _showDialog(context, appId, redirectUri),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: sidebarXController,
              builder: (context, child) {
                switch (sidebarXController.selectedIndex) {
                  case 0:
                    return const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text('Home Web'),
                        ),
                        SizedBox(height: 10),
                      ],
                    );
                  case 1:
                  default:
                    return const Text(
                      'Page not created yet ',
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> loginWithFacebook(String appId, String redirectUri) async {
    const scope =
        'ads_read,read_insights,read_page_mailboxes,pages_read_engagement,pages_show_list,pages_read_user_content,commerce_account_read_orders,commerce_account_read_reports,commerce_account_read_settings,instagram_shopping_tag_products,leads_retrieval,pages_manage_ads,page_events,pages_manage_cta,pages_manage_engagement,pages_manage_posts,pages_messaging,pages_manage_metadata,pages_manage_instant_articles,whatsapp_business_messaging,instagram_basic,business_management,catalog_management,commerce_account_manage_orders,ads_management,whatsapp_business_management,instagram_manage_messages,instagram_manage_insights,instagram_manage_events,instagram_manage_comments,instagram_content_publish';
    // Redirecionar para a página de login do Facebook
    final url = 'https://www.facebook.com/v16.0/dialog/oauth?'
        'client_id=$appId&'
        'redirect_uri=$redirectUri&'
        'scope=$scope';

    return html.window.location.href = url;
  }

  Future<void> _showDialog(BuildContext context, String appId, String redirectUri) async {
    await secureStorage.write('user_id', widget.customer.userId);

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Integrações'),
            actions: [
              ElevatedButton(
                onPressed: () => loginWithFacebook(
                  appId,
                  redirectUri,
                ),
                child: Row(
                  children: [
                    const Text('Integrar com o Facebook ADS'),
                    const SizedBox(width: 10),
                    Icon(MdiIcons.facebook),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
