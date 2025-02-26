import 'package:flutter/material.dart';
import 'package:flutter_safe_bd/app_controller/app_controller.dart';
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
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                );
                await Get.find<AppController>().toggleAppTheme();
              },
              icon: Icon(Icons.dark_mode),
            ),
          ],
        ),
        body: SingleChildScrollView(child: Column(children: [])),
      ),
    );
  }
}
