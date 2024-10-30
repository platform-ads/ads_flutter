import 'package:cargo/cargo.dart';
import 'package:core/utils/system_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router_export/go_router.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../utils/landing_strings.dart';

class HomeSidebar extends StatefulWidget {
  final SidebarXController controller;
  final Function() openDialog;

  const HomeSidebar({
    super.key,
    required this.controller,
    required this.openDialog,
  });

  @override
  State<HomeSidebar> createState() => _HomeSidebarState();
}

class _HomeSidebarState extends State<HomeSidebar> {
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: SystemColors.canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(color: Colors.white),
        selectedTextStyle: const TextStyle(color: SystemColors.blueMedium),
        selectedIconTheme: const IconThemeData(
          color: SystemColors.blueMedium,
          size: 20,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: SystemColors.canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: SystemColors.actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [SystemColors.accentCanvasColor, SystemColors.canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: SystemColors.canvasColor,
        ),
        margin: EdgeInsets.only(right: 10),
      ),
      footerDivider: Divider(color: SystemColors.lightest.withOpacity(0.3), height: 1),
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(CargoIllustrations.images.avatar), //TODO (rodrigo): check why not loading image here
          ),
        );
      },
      controller: widget.controller,
      items: [
        const SidebarXItem(icon: Icons.home, label: LandingStrings.home),
        const SidebarXItem(icon: Icons.bar_chart, label: LandingStrings.charts),
        SidebarXItem(
          icon: Icons.integration_instructions,
          label: LandingStrings.integrations,
          selectable: false,
          onTap: widget.openDialog,
        ),
        SidebarXItem(
          icon: Icons.exit_to_app,
          label: LandingStrings.exit,
          selectable: false,
          onTap: () => context.pushReplacementNamed('/'),
        ),
      ],
    );
  }
}