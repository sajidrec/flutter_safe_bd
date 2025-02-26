import 'package:flutter/material.dart';
import 'package:flutter_safe_bd/constants/constant_keys.dart';
import 'package:flutter_safe_bd/controller_bindings.dart';
import 'package:flutter_safe_bd/routes/app_pages.dart';
import 'package:flutter_safe_bd/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SafeBD extends StatefulWidget {
  const SafeBD({super.key});

  @override
  State<SafeBD> createState() => _SafeBDState();
}

class _SafeBDState extends State<SafeBD> {
  bool darkThemeEnabled = false;

  @override
  void initState() {
    super.initState();
    _initialPageSetup();
  }

  Future<void> _initialPageSetup() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    darkThemeEnabled =
        sharedPreferences.getBool(ConstantKeys.isDarkModeKey) ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: darkThemeEnabled ? ThemeMode.dark : ThemeMode.light,
      initialRoute: AppRoutes.home,
      title: "SafeBD",
      getPages: AppPages.pages,
      initialBinding: ControllerBindings(),
    );
  }
}
