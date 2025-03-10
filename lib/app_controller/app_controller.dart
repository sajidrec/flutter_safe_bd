import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constant_keys.dart';
import '../theme/app_theme.dart';

class AppController extends GetxController {
  bool _darkModeOn = false;

  bool get getDarkModeOn => _darkModeOn;

  Future<void> toggleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    _darkModeOn = !_darkModeOn;

    await sharedPreferences.setBool(ConstantKeys.themeModeKey, _darkModeOn);

    Get.changeTheme(_darkModeOn ? AppTheme.darkTheme : AppTheme.lightTheme);

    update();
  }

  Future<void> initialThemeSetup() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    _darkModeOn = sharedPreferences.getBool(ConstantKeys.themeModeKey) ?? false;

    Get.changeTheme(_darkModeOn ? AppTheme.darkTheme : AppTheme.lightTheme);

    update();
  }
}
