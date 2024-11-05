// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:feature_flag/firebase/firebase_feature_flag.dart';
import 'package:flutter/material.dart';
import 'package:get_it_export/get_it.dart';
import 'package:go_router_export/go_router.dart';
import 'package:material_design_icons_export/material_design_icons.dart';

class HomePageWebWidget extends StatefulWidget {
  const HomePageWebWidget({
    super.key,
  });

  @override
  State<HomePageWebWidget> createState() => _HomePageWebWidgetState();
}

class _HomePageWebWidgetState extends State<HomePageWebWidget> {
  TextEditingController controller = TextEditingController();

  var token = 'token não encontrado';
  var accountsJson = '';

  @override
  Widget build(BuildContext context) {
    final remoteConfig = GetIt.I.get<FirebaseFeatureFlag>();
    final appId = remoteConfig.getString('app_id_facebook');
    final redirectUri = remoteConfig.getString('redirect_uri');
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  context.go("/login");
                },
                child: const Text(
                  'Início',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Graficos',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              IconButton.outlined(
                onPressed: () async {
                  return await _showDialog(
                    context,
                    appId,
                    redirectUri,
                  );
                },
                icon: Icon(MdiIcons.linkVariant),
              ),
              const SizedBox(width: 30)
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text('Home Web'),
          ),
          const SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: 400,
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  label: Text('Insira seu code do link aqui e clique no botão abaixo para validar'),
                ),
                onChanged: (value) {
                  setState(() {
                    controller.text = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
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

  Future<void> _showDialog(BuildContext context, String appId, String redirectUri) {
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
      },
    );
  }
}
