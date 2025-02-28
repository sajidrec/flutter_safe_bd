import 'package:flutter_safe_bd/constants/constant_keys.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_theme.dart';

class AppController extends GetxController {
  bool _darkModeOn = false;

  bool get getDarkModeOn => _darkModeOn;

  Future<void> toggleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _darkModeOn =
        !(sharedPreferences.getBool(ConstantKeys.themeModeKey) ?? true);
    await sharedPreferences.setBool(ConstantKeys.themeModeKey, _darkModeOn);

    Get.changeTheme(_darkModeOn ? AppTheme.lightTheme : AppTheme.darkTheme);

    update();
  }

  Future<void> initialThemeSetup() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _darkModeOn = sharedPreferences.getBool(ConstantKeys.themeModeKey) ?? false;

    Get.changeTheme(_darkModeOn ? AppTheme.lightTheme : AppTheme.darkTheme);

    update();
  }
}
