import 'package:flutter_safe_bd/presentation/add_remove_contact_page/pages/add_remove_contact_page.dart';
import 'package:flutter_safe_bd/presentation/home/pages/home_page.dart';
import 'package:flutter_safe_bd/presentation/settings/pages/settings_page.dart';
import 'package:flutter_safe_bd/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.settings, page: () => SettingsPage()),
    GetPage(
      name: AppRoutes.addRemoveContact,
      page: () => AddRemoveContactPage(),
    ),
  ];
}
