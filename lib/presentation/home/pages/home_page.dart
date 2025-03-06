import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_safe_bd/app_controller/app_controller.dart';
import 'package:flutter_safe_bd/presentation/home/controller/home_page_controller.dart';
import 'package:flutter_safe_bd/routes/app_routes.dart';
import 'package:flutter_safe_bd/services/permission_service.dart';
import 'package:get/get.dart';

import '../models/contact_model.dart';

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

  final List<ContactModel> _listOfContacts = [
    ContactModel(
      name: "MD",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Sajid",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
    ContactModel(
      name: "Hossain",
      phoneNumber: "01789511097",
      whatsapp: "01789511097",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          await _buildExitDialog();
        },
        child: Scaffold(
          drawer: _buildDrawer(),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildHeaderSection(),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Tap to SMS all trusted persons"),
                    ),
                    const SizedBox(height: 12),
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder:
                          (context, index) => ListTile(
                            title: Text(_listOfContacts[index].name ?? ""),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone :  ${_listOfContacts[index].phoneNumber ?? ""}",
                                ),
                                Text(
                                  "Whatsapp :  ${_listOfContacts[index].whatsapp ?? ""}",
                                ),
                              ],
                            ),
                            trailing: Wrap(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.message),
                                ),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/icons/whatsapp_icon.png",
                                    width: 24,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Text("Whatsapp"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      itemCount: _listOfContacts.length,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildHeaderSection() {
    return Column(
      children: [
        GetBuilder<HomePageController>(
          builder: (controller) {
            return Text("Latitude ${controller.getCurrentPosition.latitude}");
          },
        ),
        GetBuilder<HomePageController>(
          builder: (controller) {
            return Text("Longitude ${controller.getCurrentPosition.longitude}");
          },
        ),
        const SizedBox(height: 10),
        GetBuilder<HomePageController>(
          builder: (controller) {
            return SizedBox(
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
            );
          },
        ),
      ],
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      elevation: 3,
      child: ListView(
        children: [
          DrawerHeader(child: Text("SafeBD")),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.addRemoveContact);
            },
            child: ListTile(
              title: Text("Add / Remove trusted contact numbers"),
              leading: Icon(Icons.people),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.importantNumbers);
            },
            child: ListTile(
              title: Text("Important numbers"),
              leading: Icon(Icons.star),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.settings);
            },
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
    );
  }

  Future<dynamic> _buildExitDialog() async {
    return await Get.dialog(
      barrierDismissible: true,
      AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you really want to exit?'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: Text('Exit'),
          ),
        ],
      ),
    );
  }
}
