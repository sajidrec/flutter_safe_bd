import 'package:flutter_safe_bd/constants/constant_keys.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomizeMessagePageController extends GetxController {
  String _customMessage = "";

  String get getCustomMessage => _customMessage;

  Future<void> fetchUserCustomizedMessage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _customMessage =
        sharedPreferences.getString(ConstantKeys.customizeMessageKey) ?? "";
    update();
  }

  Future<void> setCustomMessage({required String msg}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(ConstantKeys.customizeMessageKey, msg);
    await fetchUserCustomizedMessage();
  }
}
