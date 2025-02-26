import 'package:flutter_safe_bd/constants/constant_keys.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  Future<void> toggleAppTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    bool isDarkModeOn =
        sharedPreferences.getBool(ConstantKeys.isDarkModeKey) ?? false;

    await sharedPreferences.setBool(ConstantKeys.isDarkModeKey, !isDarkModeOn);

    update();
  }
}
