import 'package:flutter/material.dart';
import 'package:flutter_safe_bd/controller_bindings.dart';
import 'package:flutter_safe_bd/routes/app_pages.dart';
import 'package:flutter_safe_bd/routes/app_routes.dart';
import 'package:flutter_safe_bd/theme/app_theme.dart';
import 'package:get/get.dart';

class SafeBD extends StatefulWidget {
  const SafeBD({super.key});

  @override
  State<SafeBD> createState() => _SafeBDState();
}

class _SafeBDState extends State<SafeBD> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      title: "SafeBD",
      getPages: AppPages.pages,
      initialBinding: ControllerBindings(),
    );
  }
}
