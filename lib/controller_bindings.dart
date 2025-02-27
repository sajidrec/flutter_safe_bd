import 'package:flutter_safe_bd/app_controller/app_controller.dart';
import 'package:flutter_safe_bd/presentation/home/controller/home_page_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(HomePageController());
  }
}
