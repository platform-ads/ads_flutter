// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:developer';

import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:home/src/presentation/widgets/copy_text_widget.dart';

class HomePageWebWidget extends StatefulWidget {
  const HomePageWebWidget({
    super.key,
    required this.appid,
    required this.clientSecret,
  });
  final String appid;
  final String clientSecret;

  @override
  State<HomePageWebWidget> createState() => _HomePageWebWidgetState();
}

class _HomePageWebWidgetState extends State<HomePageWebWidget> {
  var token = 'token não encontrado';
  var accountsJson = '';
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
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
                  return await _showDialog(context);
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
          Center(
            child: ElevatedButton(
              child: const Text('Validar o token'),
              onPressed: () => getFacebookAccessToken(controller.text),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: CopyTextWidget(
              textToCopy: token,
              label: 'Copiar token',
            ),
          ),
          const Divider(),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              child: const Text('Trazer conta Ad'),
              onPressed: () => getFacebookAdAccounts(token),
            ),
          ),
          Text('Json valido = ${accountsJson.isEmpty ? false : true}'),
          Center(
            child: CopyTextWidget(
              textToCopy: accountsJson,
              label: 'Copiar Json de conta Ad',
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> loginWithFacebook() async {
    const redirectUri = 'https://platform-ads-flutter.web.app/'; // URL de redirecionamento
    const scope =
        'ads_read,read_insights,read_page_mailboxes,pages_read_engagement,pages_show_list,pages_read_user_content,commerce_account_read_orders,commerce_account_read_reports,commerce_account_read_settings,instagram_shopping_tag_products,leads_retrieval,pages_manage_ads,page_events,pages_manage_cta,pages_manage_engagement,pages_manage_posts,pages_messaging,pages_manage_metadata,pages_manage_instant_articles,whatsapp_business_messaging,instagram_basic,business_management,catalog_management,commerce_account_manage_orders,ads_management,whatsapp_business_management,instagram_manage_messages,instagram_manage_insights,instagram_manage_events,instagram_manage_comments,instagram_content_publish';
    // Redirecionar para a página de login do Facebook
    final url = 'https://www.facebook.com/v16.0/dialog/oauth?'
        'client_id=${widget.appid}&'
        'redirect_uri=$redirectUri&'
        'scope=$scope';

    return html.window.location.href = url;
  }

  Future<void> getAccessToken() async {
    // Redirecionar para a página de login do Facebook
    await loginWithFacebook();
  }

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Integrações'),
          actions: [
            ElevatedButton(
              onPressed: () => loginWithFacebook(),
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

  Future<String?> getFacebookAccessToken(String code) async {
    const redirectUri = 'https://platform-ads-flutter.web.app/';

    final dio = Dio();

    try {
      final response = await dio.get(
        'https://graph.facebook.com/v13.0/oauth/access_token',
        queryParameters: {
          'client_id': widget.appid,
          'redirect_uri': redirectUri,
          'client_secret': widget.clientSecret,
          'code': code,
        },
      );

      if (response.statusCode == 200) {
        final accessToken = response.data['access_token'];
        log('Access Token: $accessToken');
        setState(() {
          token = accessToken;
        });
        return accessToken;
      } else {
        log('Failed to get access token: ${response.data}');
        return null;
      }
    } catch (e) {
      log('Error fetching access token: $e');
      return null;
    }
  }

  Future<void> getFacebookAdAccounts(String accessToken) async {
    final dio = Dio();

    try {
      final response = await dio.get(
        'https://graph.facebook.com/v13.0/me/adaccounts',
        queryParameters: {
          'access_token': accessToken,
          'fields': 'id,name,account_status', // Campos que você quer retornar
        },
      );

      if (response.statusCode == 200) {
        log('Ad Accounts: ${response.data}');
        setState(() {
          accountsJson = response.data.toString();
        });
      } else {
        log('Failed to fetch ad accounts: ${response.data}');
      }
    } catch (e) {
      log('Error fetching ad accounts: $e');
    }
  }
}
