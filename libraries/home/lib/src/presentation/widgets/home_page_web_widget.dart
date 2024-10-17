import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';

class HomePageWebWidget extends StatelessWidget {
  const HomePageWebWidget({super.key});

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
                  'Grafícos',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              IconButton.outlined(
                onPressed: () async {
                  return await _showDialog(context);
                },
                icon: const Icon(Icons.link_outlined),
              ),
              const SizedBox(
                width: 30,
              )
            ],
          )
        ],
      ),
      body: const Column(
        children: [
          Center(
            child: Text('Home Web'),
          ),
        ],
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: AlertDialog(
              title: const Text('Integrações'),
              actions: [
                FacebookAuthButton(
                  text: 'Integrar com o Facebook ADS',
                  onPressed: () {},
                ),
                GoogleAuthButton(
                  text: 'Integrar com o Google ADS',
                  onPressed: () {},
                ),
              ],
            ),
          );
        });
  }
}
