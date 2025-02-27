import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_safe_bd/presentation/home/controller/home_page_controller.dart';
import 'package:flutter_safe_bd/services/permission_service.dart';
import 'package:flutter_safe_bd/theme/app_theme.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _initialPageSetup();
  }

  Future<void> _initialPageSetup() async {
    await PermissionService().checkLocationPermission();
    await Get.find<HomePageController>().fetchCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("SafeBD"),
          actions: [
            IconButton(
              onPressed: () async {
                Get.changeTheme(
                  Get.isDarkMode ? AppTheme.lightTheme : AppTheme.darkTheme,
                );
              },
              icon: Icon(Icons.dark_mode),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: double.infinity,
              child: GetBuilder<HomePageController>(
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Latitude ${controller.getCurrentPosition.latitude}",
                      ),
                      Text(
                        "Longitude ${controller.getCurrentPosition.longitude}",
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: Get.width / 2,
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller.fetchCurrentPosition();
                          },
                          child:
                              controller.getUpdateLocationInProgress
                                  ? Center(child: CircularProgressIndicator())
                                  : Text("Update current location"),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
