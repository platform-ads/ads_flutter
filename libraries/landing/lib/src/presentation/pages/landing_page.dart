import 'package:flutter/material.dart';
import 'package:landing/landing.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  SidebarXController sidebarXController = SidebarXController(selectedIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LandingSidebar(
            controller: sidebarXController,
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
                          child: Text('Landing Web'),
                        ),
                        SizedBox(height: 10),
                        SizedBox(height: 10),
                      ],
                    );
                  case 2:
                  case 3:
                  default:
                    return const Text(
                      'Not found page',
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
