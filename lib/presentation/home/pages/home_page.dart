import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_safe_bd/app_controller/app_controller.dart';
import 'package:flutter_safe_bd/presentation/home/controller/home_page_controller.dart';
import 'package:flutter_safe_bd/services/permission_service.dart';
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
    await Get.find<AppController>().initialThemeSetup();
    await PermissionService().checkLocationPermission();
    await Get.find<HomePageController>().fetchCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          elevation: 3,

          child: ListView(
            children: [
              DrawerHeader(child: Text("SafeBD")),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Add / Remove trusted contact numbers"),
                  leading: Icon(Icons.people),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Important numbers"),
                  leading: Icon(Icons.star),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.info_outline),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("SafeBD"),
          actions: [
            FittedBox(
              child: Column(
                children: [
                  GetBuilder<HomePageController>(
                    builder: (controller) {
                      return Switch(
                        value: controller.getAutoRefreshButtonOn,
                        onChanged: (value) async {
                          if (value) {
                            await Get.find<HomePageController>()
                                .updateLocationAfterInterval();
                          } else {
                            Get.find<HomePageController>()
                                .stopLocationUpdateInterval();
                          }
                          setState(() {});
                        },
                      );
                    },
                  ),
                  Text("Auto refresh"),
                ],
              ),
            ),
            IconButton(
              onPressed: () async {
                await Get.find<AppController>().toggleTheme();
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
                        width: Get.width / 1.5,
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller.fetchCurrentPosition();
                          },
                          child:
                              controller.getUpdateLocationInProgress
                                  ? Center(child: CircularProgressIndicator())
                                  : Text("Tap to update location"),
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
