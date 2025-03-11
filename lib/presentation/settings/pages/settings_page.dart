import 'package:flutter/material.dart';
import 'package:flutter_safe_bd/routes/app_routes.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Settings")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.customMessage);
                  },
                  child: ListTile(
                    title: Text("Customize message (Whatsapp)"),
                    leading: Image.asset(
                      "assets/icons/whatsapp_icon.png",
                      width: 24,
                      errorBuilder:
                          (context, error, stackTrace) => Text("Whatsapp"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.refreshRate);
                  },
                  child: ListTile(
                    title: Text("Refresh rate"),
                    leading: Icon(Icons.refresh),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
