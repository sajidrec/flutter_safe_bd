import 'package:flutter_safe_bd/app_controller/app_controller.dart';
import 'package:flutter_safe_bd/presentation/add_remove_contact_page/controllers/add_remove_contact_page_controller.dart';
import 'package:flutter_safe_bd/presentation/home/controller/home_page_controller.dart';
import 'package:get/get.dart';

import 'presentation/refresh_rate/controllers/refresh_rate_page_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(HomePageController());
    Get.put(AddRemoveContactPageController());
    Get.put(RefreshRatePageController());
  }
}
